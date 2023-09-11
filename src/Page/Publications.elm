module Page.Publications exposing (..)
import Dict

import Http
import Json.Decode as D

import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import View exposing (View)
import DataSource.File

import List.Extra
import String

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Alert as Alert
import Bootstrap.Button as Button

import Html
import Html.Events
import Html.Attributes as HtmlAttr
import Pages.Url

import Yaml.Decode as Decode

import SiteMarkdown
import Shared
import Publications as Pub



type alias Data = List Pub.Publication
type alias RouteParams = {}

type PeriodFilter =
    Since2018
    | Since2011

showPeriod p = case p of
    Since2018 -> "Since 2018"
    Since2011 -> "Since 2011"

matchPeriod : Maybe PeriodFilter -> Pub.Publication -> Bool
matchPeriod mp pub = case mp of
    Nothing -> True
    Just Since2018 -> pub.year >= 2018
    Just Since2011 -> pub.year >= 2011

type alias DimensionsCitations =
        { doi : String
        , times_cited : Int
        , recent_citations : Int
        , relative_citation_ratio : Maybe Float
        , field_citation_ratio : Maybe Float
        }

type alias Model =
    { activePeriod : Maybe PeriodFilter
    , onlyFirstLast : Bool
    , expandAllDetails : Bool
    , activeDOI : Maybe String
    , dimensionsData : Dict.Dict String DimensionsCitations
    }

type Msg =
    NoOp
    | DataReceived (Result Http.Error DimensionsCitations)
    | ActivatePeriodFilter PeriodFilter
    | DeactivatePeriodFilter
    | SetIsLastFilter Bool
    | SetActiveDOI String
    | SetExpandAllDetails Bool
    | ResetActiveDOI
    | ResetFilters


decodeDimensionsCitations : D.Decoder DimensionsCitations
decodeDimensionsCitations =
    D.map5 DimensionsCitations
        (D.field "doi" D.string)
        (D.field "times_cited" D.int)
        (D.field "recent_citations" D.int)
        (D.field "relative_citation_ratio" (D.nullable D.float))
        (D.field "field_citation_ratio" (D.nullable D.float))

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
        , description = "Interactive list of the papers published by Luis Pedro Coelho"
        , locale = Nothing
        , title = "Papers published by Luis Pedro Coelho"
        }
        |> Seo.website


page = Page.prerender
        { head = head
        , routes = DataSource.succeed [{}]
        , data = \_ -> Pub.papersLPC
        }
        |> Page.buildWithLocalState
            { view = view
            , init = \_ _ staticPayload -> init staticPayload.data
            , update = \_ _ _ _ -> update
            , subscriptions = \_ _ _ _-> Sub.none
            }

init : (List Pub.Publication) -> ( Model, Cmd Msg )
init papers =
    ( { activePeriod = Nothing
      , onlyFirstLast = False
      , expandAllDetails = False
      , activeDOI = Nothing
      , dimensionsData = Dict.empty
      }
    , Cmd.batch (List.map queryDimensions papers)
    )

queryDimensions : Pub.Publication -> Cmd Msg
queryDimensions p =
    Http.get
        { url = "https://metrics-api.dimensions.ai/doi/" ++ p.doi
        , expect = Http.expectJson DataReceived decodeDimensionsCitations
        }

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = case msg of
    DeactivatePeriodFilter -> ( { model | activePeriod = Nothing } , Cmd.none )
    ActivatePeriodFilter pf -> ( { model | activePeriod = Just pf } , Cmd.none )
    SetIsLastFilter f -> ( { model | onlyFirstLast = f } , Cmd.none )
    ResetFilters -> ( { model | activePeriod = Nothing, onlyFirstLast = False } , Cmd.none )
    SetActiveDOI doi -> ( { model | activeDOI = Just doi } , Cmd.none )
    ResetActiveDOI -> ( { model | activeDOI = Nothing } , Cmd.none )
    SetExpandAllDetails b -> ( { model | expandAllDetails = b } , Cmd.none )
    DataReceived dt -> case dt of
        Ok d -> ( { model | dimensionsData = Dict.insert (String.toLower d.doi) d model.dimensionsData }, Cmd.none )
        Err _ -> ( model, Cmd.none )
    NoOp -> ( model , Cmd.none )

