module Page.Publications exposing (..)

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
import Html.Attributes as HtmlAttr
import Pages.Url

import SiteMarkdown
import Shared

import Yaml.Decode as Decode

type alias Publication =
    { title : String
    --, slug : String
    --, short_description : String
    --, abstract : String
    , journal : String
    --, date : String
    , year : String
    , doi : String
    , authors : List String
    , isFirstLast : Bool
    }

readPublication =
    Decode.map6 Publication
        (Decode.field "Title" Decode.string)
        (Decode.field "Journal" Decode.string)
        (Decode.field "Year" Decode.string)
        (Decode.field "Doi" Decode.string)
        (Decode.field "Authors" (Decode.list Decode.string))
        (Decode.field "isFirstLast" Decode.bool)

papersLPC : DataSource (List Publication)
papersLPC =
    DataSource.File.rawFile "papers.yaml"
        |> DataSource.andThen (\raw ->
            raw
                |> Decode.fromString (Decode.list readPublication)
                |> Result.mapError (\err -> case err of
                                        Decode.Parsing s -> "Parse error: " ++ s
                                        Decode.Decoding s -> "Decode error: " ++ s)
                |> DataSource.fromResult)
        |> DataSource.map List.reverse

type alias Data = List Publication
type alias RouteParams = {}

type PeriodFilter =
    Since2018
    | Since2011

showPeriod p = case p of
    Since2018 -> "Since 2018"
    Since2011 -> "Since 2011"

matchPeriod mp pub = case mp of
    Nothing -> True
    Just Since2018 -> Maybe.withDefault 0 (String.toInt pub.year) >= 2018
    Just Since2011 -> Maybe.withDefault 0 (String.toInt pub.year) >= 2011

type alias Model =
    { activePeriod : Maybe PeriodFilter
    , onlyFirstLast : Bool
    }

type Msg =
    NoOp
    | ActivatePeriodFilter PeriodFilter
    | DeactivatePeriodFilter
    | SetIsLastFilter Bool
    | ResetFilters

head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages"
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
        , data = \_ -> papersLPC
        }
        |> Page.buildWithLocalState
            { view = view
            , init = \_ _ staticPayload -> init ()
            , update = \_ _ _ _ -> update
            , subscriptions = \_ _ _ _-> Sub.none
            }

init : () -> ( Model, Cmd Msg )
init () =
    ( { activePeriod = Nothing
      , onlyFirstLast = False
      }
    , Cmd.none
    )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = case msg of
    DeactivatePeriodFilter -> ( { model | activePeriod = Nothing } , Cmd.none )
    ActivatePeriodFilter pf -> ( { model | activePeriod = Just pf } , Cmd.none )
    SetIsLastFilter f -> ( { model | onlyFirstLast = f } , Cmd.none )
    ResetFilters -> init ()
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

Updated: **8 Dec 2021**

[My google scholar
profile](http://scholar.google.com/citations?user=qTYua0cAAAAJ&hl=en)

Google Scholar total citations: 8,684; h-index: 32 ([Web of
science](https://publons.com/researcher/271636/luis-pedro-coelho/):
5,167 citations; h-index: 27)

# Selected Publications

1.  Shaojun Pan, Chengkai Zhu, Xing-Ming Zhao⁺, and **Luis Pedro
    Coelho** ⁺ [SemiBin: Incorporating information from reference
    genomes with semi-supervised deep learning leads to better
    metagenomic assembled genomes
    (MAGs)](https://doi.org/10.1101/2021.08.16.456517) BioRxiv
    preprint (2021)
2.  **Luis Pedro Coelho**, Renato Alves, Paulo Monteiro, Jaime
    Huerta-Cepas, Ana Teresa Freitas, and Peer Bork [NG-meta-profiler:
    fast processing of metagenomes using NGLess, a domain-specific
    language](https://doi.org/10.1186/s40168-019-0684-8),
    Microbiome (2019)
3.  **Luis Pedro Coelho**, Jens Kultima, Paul Costea, Coralie Fournier,
    Yuanlong Pan, Gail Czarnecki-Maulden, Matthew Hayward, Sofia K.
    Forslund, Patrick Descombes, Janet Jackson, Qinghong Li, and Peer
    Bork [Similarity of the dog and human gut microbiomes in gene
    content and response to
    diet](https://microbiomejournal.biomedcentral.com/articles/10.1186/s40168-018-0450-3)
    in Microbiome (2018)
    \\[[DOI](https://doi.org/10.1186/s40168-018-0450-3)\\]
4.  Shinichi Sunagawa,\\* **Luis Pedro Coelho**\\*, Samuel Chaffron\\*,
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
    Eric Karsenti, Jeroen Raes, Silvia G. Acinas, Peer Bork, *Structure
    and function of the global ocean microbiome* in Science (2015)
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
                ]

showPapers : List Publication -> Model -> Grid.Column Msg
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
                        (List.indexedMap (showPaper (List.length papersYA)) papersYA)
        ]

showPaper n ix p =
        Html.p []
            [Html.text (String.fromInt (n-ix) ++ ". ")
            ,Html.a
                [HtmlAttr.href ("https://doi.org/"++p.doi)]
                [Html.cite [] [Html.text p.title]]
            ,Html.text " by "
            ,Html.span []
                (showAuthors p.authors)
            ,Html.text " in "
            ,Html.span [HtmlAttr.style "font-variant" "small-caps"] [Html.text p.journal]
            ,Html.text (" ("++p.year++").")
            ]

showAuthors ax =
    let
        showAuthor a =
            if String.contains "Coelho" a && String.startsWith "L" a
                then Html.b [] [Html.text a]
                else Html.text a
    in List.intersperse (Html.text ", ") (List.map showAuthor ax)

