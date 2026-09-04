module Page.SPLAT__ exposing (Model, Msg, Data, page)

import List.Extra exposing (find)
import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import View exposing (View)
import DataSource.File
import OptimizedDecoder as Decode exposing (Decoder)
import Html
import LanguageTag

import SiteMarkdown

type alias Model = ()
type alias Msg = Never

type alias RouteParams =
    { splat : List String }

type alias MDPage =
    { body : String
    , title : String
    , description : String
    , lang : Maybe String
    , fileInfo : SiteMarkdown.MarkdownFile
    }

type alias Data = MDPage

mdpages : DataSource (List MDPage)
mdpages =
    SiteMarkdown.mdFiles "content/"
        |> DataSource.map
            (List.map
                (\mdpage ->
                    DataSource.File.bodyWithFrontmatter
                        (mdDecoder mdpage)
                        mdpage.path
                )
            )
        |> DataSource.resolve



mdDecoder : SiteMarkdown.MarkdownFile -> String -> Decoder MDPage
mdDecoder finfo body =
    Decode.map3
        (\title description lang ->
            { fileInfo = finfo
            , lang = lang
            , title = title
            , description =
                case description of
                    Just meta ->
                        meta

                    Nothing ->
                        SiteMarkdown.firstParagraph body
                            |> Maybe.withDefault title
            , body = body
            }
        )
        (Decode.field "title" Decode.string)
        (Decode.maybe (Decode.field "meta" Decode.string))
        (Decode.maybe (Decode.field "lang" Decode.string))

page : Page RouteParams Data
page =
    Page.prerender
        { head = head
        , routes = routes
        , data = data
        }
        |> Page.buildNoState { view = view }


toRoute : SiteMarkdown.MarkdownFile -> RouteParams
toRoute f = { splat = List.append f.spath [f.slug] }

routes : DataSource (List RouteParams)
routes = DataSource.map (List.map toRoute) (SiteMarkdown.mdFiles "content/")

data : RouteParams -> DataSource Data
data routeParams =
    let
        findPage : List MDPage -> MDPage
        findPage ms =
            case find (\p -> toRoute p.fileInfo == routeParams) ms of
                Just p -> p
                Nothing ->
                    { body = ""
                    , title = "Inner bug!"
                    , description = "Luis Pedro Coelho"
                    , lang = Nothing
                    , fileInfo =
                        { path = "/"
                        , slug = ""
                        , spath = []
                        }
                    }
    in DataSource.map findPage mdpages

head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    (case static.data.lang of
        Just lang ->
            [ Head.rootLanguage (LanguageTag.custom lang) ]

        Nothing ->
            []
    )
        ++ (Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Luis Pedro Coelho"
        , image =
            { url = Pages.Url.external "https://luispedro.org/files/photos/2019-09-22/LuisPedroCoelho.jpeg"
            , alt = "Luis Pedro Coelho"
            , dimensions = Nothing
            , mimeType = Just "image/jpeg"
            }
        , description = static.data.description
        , locale = Nothing
        , title = static.data.title
        }
        |> Seo.website
           )


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
        { title = static.data.title
        , body =
            [Html.h1 [] [Html.text static.data.title]
            ,SiteMarkdown.mdToHtml static.data.body]
        }

