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
        , siteName = "elm-pages"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Luis Pedro Coelho's Website"
        , locale = Nothing
        , title = "Luis Pedro Coelho"
        }
        |> Seo.website


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

I am currently looking for postdocs to [join my group in
Shanghai](https://big-data-biology.org/positions). Come work with me on
metagenomics, antimicrobial resistance, algorithms, or just propose your
own project.

# Who am I?

I am the principal investigator of the [Big Data Biology
Lab](https://big-data-biology.org) at Fudan University (Shanghai) since
September 2018. Our group works in computational biology, with a focus
on large-scale microbiome analyses.

Previously, I worked at the European Molecular Biology Laboratory (EMBL) in
[Peer Bork's group](https://www.embl.de/~bork/). I have a PhD from [Carnegie Mellon
University](https://www.compbio.cmu.edu/) (2011), where I worked on [bioimage
informatics](https://en.wikipedia.org/wiki/Bioimage_informatics) for subcellular
location analysis with [Bob Murphy](https://murphylab.web.cmu.edu/).

My [Erdös-Bacon number is 7](/erdos-bacon).

[Publication list](/publications)

# Upcoming Travels & Talks

**2023 Jan 9-13** At the University of Warwick

[Email me](mailto:luis@luispedro.org) if you want to set up meetings at
any of these opportunities (or to invite me for other opportunities).

If you want to chat with me about science and such, you can use [my calendly
link](https://calendly.com/luis-pedro-coelho/pub-zoom-15).

# Research Interests

**More technical version:** I am interested in combining meta\'omics
(methods that obtain high-throughput information on microbial
communities such as metagenomics and metatranscriptomics) analysis with
machine learning approaches to learn about microbial communities in
different environments. I wish to answer basic questions on what
determines the structure of a microbial community in a given environment
and what are the differences/similarities between different
environments.

My work is a mix of of
[method](https://www.nature.com/nmeth/journal/v10/n12/abs/nmeth.2693.html) and
[tool](https://ngless.embl.de) development with
[applications](https://doi.org/10.1126/science.1261359). In methodological
terms, I worry a lot about [correct evaluation of
methods](https://luispedro.org/projects/gen-classification) and avoiding
over-inflated measures of performance. A large fraction of my time is spent
scaling up algorithms and [pipelines](https://doi.org/10.5334/jors.161) to work
on very-large problems.

**Not-so technical version:** With modern technology, namely robotic
instruments, it is easy to acquire a lot of microscopic pictures. It is
also possible to acquire large sequence datasets with the DNA of many
organisms. I use these two families of technologies to investigate what
is happening in mixed microbial communities such as the one in our guts,
the [microbiome](https://en.wikipedia.org/wiki/Microbiome).

In order to be able to use these data, I also need to develop new
computer methods (software) for these tasks. Thus my work is a mix of
solving biological problems and tackling the software issues that stand
in the way of doing so.


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

# Other News

(See above for papers)

**2022**

**2022 September 17-21** [ECCB 2022](https://eccb2022.org/) I will present in
the [Quest for Orthologs](https://eccb2022.org/ntb-w11/) workshop

**2022 September 24-29** I will attend
[EDAR](https://www.gu.se/en/care/edar6-gothenburg-2022)


**2022 June 9**: [Novozymes Prize Awardee 2021 - Novozymes Prize Symposium](https://www.tilmeld.dk/novozymesprize/symposium-programme)

**2022 June 2**: [Open Office Hours](https://us02web.zoom.us/meeting/register/tZIlc-qpqzMiG9RNqWXchILK34JSfqwKUDKA)

**April 6-9**: Keystone Symposium
[Micropeptides: Biogenesis and Function](https://www.keystonesymposia.org/KS/Online/Events/Future/Details.aspx?EventKey=2022T5&Tabs=1)

**2020**

**Jan 6-7** I was in Gotenburg, Sweden for the first meeting of the
[EMBARK project](http://antimicrobialresistance.eu/)

**2019**

**November 21-27** I was in Sydney, Australia

**July 21-25 2019** I was in Basel for [ECCB/ISMB
2019](https://www.iscb.org/ismbeccb2019)

**June 21-26 2019** I was in San Francisco for [ASM Microbe
2019](https://asm.org/Events/ASM-Microbe/Home)

**April 10-11 2019** I was in Chengdu (China), visiting the University
of Electronic Science and Technology of China.

**April 16-18 2019** I was in Utrecht (Netherlands) for the
[International Conference on One Health Antimicrobial Resistance
(ICOHAR)](http://www.icohar2019.org/icohar2019.html) talking about our
[dog microbiome work](https://doi.org/10.1186/s40168-018-0450-3)

**2018**

**Sep 16-19 2018** I was in Heidelberg for the *Human Microbiome
Conference*

**Oct 4 2018** I was in Paris talking about [single cell
approaches](https://pasic-2018.sciencesconf.org/)

**June 26-29**: [Ireland IHMC2018: International Human Microbiome
Consortium](http://apc.ucc.ie/ihmc-2018/)

**June 14**: I taught the *Introduction to Python* lecture at the
[Lisbon (Portugal) Machine Learning Summer
School](http://lxmls.it.pt/2018/)

**2017**

**Nov 22-24** I was in Schwarzenber, Switzerland for the [Autumn School
\\"Machine Learning applied to Systems
Biology\\"](http://www.sib.swiss/training/upcoming-training-events/2017-11-autumn-school).
I also visited the University of Bern and presented my scientific work.

**Oct 24-26** I was in Copenhagen teaching people how to use
[ngless](https://ngless.embl.de) at the [Microbiome data interpretation
workshop](https://www.eventbrite.com/e/workshop-microbiome-data-interpretation-tickets-34791984763)
(slides
[here](https://ngless.embl.de/_static/gut-metagenomics-tutorial-presentation/gut_specI_tutorial.html))
and giving a scientific talk on my work.

**Sept 12-13** I was in Delft 12-13\\*\\* for a [workshop on data-driven
cell factory and community
design](https://www.eventbrite.com/e/hands-on-introduction-to-data-driven-cell-factory-and-community-design-tickets-35694722877)

**July 21-25** I was in Prague for [ECCB/ISMB
2017](https://www.iscb.org/ismbeccb2017) with a poster on
[NGLess](https://ngless.embl.de)

**July 20 2017** I was in Lisbon on **July 20** for [LxMLS
2017](http://lxmls.it.pt/2017/)

**July 9-13 2017** I was in Valencia for [FEMS
2017](http://fems-microbiology2017.kenes.com)

**23-25 November 2016** I visited Zurich (Switzerland) for the course
[Machine learning for bioinformatics and computational
biology](http://www.sib.swiss/training/for-sib-phd-students/phd-training-events/training-for-phds/ml-for-bioinformatics-and-computational-biology)

**7 March 2016** I am now an Associate Editor of the [Journal of Open
Research Software](http://openresearchsoftware.metajnl.com/)

**22-25 August 2015** Visiting Tallinn (Estonia)

**17 August 2015** The project [ngless is now open
source](https://ngless.embl.de/)

**16 July 2015** I will be teaching at the [Lisbon Machine Learning
School](http://lxmls.it.pt/2015/)

**15-17 June 2015** I will be in beautiful San Sebastian (Spain) for a
software carpentry workshop (and some holiday time).

**March 31-April 2** I attended the [International Human Microbiome
Congress (IHMC)](http://www.ihmc2015.org/) in Luxembourg

**February 2015** I was in Granada for the *2015 Aquatic Sciences
Meeting*, giving [a talk on the 26th on our metagenomics
work](http://www.sgmeet.com/aslo/granada2015/sessionschedule.asp?SessionID=075)

**November 2014** I am the lead organizer for a [software carpentry
workshop at
EMBL](http://www.embl.de/training/events/2014/SWC14-01/index.html).

**September 2014** Keynote talk in [Python San
Sebastien](http://pyss.org/) \\[[Online
talk](/files/talks/2014/09-pyss/pyss14.html)\\]

**July 2014** Progression (in which I played the character *Luis*) has
been released at New Filmmakers in NYC. See the film at the [Big Bear
Film festival](http://www.bigbearfilmfestival.com/progression/)

**February 2014** I\\'m now a certified [Software Carpentry
instructor](http://software-carpentry.org/pages/team.html)

**November 2013** I\\'m a member of the [programme
committee](http://dils2014.inesc-id.pt/?page_id=240) for [DILS
2014](http://dils2014.inesc-id.pt/) (10th International Conference on
Data Integration in the Life Sciences)

**July 2013** I got a prize in the [ICSB Computational Biology Wikipedia
Competition](http://www.ploscompbiol.org/article/info:doi/10.1371/journal.pcbi.1003242)
for work on the [Bioimage Informatics
page](http://en.wikipedia.org/wiki/Bioimage_informatics)

[older news items \\...](/news)
"""]

isRecent : Pub.Publication -> Bool
isRecent pub = pub.year >= 2018

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