view :
    Maybe PageUrl
    -> Shared.Model
    -> Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel model static =
    { title = "Luis Pedro Coelho Papers"
    , body =
        [Grid.simpleRow
            [showPapers static.data model
            ]]
    }

intro =
    Html.div
        []
        [SiteMarkdown.mdToHtml """
# Full List of Publications

Updated: **12 September 2023**

[My google scholar
profile](http://scholar.google.com/citations?user=qTYua0cAAAAJ&hl=en)

Google Scholar total citations: 14,320; h-index: 41 ([Web of
science](https://www.webofscience.com/wos/author/record/1798261):
9,247 citations; h-index: 33)

# Selected Publications

1.  **Luis Pedro Coelho**, Renato Alves, Álvaro Rodríguez del Río, Pernille
    Neve Myers, Carlos P. Cantalapiedra, Joaquín Giner-Lamia, Thomas Sebastian
    Schmidt, Daniel R. Mende, Askarbek Orakov, Ivica Letunic, Falk Hildebrand,
    Thea Van Rossum, Sofia K. Forslund, Supriya Khedkar, Oleksandr M.
    Maistrenko, Shaojun Pan, Longhao Jia, Pamela Ferretti, Shinichi Sunagawa,
    Xing-Ming Zhao, Henrik Bjørn Nielsen, Jaime Huerta-Cepas⁺, Peer Bork⁺
    [Towards the biogeography of prokaryotic genes
    ](https://doi.org/10.1038/s41586-021-04233-4) in _Nature_ (2022) [[Open
    Access version](https://europepmc.org/article/med/34912116)].
2.  Shaojun Pan, Chengkai Zhu, Xing-Ming Zhao⁺, and **Luis Pedro
    Coelho** ⁺ [A deep siamese neural network improves metagenome-assembled
    genomes in microbiome datasets across different
    environments](https://doi.org/10.1038/s41467-022-29843-y) in _Nature
    Communications_ (2022).
3.  **Luis Pedro Coelho**, Renato Alves, Paulo Monteiro, Jaime
    Huerta-Cepas, Ana Teresa Freitas, and Peer Bork [NG-meta-profiler:
    fast processing of metagenomes using NGLess, a domain-specific
    language](https://doi.org/10.1186/s40168-019-0684-8) in
    _Microbiome_ (2019)
4.  **Luis Pedro Coelho**, Jens Kultima, Paul Costea, Coralie Fournier,
    Yuanlong Pan, Gail Czarnecki-Maulden, Matthew Hayward, Sofia K.
    Forslund, Patrick Descombes, Janet Jackson, Qinghong Li, and Peer
    Bork [Similarity of the dog and human gut microbiomes in gene
    content and response to
    diet](https://microbiomejournal.biomedcentral.com/articles/10.1186/s40168-018-0450-3)
    in _Microbiome_ (2018)
    \\[[DOI](https://doi.org/10.1186/s40168-018-0450-3)\\]
5.  Shinichi Sunagawa,\\* **Luis Pedro Coelho**\\*, Samuel Chaffron\\*,
    Jens Roat Kultima, Karine Labadie, Guillem Salazar, Bardya
    Djahanschiri, Georg Zeller, Daniel R. Mende, Adriana Alberti,
    Francisco M. Cornejo-Castillo, Paul I. Costea, Corinne Cruaud,
    Francesco d'Ovidio, Stefan Engelen, Isabel Ferrera, Josep M. Gasol,
    Lionel Guidi, Falk Hildebrand, Florian Kokoszka, Cyrille Lepoivre,
    Gipsi Lima-Mendez, Julie Poulain, Bonnie T. Poulos, Marta
    Royo-Llonch, Hugo Sarmento, Sara Vieira-Silva, Céline Dimier, Marc
    Picheral, Sarah Searson, Stefanie Kandels-Lewis, Tara Oceans
    coordinators, Chris Bowler, Colomban de Vargas, Gabriel Gorsky,
    Nigel Grimsley, Pascal Hingamp, Daniele Iudicone, Olivier Jaillon,
    Fabrice Not, Hiroyuki Ogata, Stephane Pesant, Sabrina Speich, Lars
    Stemmann, Matthew B. Sullivan, Jean Weissenbach, Patrick Wincker,
    Eric Karsenti, Jeroen Raes, Silvia G. Acinas, Peer Bork, [Structure
    and function of the global ocean microbiome](http://doi.org/10.1126/science.1261359)
    in _Science_ (2015)
    \\[[DOI](http://doi.org/10.1126/science.1261359)\\]
    \\[[PDF](http://www.bork.embl.de/publication/pdf/25999513.pdf)\\]
"""]


