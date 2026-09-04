---
title: Scientific Biography
categories: about-me
meta: Biography of Luis Pedro Coelho, a group leader at the Centre for Microbiome Research (QUT)
---

My work spans two subfields of computational biology: bioimage informatics and
metagenomics-based microbial ecology. I started in the first and, since 2013,
have worked mostly in the second; since 2018, I have led my own group, first at
Fudan University (Shanghai) and, since 2023, at the [Centre for Microbiome
Research](https://research.qut.edu.au/cmr/) at the Queensland University of
Technology (Brisbane).

## Bioimage informatics (fluorescence microscopy image analysis)

During my PhD work at Carnegie Mellon University (CMU) working with [Prof.
Robert F.  Murphy](https://www.andrew.cmu.edu/user/murphy/), I developed
methods for the automated analysis of fluorescence microscopy images for
subcellular location analysis: the analysis of cellular images of eukaryotic
cells where one or more protein or structure of interest has been tagged
fluorescently.  At CMU, I initially worked on the SLIF project, which extracted
and reanalysed images embedded in published literature.  This project combined
image analysis and text modeling. I worked on the image analysis component,
extending the system beyond fluorescence microscopy panels to encompass other
types of images. The SLIF project was one of [4 finalists in the Elsevier Grand
Challenge](https://www.elsevier.com/about/press-releases/corporate/finalists-announced-in-the-elsevier-grand-challenge)
([Ahmed et al., 2009](https://dx.doi.org/10.1016/j.websem.2010.04.002); [Coelho
et al., 2010](https://link.springer.com/chapter/10.1007/978-3-642-13131-8_4)).


I then developed and implemented machine learning methods for deconvolving
mixtures of location patterns (when a protein is present, in differing
quantities, in more than one location, e.g., the nucleus and the cytoplasm). I
extended previous work that solved the supervised version of this problem —when
the basis patterns are known and given to the algorithm ([Peng et al.,
2010](https://www.pnas.org/content/107/7/2944.short))—to work in an unsupervised
fashion ([Coelho*, Peng*, et al., 2011](https://bioinformatics.oxfordjournals.org/cgi/content/abstract/26/12/i7)).

One basic task in the field of bioimage analysis is classification of
subcellular patterns (and, more generally, supervised classification of
phenotypes). Although this was one of the original problems that sparked the
field ([Boland et al., 1998](https://www.ncbi.nlm.nih.gov/pubmed/9822349)),
most of the methods in the field were evaluated using a simplistic method
framework: namely, several images of the same protein using the same tagging
method were used to represent a given pattern (e.g., LAMP2 was used to
represent lysosomes). These images were then repeatedly partitioned into
training and testing so that algorithms were learned on the training set and
evaluated on the testing one. This is known as cross-validation and is an
excellent way to measure of the accuracy when the task is to recognize the
given protein. However, as I showed in ([Coelho et al.,
2013](https://dx.doi.org/10.1093/bioinformatics/btt392)) this leads to an
over-inflated measure of performance when the real task
is to extrapolate from the patterns exhibited by known proteins to proteins of
unknown localization. In fact, the algorithm can obtain high accuracy by learning to
recognize artifactual information (e.g., how bright the tagging is). I adapted
the SURF method ([Bay et al.,
2006](https://link.springer.com/chapter/10.1007/11744023_32)) to work in the
subcellular domain and showed that they perform significantly better in
generalization. The image data used to validate this dataset was collected by
myself and annotated by 3 different experts, including myself.

Another domain where I successfully developed machine learning techniques for
bioimage analysis is that of quantifying neutrophil extracellular traps (NETs)
in tagged images. This problem could be, in principle, solved using
segmentation: once the area of the field where NETs are present has been
segmented, quantification is trivial. However preliminary work showed that it
is a hard problem; particularly as different experts disagree on the exact
segmentation of any particular image. Nonetheless, despite extensive
pixel-level disagreement, experts report very similar measures on overall
amount of NETs present in an image. Thus, I developed a method which uses
imperfect segmentation and random forest regression to achieve a high
correlation between the algorithm and the human operator; the cross-validated
R² is 93% ([Coelho et al.,
2015](https://doi.org/10.1093/bioinformatics/btv156)).

As part of this body of work, I developed the [mahotas Python library for
computer vision](https://mahotas.readthedocs.io) ([Coelho,
2013](https://dx.doi.org/10.5334/jors.ac)). This package includes several
general-purpose algorithms for image processing and it has been used by others
in bioimage analysis as well as in other domains.

I later applied some of the same techniques in the context of
identifying protists in high-throughput fluorescence microscopy ([Colin\*,
Coelho\*, et al., 2017](https://doi.org/10.7554/eLife.26066.001)). In this work,
I developed the computational pipeline for processing fluorescence microscopy
images of environmental (marine) samples containing a mixture of protists. The
system automatically segments the images to extract individual objects
(individual organisms or debris) and classifies them into one of 155 classes
with 82% accuracy (which is on par with the inter-operator agreement measured
for similar problems). In addition to the challenge of processing a large
dataset (>300,000 objects), when compared to the tissue culture problems on
which I had worked on before, environmental samples exhibit higher variability
in the morphology and brightness of the different objects.

## Microbial ecology using metagenomics (EMBL, 2013–2018)

From 2013 to 2018, I worked with [Peer
Bork](https://www.embl.de/research/units/scb/bork/), at EMBL (Heidelberg). In
his lab, I continued to work on bioimage analysis problems (resulting in the
publication of our protist pipeline). However, in parallel, I also extended my
expertise to the analysis of metagenomics data to answer microbial ecology
questions. In this context, I worked on both method development (including
implementing new tools) and applications.

Early on in the Bork lab, I was involved in developing the mOTUs tool
(metagenomic OTUs), an approach for taxonomic quantification of metagenomic
samples which extends reference based methods to be able to infer the existence
of species for which there is no reference genome based on metagenomics data
([Sunagawa et al., 2013](https://dx.doi.org/10.1038/nmeth.2693)).

Subsequently, as part of the Tara Oceans project, I worked on analysing the
relationship between prokaryotic community composition and environmental
parameters ([Sunagawa\*, Coelho\*, Chaffron\* et al.,
2015](https://doi.org/10.1126/science.1261359)). As part of this work, we built
and presented a gene catalog of the marine prokaryotic world. When we related
the taxonomic or functional profiles of each metagenome to environmental
parameters of the sample (measured in situ), we concluded that
temperature is the main environmental determinant of microbial community
composition at the surface: in particular, microbial composition can be used to
predict temperature with very high precision (cross-validated R²: 86%) using a
simple machine-learning based method I developed. I have used the same model in
other context, e.g., predicting Parkinson disease from gut microbiome profiles
([Bedarf\*, Hildebrand\* et al.,
2017](https://doi.org/10.1186/s13073-017-0428-y)).

At the time, I also worked on improving the implementation of metagenomics data
processing code in MOCAT (version 1 of the tool would not have been able to
process the Tara oceans dataset in a reasonable timeframe). That work was later
included in the next version of the tool, namely MOCAT2 ([Kultima et al.,
2016](https://doi.org/10.1093/bioinformatics/btw183)).

I also built a gene catalog of the dog gut microbiome as part of the
analysis of a randomized diet study of dogs (high-protein low-carbohydrate vs.
low-protein high-carbohydrate diets). This gene catalog contains 1.24 million
genes. We compared it to existing mammal gut catalogs (for human, pig, and
mouse) and found that only a small minority of genes are present in more than
one mammalian gut. Among the different non-human animal microbiomes considered,
the dog microbiome was overall the most similar to the human gut microbiome.
Using the metaSNV tool ([Costea\*, Munch\*, et al.,
2017](https://doi.org/10.1371/journal.pone.0182392)), which I helped develop,
we were able to determine that even when the same species was detected in both
human and dog microbiota, there were clearly distinct strains. Thus the
observed similarity between these two microbiomes is not due to recent strain
sharing. Finally, we analysed the effects of the dietary intervention and
observed that the dog microbiome responded in similar ways to the human one. A
novel finding, however, was that the microbiome of overweight/obese dogs
shifted more in compositional space upon a change of diet, when compared to the
microbiome of lean/normal dogs. This is consistent with the so called Anna
Karenina hypothesis that dysbiotic microbiomes are more diverse than healthy
ones and it is a finding that should be tested in humans ([Coelho et al.,
2018](https://doi.org/10.1186/s40168-018-0450-3)).

To analyse these datasets, I have developed a tool, called NGLess (see
[https://www.big-data-biology.org/software/ngless/](https://www.big-data-biology.org/software/ngless/)) which is based on a new
approach (a domain specific language for sequence processing) to ensure
reproducibility of the processing pipelines. In addition to building upon the
afore-mentioned MOCAT/MOCAT2 tools, this work incorporates ideas from a generic
reproducible computational pipeline tool, Jug, that I have developed throughout
the last decade as a support tool for my own projects, but which has since used
by others as well ([Coelho, 2017](https://doi.org/10.5334/jors.161)).

I also worked on validating the use of the eggnog-mapper tool on metagenomics
data ([Huerta-Cepas et al., 2017](https://doi.org/10.1093/molbev/msx148)),
which is now our state-of-the-art tool for gene annotation.

I contributed to analysing how the planktonic community structure contributes
to carbon capture ([Guidi\*, Chaffron\*, Bittner\* et al.,
2016](https://doi.org/10.1038/nature16942)), how antibiotic resistance is
distributed across geography ([Forslund et al.,
2014](https://doi.org/10.1002/bies.201300143)), how the infant microbiome is
formed ([Korpela et al., 2018](https://doi.org/10.1101/gr.233940.117)), and how
there is a natural structure to the bacterial world below species level, what
we termed subspecies ([Costea et al.,
2017](https://doi.org/10.15252/msb.20177589)).

## Leading a group: Fudan University (2018–2023) and QUT (2023–present)

Since 2018, I have led my own group (the Big Data Biology Lab), first at Fudan
University in Shanghai and, since 2023, at the Centre for Microbiome Research
at the Queensland University of Technology in Brisbane. The group works on the
global microbiome: what genes and proteins are out there, how they are
distributed across habitats, and what computational methods are needed to find
them.

### Global gene and protein catalogs

The organizing idea of much of this work is that publicly available metagenomes,
taken together, cover a large fraction of the microbial world and can be
analysed as a single object. Building on the gene catalogs I had worked on
earlier, and in work that started at EMBL, we built the *Global Microbial Gene
Catalog* (GMGC), which unifies genes predicted from metagenomes spanning
marine, soil, and host-associated habitats ([Coelho et al.,
2022](https://doi.org/10.1038/s41586-021-04233-4); browsable at
[gmgc.embl.de](https://gmgc.embl.de/)). Analysing it showed that
most genes are rare and specific to a single habitat, so that gene-level
diversity is much less shared across environments than species-level
comparisons would suggest.

Standard gene prediction discards short open reading frames, so small proteins
(fewer than 100 amino acids) are systematically missing from catalogs of this
sort, even though they include many bioactive molecules. We therefore built the
*Global Microbial smORF Catalogue* (GMSC), which recovers these small proteins
from the same data ([Duan et al.,
2024](https://doi.org/10.1038/s41467-024-51894-6); browsable at
[gmsc.big-data-biology.org](https://gmsc.big-data-biology.org/)). Small
proteins have since become the main focus of my research and are the subject of
the [ARC Future
Fellowship](https://rms.arc.gov.au/RMS/Report/Download/Report/a3f6be6e-33f7-4fb5-98a6-7526aaa184cf/249)
I was awarded in 2023.

### Antimicrobial peptides

One class of small proteins with obvious practical interest is that of
antimicrobial peptides (AMPs). We first built Macrel, a machine-learning
pipeline that screens genomes and metagenomes for AMPs ([Santos-Júnior et al.,
2020](https://doi.org/10.7717/peerj.10555)), and then applied it at the scale
of the global microbiome to produce
[AMPSphere](https://ampsphere.big-data-biology.org/), a resource of candidate
AMPs ([Santos-Júnior\*, Torres\*, et al.,
2024](https://doi.org/10.1016/j.cell.2024.05.013), work carried out together
with Cesar de la Fuente-Nunez's group). A subset of the candidates was
chemically synthesized and tested experimentally, both *in vitro* and in mouse
infection models, confirming that computational prediction at this scale
recovers molecules with real antibacterial activity. This work was widely
covered in the [press](/press).

### Methods for metagenomics

Assembling and binning metagenomes is the step that turns raw sequencing data
into genomes, and it remained a bottleneck. We developed SemiBin, which uses a
siamese neural network to learn, from a small amount of taxonomic annotation,
how to group contigs into genomes ([Pan et al.,
2022](https://doi.org/10.1038/s41467-022-29843-y)). Its successor, SemiBin2,
replaces this with self-supervised contrastive learning, removing the
dependence on annotation and extending the method to long reads ([Pan et al.,
2023](https://doi.org/10.1093/bioinformatics/btad209)). SemiBin is [freely available](/software/semibin). In a
related line of work, we developed metaMIC, which identifies and corrects
misassemblies without a reference ([Lai et al.,
2022](https://doi.org/10.1186/s13059-022-02810-y)).

Earlier, I had developed NGLess, a domain-specific language for sequence
processing, and NG-meta-profiler, a set of metagenomic profiling pipelines
built with it ([Coelho et al.,
2019](https://doi.org/10.1186/s40168-019-0684-8)). Making research software
that outlives the project that produced it is a long-standing interest of mine,
which I have also argued for explicitly ([Coelho,
2024](https://doi.org/10.1371/journal.pcbi.1011920)).

### Antimicrobial resistance

Through the EMBARK project and, more recently, the SEARCHER project in
Australia, the group also works on antimicrobial resistance in the
environment. A recurring problem
is that the available tools disagree with each other, in part because they use
incompatible vocabularies. We built argNorm, which normalizes the output of
different antibiotic resistance gene annotation tools to the Antibiotic
Resistance Ontology ([Ugarcina Perovic et al.,
2025](https://doi.org/10.1093/bioinformatics/btaf173)), and then used a
normalized comparison to quantify how much the pipelines actually disagree
([Inda-Díaz et al., 2026](https://doi.org/10.64898/2026.05.11.724158)).

### Evolution and ecology of prokaryotic genomes

Alongside the method development, we have used these resources to ask
ecological and evolutionary questions, such as which pressures drive horizontal
gene transfer across prokaryotic genomes ([Dmitrijeva et al.,
2024](https://doi.org/10.1038/s41559-024-02357-0), with Christian von Mering's
group).

A full list is available on my [publications page](/publications).

*Last updated: September 2026.*
