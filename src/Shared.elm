module Shared exposing (Data, Model, Msg(..), SharedMsg(..), template)

import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row

import Browser.Navigation
import DataSource
import Html exposing (Html)
import Pages.Flags
import Pages.PageUrl exposing (PageUrl)
import Path
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import View exposing (View)
import Html exposing (Html)
import Html.Attributes as HtmlAttr


import Analytics

template : SharedTemplate Msg Model Data msg
template =
    { init = init
    , update = update
    , view = view
    , data = data
    , subscriptions = subscriptions
    , onPageChange = Just OnPageChange
    }


type Msg
    = OnPageChange
        { path : Path.Path
        , query : Maybe String
        , fragment : Maybe String
        }
    | SharedMsg SharedMsg


type alias Data =
    ()


type SharedMsg
    = NoOp


type alias Model =
    { showMobileMenu : Bool
    }


init :
    Maybe Browser.Navigation.Key
    -> Pages.Flags.Flags
    ->
        Maybe
            { path :
                { path : Path.Path
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Cmd Msg )
init navigationKey flags maybePagePath =
    ( { showMobileMenu = False }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnPageChange p ->
            ( { model | showMobileMenu = False }, Path.toRelative p.path |> Analytics.updatePath )

        SharedMsg globalMsg ->
            ( model, Cmd.none )


subscriptions : Path.Path -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


data : DataSource.DataSource Data
data =
    DataSource.succeed ()


view :
    Data
    ->
        { path : Path.Path
        , route : Maybe Route
        }
    -> Model
    -> (Msg -> msg)
    -> View msg
    -> { body : Html msg, title : String }
view sharedData page model toMsg pageView =
    { body = Html.div []
        [ CDN.stylesheet
        , CDN.fontAwesome
        , Grid.containerFluid []
            [ Grid.simpleRow
                [ Grid.col []
                    [ Html.div [HtmlAttr.style "padding-top" "1em"] []
                    , header
                    , Grid.simpleRow
                        [ Grid.col [Col.xs3, Col.attrs [HtmlAttr.id "leftbar"]]
                            [navigation
                            ,Html.div [HtmlAttr.id "twitter-timeline"]
                                [Html.a
                                    [HtmlAttr.class "twitter-timeline"
                                    ,HtmlAttr.id "twitter-timeline-a"
                                    ,HtmlAttr.attribute "data-width" "240"
                                    ,HtmlAttr.attribute "data-height" "480"
                                    ,HtmlAttr.href "https://twitter.com/luispedrocoelho?ref_src=twsrc%5Etfw"

                                    ]
                                    [Html.text "Tweets by @luispedrocoelho"]
                                ,Html.div [HtmlAttr.id "twitter-injection-site"]
                                    []
                                ]
                            ]
                        , Grid.col [Col.xs9]
                            [Html.div [] pageView.body]
                        ]
                    , Html.hr [] []
                    , footer
                    ]
                ]
            ]
        ]
    , title = pageView.title
    }

header =
    let
        link target name =
            Grid.col []
                [Html.a [HtmlAttr.href target] [Html.text name]]
    in Html.div
        [HtmlAttr.id "topbar"]
        [Grid.simpleRow
            [ link "/index" "Home"
            , link "https://big-data-biology.org" "Lab Website"
            , link "/publications/" "Publications"
            , link "/vita.pdf" "CV"
            ]]
footer = Html.div []
            [Html.p []
                [Html.text "Copyright (c) 2009-2025. Luis Pedro Coelho. All rights reserved."]
            ,Html.div [HtmlAttr.id "google-injection-site"] []
            ]


navigation =
    let
        liSection title links =
            Html.div
                []
                [Html.h6 [] [Html.text title]
                ,Html.ul
                    []
                    (links
                        |> List.map (\(target,text)
                                    -> Html.li
                                        []
                                        [Html.a [HtmlAttr.href target] [Html.text text]]))
                ]
    in Html.nav
        []
        [liSection "About Me"
            [("https://big-data-biology.org/", "Big Data Biology Lab Website")
            ,("/resume", "CV")
            ,("/publications", "Publications")
            ,("/teaching", "Teaching")
            ,("/talks", "Slides from talks")
            ,("https://metarabbit.wordpress.com/", "Metarabbit")
            ,("/biography", "Short Biography")
            ,("/erdos-bacon", "My Erdös Bacon Number")
            ]
        ,liSection "Software"
            [("https://ngless.embl.de/", "NGLess")
            ,("/software/semibin", "SemiBin: Semi-supervised binning of metagenomic data")
            ,("/software/mahotas", "Image processing with Python")
            ,("/software/imread", "Loading images in Python")
            ,("/software/jug", "Task based parallelization framework for Python")
            ]
        ,liSection "Other Stuff"
            [("/faq", "Frequently Asked Questions")
            ,("/derivations", "Some useful derivations")
            ,("/fimdetarde", "Award-winning short story (in Portuguese)")
            ,("/shmoo-video/", "Yeast Mating Claymation")
            ,("https://twitter.com/luispedrocoelho", "@luispedrocoelho (twitter)")
            ]
        --,liSection "Older Projects"
        --    [("/projects/gen-classification", "Generalization of Subcellular Location")
        --    ,("/projects/datasets", "Publicly available datasets")
        --    ,("/projects/pfs", "A course for scientists who write code")
        --    ,("/projects/slif", "Structured Literature Image Finder")
        --    ,("/projects/", "All projects")
        --    ]
        ]
