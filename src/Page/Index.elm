module Page.Index exposing (Model, Msg, Data, page)

import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import View exposing (View)
import DataSource.File

import String

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Alert as Alert
import Bootstrap.Button as Button

import Html
import Html.Attributes as HtmlAttr
import Pages.Url
import Yaml.Decode as Decode


import SiteMarkdown
import Shared
import Publications as Pub


type alias Data = List Pub.Publication
type alias RouteParams = {}

type alias Model = ()
type alias Msg = Never

head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Luis Pedro Coelho's personal website"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = websiteDescription
        , locale = Nothing
        , title = "Luis Pedro Coelho"
        }
        |> Seo.website


websiteDescription : String
websiteDescription = """
Luis Pedro Coelho is a computational biologist focusing on the global microbiome.

He is currently the principal investigator of the Big Data Biology Lab at the Centre for Microbiome Research at QUT (Brisbane, Australia).

"""
page = Page.prerender
        { head = head
        , routes = DataSource.succeed [{}]
        , data = \_ -> Pub.papersLPC
        }
        |> Page.buildNoState { view = view }

view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = "Luis Pedro Coelho"
    , body =
        [Grid.simpleRow
            [showPapers static.data
            ]]
    }

intro =
    Html.div
        []
        [SiteMarkdown.mdToHtml """
<img src="/files/photos/2019-09-22/LuisPedroCoelho.jpeg" alt="Luis Pedro Coelho"
    style="float: right; width:36.0%; border-radius: 50%;" />

# Who am I?

I am the principal investigator (PI) of the [Big Data Biology
Lab](https://big-data-biology.org) at the [Centre for Microbiome
Research](https://research.qut.edu.au/cmr/) at the [Queensland University of
Technology](https://www.qut.edu.au/) (Brisbane, Australia) where we study the
global microbiome.

Previously, my lab was hosted at Fudan University in Shanghai (2018–2023).

Before becoming a group leader, I worked at the European Molecular Biology
Laboratory (EMBL) in [Peer Bork's group](https://www.embl.de/~bork/). I have a
PhD from [Carnegie Mellon University](https://www.compbio.cmu.edu/) (2011),
where I worked on [bioimage
informatics](https://en.wikipedia.org/wiki/Bioimage_informatics) for
subcellular location analysis with [Bob
Murphy](https://murphylab.web.cmu.edu/).

My [Erdös-Bacon number is 7](/erdos-bacon).

[Publication list](/publications)

# Upcoming Travels & Talks

- **July 12-17**: [ISMB2024, followed by the Quest for Orthologs meeting](https://www.iscb.org/ismb2024/) in Montreal, Canada
- **July 4**: [ASM (the Australian one)](https://asmicro-2024.p.asnevents.com.au/days/2024-07-04), in Brisbane, QLD, Australia

[Email me](mailto:luis@luispedro.org) if you want to set up meetings at
any of these opportunities (or to invite me for other opportunities).

If you want to chat with me about science and such, you can use [my cal.com
link](https://cal.com/luis-pedro-coelho/zoom-15).

# Research Interests

**More technical version:** I am interested in microbiomes. I wish to answer basic questions on what determines the structure of a microbial community in a given environment and what are the differences/similarities between different environments.
Towards this, I pursue both method development (_e.g._ [SemiBin](https://doi.org/10.1038/s41467-022-29843-y) or [NGLess](https://doi.org/10.1186/s40168-019-0684-8)) and [biologically-driven projects](https://doi.org/10.1038/s41586-021-04233-4).
Solving problems related to small proteins (those with fewer than 100 amino acids) is a particular interest of mine.

**Not-so technical version:** Microbes are all around us (including inside of us), what we call a [microbiome](https://en.wikipedia.org/wiki/Microbiome).
With modern technology, it is possible to sequence the DNA of all the microbes in a sample (be it from a soil sample or from a human gut sample).
This allows us to answer questions such as: _what are the microbes present in a given sample? How do they differ between samples? What are the functions of these microbes?_

However, to achieve this, we need to develop computational methods to analyse these data.
My work is focused on both developing these methods and applying them to answer biological questions.

Here is what chatGPT had to say about my research interests:

    Luis Pedro Coelho is a computational biologist known for his work in developing bioinformatics tools and algorithms. As of my last update in September 2021, some specific contributions include his work on the development of machine learning algorithms for the analysis of large-scale molecular biology and metagenomics data.
    He is the author of several open-source software packages used in bioinformatics. One notable tool he developed is Jug, a task-based parallelization framework that allows users to easily write and run complex, multi-step computational pipelines.
    Coelho's research has spanned a range of topics in the field of bioinformatics and computational biology, such as image analysis, microbiome research, and genomics. His research often emphasizes methodological development, creating new tools and techniques that others in the field can use to more effectively analyze biological data.

# Recent Publications

Recent(ish) publications (last 5 years; see [full list](/publications)):

"""]