showSelection model =
    let
        activeButton act = [ Button.primary, Button.onClick act ]
        inactivateButton act = [ Button.outlineSecondary, Button.onClick act ]
    in Grid.simpleRow
                [Grid.col []
                    [Html.h6 [] [Html.text "Recency"]
                    ,Html.p
                        []
                        ([Since2018, Since2011] |> List.map (\y ->
                            let buttonStyle =
                                    if Just y == model.activePeriod
                                        then activeButton DeactivatePeriodFilter
                                        else inactivateButton (ActivatePeriodFilter y)
                            in Html.span [HtmlAttr.style "padding-right" "2em"]
                                [Button.button buttonStyle [Html.text <| showPeriod y]]
                                ))
                    ]
                ,Grid.col []
                    [Html.h6 []
                        [Html.text "First/last Author"
                        ,Html.small [HtmlAttr.style "color" "#333"]
                            [Html.text " (including co-first & co-last)"]]
                    ,let
                        buttonStyle = if model.onlyFirstLast
                                        then activeButton (SetIsLastFilter False)
                                        else inactivateButton (SetIsLastFilter True)
                    in Button.button buttonStyle [Html.text "Only first/last"]
                    ]
                ,Grid.col []
                    [Html.h6 []
                        [Html.text "Citation detail"]
                    ,let
                        buttonStyle = if model.expandAllDetails
                                        then activeButton (SetExpandAllDetails False)
                                        else inactivateButton (SetExpandAllDetails True)
                    in Button.button buttonStyle [Html.text "Show citation details"]
                    ]
                ]

showPapers : List Pub.Publication -> Model -> Grid.Column Msg
showPapers papers model =
    let
        papersA = if model.onlyFirstLast
            then List.filter .isFirstLast papers
            else papers
        papersYA = List.filter (matchPeriod model.activePeriod) papersA
    in Grid.col []
        [intro
        ,Html.h1 [] [Html.text "Complete List of Publications"]
        ,Html.p [] [Html.text "In reverse chronological order"]
        ,showSelection model
        , if List.isEmpty papersYA
            then
                Alert.simpleWarning []
                    [Html.p []
                        [Html.text "No papers matching the filters"
                        ,Html.span [HtmlAttr.style "padding-left" "4em"]
                            [Button.button [ Button.warning, Button.onClick ResetFilters ] [Html.text "Reset filters"]]
                        ]
                    ]
            else Html.div
                        []
                        (List.indexedMap (showPaper model (List.length papersYA)) papersYA)
        ,Html.p []
            [Html.text "Citation information provided by "
            ,Html.a [HtmlAttr.href "https://www.dimensions.ai/"] [Html.text "Dimensions.ai"]
            ,Html.text "."
            ]
        ]

addDimensionsBadge : Model -> String -> Html.Html Msg
addDimensionsBadge model doi = case Dict.get (String.toLower doi) model.dimensionsData of
    Nothing -> Html.span [] []
    Just citinfo -> Html.span
                [ HtmlAttr.class "__dimensions_badge_embed__ "
                ,Html.Events.onMouseOver (SetActiveDOI doi)
                ,Html.Events.onMouseOut ResetActiveDOI]
            [Html.a [HtmlAttr.href <| "https://badge.dimensions.ai/details/doi/" ++ doi ++ "?domain=https://luispedro.org"
                    ,HtmlAttr.class "__dimensions_Link"
                    ]
                [Html.div
                    [HtmlAttr.class "__dimensions_Badge __dimensions_Badge_style_rectangle"]
                    [Html.div [HtmlAttr.class "__dimensions_Badge_Image"]
                    [Html.img [HtmlAttr.src <|"https://badge.dimensions.ai/badge?style=rectangle&count=" ++ String.fromInt citinfo.times_cited
                            , HtmlAttr.alt <| String.fromInt citinfo.times_cited ++ " total citations on Dimensions."
                            , HtmlAttr.style "padding-left" "1em"]
                            []
                    ]]]
            ,if model.expandAllDetails
              then dimensionsPopup citinfo
              else Html.span [] []
            ]

