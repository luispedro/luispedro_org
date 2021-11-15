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

import SiteMarkdown

type alias Model = ()
type alias Msg = Never

type alias RouteParams =
    { splat : List String }

type alias MDPage =
    { body : String
    , title : String
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
    Decode.map (\title -> { fileInfo = finfo, title = title, body = body })
        (Decode.field "title" Decode.string)

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
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Luis Pedro Coelho"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Luispedro"
        , locale = Nothing
        , title = static.data.title
        }
        |> Seo.website


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