outro =
    Html.div
        []
        [Html.p [] []
        ,SiteMarkdown.mdToHtml """
[All publications\\...](/publications) ([Google Scholar
profile](https://scholar.google.com/citations?user=qTYua0cAAAAJ&hl=en))

# Past News & Travels

## 2024

- **9 May** [open office hours](/office-hours) (Zoom)
- **24 April** [open office hours](/office-hours) (Zoom)
- **23-25 January (2024)** Berlin, Germany

## 2023

- **Nov 12-15**: [The 22nd International Conference on Bioinformatics (InCoB 2023)](https://incob.apbionet.org/incob23/) in Brisbane. I presented a highlight talk on [SemiBin](https://doi.org/10.1038/s41467-022-29843-y) (including [SemiBin2](https://academic.oup.com/bioinformatics/article/39/Supplement_1/i21/7210480)).

- **Oct 15-20**: [International Peptide Symposium 2023](https://www.peptides2023.org/) in Brisbane. I presented the talk _A survey of antimicrobial peptides from the global microbiome_.

- **Aug 21-24**: [Quadram Institute](https://quadram.ac.uk/) in Norwich (UK).

- **July 27**: I was awarded an [ARC Future Fellowship](https://rms.arc.gov.au/RMS/Report/Download/Report/a3f6be6e-33f7-4fb5-98a6-7526aaa184cf/249) to work on small proteins of the global microbiome at QUT.

- **July 23-27**: [ISMB](https://www.iscb.org/ismbeccb2023) (Lyon, France) - [talk](https://2023-07-25-talk-semibin.big-data-biology.org)

- **June 15-18**: [Vibecamp](https://vibe.camp/)

- **May 31-June 2**: [microProteins 2023](https://plen.ku.dk/english/calendar/2022/microproteins-2023-unraveling-the-universe-of-microproteins---from-discovery-to-physiology-and-application/) (Copenhagen, Denmark)

- **April 2-6**: Paris (France) for EMBARK and visiting INRAE

**Jan 9-13** At the University of Warwick

[older news items ...](/news)
"""]

isRecent : Pub.Publication -> Bool
isRecent pub = pub.year >= 2019

showPapers : List Pub.Publication -> Grid.Column Msg
showPapers papers =
    let
        recentPapers = List.filter isRecent papers
    in Grid.col []
        [intro
        , Html.div
            []
            (List.indexedMap (showPaper (List.length recentPapers)) recentPapers)
        ,outro
        ]

showPaper n ix p =
        Html.p [HtmlAttr.style "margin-top" "0em"
               ,HtmlAttr.style "margin-bottom" "0em"]
            [Html.i [] [Html.text (String.fromInt (n-ix) ++ ". ")]
            ,Html.a
                [HtmlAttr.href ("https://doi.org/"++p.doi)]
                [Html.cite [] [Html.text p.title]]
            ,Html.text " by "
            ,Html.span []
                (Pub.showAuthors False p.authors)
            ,Html.text " in "
            ,Html.span [HtmlAttr.style "font-variant" "small-caps"] [Html.text p.journal]
            ,Html.text (" ("++String.fromInt p.year++").")
            ]