dimensionsPopup cit =

    Html.div
        [ HtmlAttr.class "__dimensions_Badge_Legend_padding __dimensions_Badge_Legend_hover-right  __dimensions_Badge_Legend_style_small_rectangle __dimensions_Badge_Legend_always"
        ]
        [ Html.div
            [ HtmlAttr.class "__dimensions_Badge_Legend __dimensions_Badge_Legend_hover-right"]
            [ Html.div
                [ HtmlAttr.class "__dimensions_Badge_stat_group __dimensions_Badge_stat_group_citations" ]
                [ Html.div
                    [ HtmlAttr.class "__dimensions_Badge_stat __dimensions_Badge_stat_total_citations" ]
                    [ Html.span [ HtmlAttr.class "__dimensions_Badge_stat_icon" ] []
                    , Html.span [ HtmlAttr.class "__dimensions_Badge_stat_count" ]
                        [ Html.text <| String.fromInt cit.times_cited ]
                    , Html.span [ HtmlAttr.class "__dimensions_Badge_stat_text" ]
                        [ Html.text "Total citations" ]
                    ]
                , Html.div [ HtmlAttr.class "__dimensions_Badge_stat __dimensions_Badge_stat_recent_citations" ]
                    [ Html.span [ HtmlAttr.class "__dimensions_Badge_stat_icon" ] []
                    , Html.span [ HtmlAttr.class "__dimensions_Badge_stat_count" ]
                        [ Html.text <| String.fromInt cit.recent_citations ]
                    , Html.span [ HtmlAttr.class "__dimensions_Badge_stat_text" ]
                        [ Html.text "Recent citations" ]
                    ]
                ]
            , Html.div [ HtmlAttr.class "__dimensions_Badge_stat_group __dimensions_Badge_stat_group_cr" ]
                [ Html.div [ HtmlAttr.class "__dimensions_Badge_stat __dimensions_Badge_stat_fcr" ]
                    [ Html.span [ HtmlAttr.class "__dimensions_Badge_stat_icon" ] []
                    , Html.span [ HtmlAttr.class "__dimensions_Badge_stat_count" ]
                        [ Html.text <| Maybe.withDefault "??" <|Maybe.map String.fromFloat cit.field_citation_ratio ]
                    , Html.span [ HtmlAttr.class "__dimensions_Badge_stat_text" ]
                        [ Html.text "Field Citation Ratio" ] ]
                , Html.div
                    [ HtmlAttr.class "__dimensions_Badge_stat __dimensions_Badge_stat_rcr" ]
                    [ Html.span [ HtmlAttr.class "__dimensions_Badge_stat_icon" ] []
                    , Html.span [ HtmlAttr.class "__dimensions_Badge_stat_count" ]
                        [ Html.text <| Maybe.withDefault "??" <|Maybe.map String.fromFloat cit.relative_citation_ratio ]
                    , Html.span [ HtmlAttr.class "__dimensions_Badge_stat_text" ]
                        [ Html.text "Relative Citation Ratio" ]
                    ]
                ]
            ]
        ]

showPaper model n ix p =
        Html.p []
            [Html.text (String.fromInt (n-ix) ++ ". ")
            ,Html.a
                [HtmlAttr.href ("https://doi.org/"++p.doi)]
                [Html.cite [] [Html.text p.title]]
            ,Html.text " by "
            ,Html.span []
                (Pub.showAuthors True p.authors)
            ,Html.text " in "
            ,Html.span [HtmlAttr.style "font-variant" "small-caps"] [Html.text p.journal]
            ,Html.text (" ("++String.fromInt p.year++")" )
            ,case p.comment of
                Nothing -> Html.text ""
                Just c -> SiteMarkdown.mdToInlineHtml (", " ++ c)
            ,Html.text "."
            ,addDimensionsBadge model p.doi
            ]

