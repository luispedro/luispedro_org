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

## 2025

**Jul 16-24** I will be in London July 15-20 and then in Liverpool for the [ISMB/ECCB 2025 – Intelligent Systems for Molecular Biology & European Conference on Computational Biology](https://www.iscb.org/ismbeccb2025)

**Aug 17-22, 2025** [Decoding Microproteins Across Evolution and Disease GRC](https://www.grc.org/decoding-microproteins-across-evolution-and-disease-conference/2025/) in Barcelona, Spain

**Sep 16-19** I will be at the [EMBL Human Microbiome Symposium](https://www.embl.org/about/info/course-and-conference-office/events/ees25-08/).

**Oct 13-15** I will be in Houston for the [SMBE Satellite Meeting: Evolutionary Biochemistry of Insect Antimicrobial Peptides](https://uh.edu/nsm/biology-biochemistry/news-events/smbe-meeting/).

[Email me](mailto:luis@luispedro.org) if you want to set up meetings at any of these opportunities (or to invite me for other opportunities).

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

>  Luis Pedro Coelho is a computational biologist known for his work in developing bioinformatics tools and algorithms. As of my last update in September 2021, some specific contributions include his work on the development of machine learning algorithms for the analysis of large-scale molecular biology and metagenomics data.
>  He is the author of several open-source software packages used in bioinformatics. One notable tool he developed is Jug, a task-based parallelization framework that allows users to easily write and run complex, multi-step computational pipelines.
>  Coelho's research has spanned a range of topics in the field of bioinformatics and computational biology, such as image analysis, microbiome research, and genomics. His research often emphasizes methodological development, creating new tools and techniques that others in the field can use to more effectively analyze biological data.

# Recent Publications

Recent(ish) publications (last 3 years; see [full list](/publications)):

"""]

outro =
    Html.div
        []
        [Html.p [] []
        ,SiteMarkdown.mdToHtml """
[All publications\\...](/publications) ([Google Scholar
profile](https://scholar.google.com/citations?user=qTYua0cAAAAJ&hl=en))

# Past News & Travels

## 2025

**Apr 15** [argNorm published at Bioinformatics](https://doi.org/10.1093/bioinformatics/btaf173)

**Apr 15-18** I will be at the [Pakistan Society for Microbiology Conference](https://qau.edu.pk/events/15th-biennial-conference-organized-by-the-pakistan-society-for-microbiology/).

## 2024


**Dec 10 & 12**: _Open office hours_. Two sessions at different times of the day, so it works for all timezones. Attendance is free, but registration is required:
- Dec 10 @ 9.30am UTC ([find your local time](https://everytimezone.com/s/af68ee61)): [Register now](https://qut.zoom.us/meeting/register/tZYpduitqjwtGdZydsw8CieA_UNn_5oDeaLB)
- Dec 12 @ 9.30pm UTC ([find your local time](https://everytimezone.com/s/d4dac6a1)): [Register now](https://qut.zoom.us/meeting/register/tZwof-mrpzMvHNe7ljcCtSidpzoxkZMGjO2E)

**Nov 11-15** I co-taught a 1 week course on state-of-the-art bioinformatic approaches to analyze metagenomic data. Click [here](https://www.physalia-courses.org/courses-workshops/environmental-metagenomics/) to learn more and register.

- **Nov  3-6** I will be in Sydney. On the 4th, I will present at the [Symposium on Bioinformatics Excellence and Innovation](https://www.abacbs.org/conference2024/home) which is part of the ABACBS conference.
- **Oct 14-24** I will be in Shanghai
- **Sep 24** I will be presenting online at [APBioNet](https://www.apbionet.org/news/finding-antimicrobial-peptides-in-the-global-microbiome-using-machine-learning/) on using machine learning to find antimicrobial peptides in the global microbiome. The talk will be on September 24, 2024 at 5am UTC (1pm SGT). [Learn more and register](https://apbtalks.apbionet.org/event/finding-antimicrobial-peptides-in-the-global-microbiome-using-machine-learning/)]
- **Aug 18-23** I was in Cape Town, South Africa for [ISME19](https://isme19.isme-microbes.org/). I will present at the [Night of the Microbes event](https://www.sun.ac.za/english/Lists/Events/DispForm.aspx?ID=5882&RootFolder=%2Fenglish%2FLists%2FEvents&Source=http%3A%2F%2Fwww%2Esun%2Eac%2Eza%2Fenglish%2FPages%2Fdefault%2Easpx%3Ftid%3D23).
- **July 19-22**: I was in San Francisco
- **July 12-17**: [ISMB2024, followed by the Quest for Orthologs meeting](https://www.iscb.org/ismb2024/) in Montreal, Canada. I presented a talk on [AMPSphere](https://doi.org/10.1016/j.cell.2024.05.013) and on [long term sustainable research software](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1011920) ([YouTube version](https://youtu.be/yCgvvVQJE9I)).
- **July 4**: [ASM (the Australian one)](https://asmicro-2024.p.asnevents.com.au/days/2024-07-04), in Brisbane, QLD, Australia
- **Jun 11** The [AMPSphere manuscript](https://doi.org/10.1016/j.cell.2024.05.013) was featured in several news outlets, including the BBC ([*Science in Action*](https://www.bbc.co.uk/sounds/play/w3ct5vct)), [*Deutsche Welle*](https://www.dw.com/en/are-scientists-finally-beating-antimicrobial-resistance/a-69275675), [*Guardian*](https://www.theguardian.com/society/article/2024/jun/05/ai-antibiotic-resistance), [*El País*](https://elpais.com/ciencia/2024-06-05/desvelado-el-mayor-catalogo-de-nuevas-moleculas-antibioticas-casi-un-millon-de-compuestos-desconocidos.html), [*Folha de São Paulo*](https://www1.folha.uol.com.br/equilibrioesaude/2024/06/estudo-identifica-quase-1-milhao-de-substancias-potenciais-contra-bacterias-resistentes.shtml) as well as mentions as a [Nature Research Highlight](https://www.nature.com/articles/d41586-024-01654-9) and in the [Science Adviser](https://www.science.org/content/article/scienceadviser-kicking-trump-twitter-helped-reduce-fake-news).
- **Jun 5** AMPSphere manuscript [published in Cell](https://doi.org/10.1016/j.cell.2024.05.013)
- **May 14** New Season of [Extremely Open Science](/extremely-open-science/). See [episode 1](https://youtu.be/N-O3n63-fcY?si=LgNx5cabFEots3jA) and the [sardyne github repository](https://github.com/BigDataBiology/sardyne)
- **Apr 27** [argNorm](https://github.com/BigDataBiology/argNorm) v0.3.0 has been released
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
isRecent pub = pub.year >= 2022

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

