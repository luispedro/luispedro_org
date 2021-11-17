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
import Path exposing (Path)
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import View exposing (View)
import Html exposing (Html)
import Html.Attributes as HtmlAttr


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
        { path : Path
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
                { path : Path
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
        OnPageChange _ ->
            ( { model | showMobileMenu = False }, Cmd.none )

        SharedMsg globalMsg ->
            ( model, Cmd.none )


subscriptions : Path -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


data : DataSource.DataSource Data
data =
    DataSource.succeed ()


view :
    Data
    ->
        { path : Path
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
                        [ Grid.col [Col.xs3]
                            [navigation
                            ,Html.div []
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
                        , Grid.col [Col.lg8]
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
            , link "/vita" "CV"
            ]]
footer = Html.div []
            [Html.p []
                [Html.text "Copyright (c) 2009-2021. Luis Pedro Coelho and other group members. All rights reserved."]
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
            [("http://big-data-biology.org/", "Big Data Biology Lab Website")
            ,("/resume", "CV")
            ,("/publications", "Publications")
            ,("/teaching", "Teaching")
            ,("/talks", "Slides from talks")
            ,("http://metarabbit.wordpress.com/", "Metarabbit")
            ,("/biography", "Short Biography")
            ,("/erdos-bacon", "My Erdös Bacon Number")
            ]
        ,liSection "Software"
            [("http://ngless.embl.de/", "NGLess")
            ,("/software/mahotas", "Image processing with Python")
            ,("/software/imread", "Loading images in Python")
            ,("/software/jug", "Task based parallelization framework for Python")
            ]
        ,liSection "Other Stuff"
            [("/faq", "Frequently Asked Questions")
            ,("/derivations", "Some useful derivations")
            ,("/fimdetarde", "Award-winning short story (in Portuguese)")
            ,("/work/shmoo-video/", "Yeast Mating Claymation")
            ,("http://beiraproject.org/", "Volunteering in Mozambique")
            ,("http://twitter.com/luispedrocoelho", "@luispedrocoelho (twitter)")
            ]
        ,liSection "Older Projects"
            [("/projects/gen-classification", "Generalization of Subcellular Location")
            ,("/projects/datasets", "Publicly available datasets")
            ,("/projects/pfs", "A course for scientists who write code")
            ,("/projects/slif", "Structured Literature Image Finder")
            ,("/projects/", "All projects")
            ]
        ]
