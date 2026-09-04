---
title: Projects
categories: work
meta: Research projects by Luis Pedro Coelho on subcellular location analysis, bioimage informatics and computational biology
---

These are the projects from my PhD and early postdoctoral years (2008–2013), on
bioimage informatics and subcellular location analysis. For my current work on
microbiomes, see the [Big Data Biology Lab](https://big-data-biology.org)
website, my [scientific biography](/scientific-biography), or my
[publications](/publications).

## Generalisable Subcellular Location Analysis

Most of subcellular location analysis in the past has been pursued using
datasets that contain multiple copies of the same *representative*
protein (i.e., a specific protein is selected to serve as a **nuclear
protein**, another to serve as a **microtubular** protein).

Algorithms are then evaluated by measuring their ability to recognise
this protein. It has then been inferred that the algorithm is thus
capable of recognizing location patterns. Unfortunately, this is a leap
of judgement that has not been tested. We tested this using a new
dataset with multiple proteins standing in the same location group.

The algorithms we were using previously performed significantly worse in
this new dataset and we thus employed new methods to achieve better
results.

The manuscript describing this project and its results was [published in
*Bioinformatics*](https://dx.doi.org/10.1093/bioinformatics/btt392) in 2013.

[Read more](/projects/gen-classification)

## Unsupervised Subcellular Pattern Unmixing

The goal is to handle mixed subcellular location patterns (the result of
having a protein or marker simultaneously present in multiple
organelles) in an unsupervised manner (without requiring that basic
organelles be specified).

This was work with Tao Peng and Bob Murphy and the main result was that
unsupervised unmixing could work as well as the supervised version.

This work was published as [Quantifying the distribution of probes between
subcellular locations using unsupervised pattern
unmixing](https://doi.org/10.1093/bioinformatics/btq220) in *Bioinformatics*
(2010).

## Nuclear Segmentation

The goal of this project was to quantitatively evaluate a series of
nuclear segmentation algorithms for use in our work. We hand-segmented
several images from two datasets and used those as gold standards to
evaluate methods.

![Example image from the dataset](/files/images/gnf-segmented-41.png)

[More info on Nuclear Segmentation](/projects/nuclear-segmentation)

## SLIF

SLIF is the `structured literature image finder`
(previously, `subcellular location image finder`).

It searches through scientific journals, looking for images, which it
categorises, makes available, and (in some cases, at least) analyses.

SLIF was one of the four finalists in the Elsevier Grand Challenge. It is
described in [Structured literature image finder: extracting information from
text and images in biomedical
literature](https://doi.org/10.1007/978-3-642-13131-8_4) (2010).

## Programming for Scientists

Programming for Scientists is a course I designed for scientists who
write code. The project grew out of informal discussions with others,
but it crystalised around the observation that many scientists now write
code as one of their primary activities (at least as defined on time
spent) without a proper formal background for it.

[More info on PfS](/projects/pfs)
