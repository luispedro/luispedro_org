---
meta: Traditional subcellular classification methods do not generalize well beyond the proteins in which they were trained. Local feature based methods perform extremely well.
title: Generalisable Subcellular Location Classification
categories: work
---

See the [video abstract](https://dx.doi.org/10.6084/m9.figshare.744842) for the
highlights.

Most of subcellular location analysis in the past has been pursued using
datasets that contain multiple copies of the same *representative* protein
(i.e., a specific protein is selected to serve as a **nuclear protein**,
another to serve as a **microtubular** protein).

Algorithms are then evaluated by measuring their ability to recognise this
protein. It has then been inferred that the algorithm is thus capable of
recognizing location patterns. Unfortunately, this is a leap of judgement that
has not been tested. We tested this using a new dataset with multiple proteins
standing in the same location group.

![Generalization results](/files/images/generalization-plot3.png)

The algorithms we were using previously performed significantly worse in this
new dataset and we thus employed new methods to achieve better results.

The paper describing this work has been published in Bioinformatics:

> *Determining the subcellular location of new proteins from microscope images
> using local features* by **Luis Pedro Coelho**, Joshua D. Kangas, Armaghan
> Naik, Elvira Osuna-Highley, Estelle Glory-Afshar, Margaret Fuhrman, Ramanuja
> Simha, Peter B. Berget, Jonathan W. Jarvik, and Robert F. Murphy (2013).
> Bioinformatics, [[DOI](https://dx.doi.org/10.1093/bioinformatics/btt392)]
> [[open access
> version](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3753569/)]

(For the BibTeX citation, see below.)

[Download the data from Data Dryad](https://doi.org/10.5061/dryad.2vm70)

## Local Features for Bioimage Analysis

We also show that using [SURF](https://en.wikipedia.org/wiki/SURF) (a form of
local features) achieves excellent results in subcellular classification and we
recommend it for bioimage analysis.

Open source code is available as part of my computer vision package,
[mahotas](/software/mahotas), to implement these features.

We have a step-by-step tutorial on how to [apply SURF to your own
research](https://mahotas.readthedocs.org/en/latest/surfref.html). Feel free to
[email me](mailto:luis@luispedro.org) if you run into trouble.

We also made available the code [to reproduce the paper
exactly](https://github.com/luispedro/Coelho2013_Bioinformatics).

You can also read [several blog posts related to this
paper](https://metarabbit.wordpress.com/tag/coelho2013_bioinformatics/).

## Citation

Here is the full bibtex citation:

    @article{Coelho08072013,
    author = {Coelho, Luis Pedro and Kangas, Joshua D. and Naik, Armaghan W.
        and Osuna-Highley, Elvira and Glory-Afshar, Estelle and Fuhrman, Margaret
        and Simha, Ramanuja and Berget, Peter B. and Jarvik, Jonathan W. and
        Murphy, Robert F.},
    title = {Determining the subcellular location of new proteins from
        microscope images using local features},
    doi = {10.1093/bioinformatics/btt392},
    volume = {29},
    number = {18},
    pages = {2343-2349},
    year = {2013},
    journal = {Bioinformatics},

    abstract = {Motivation: Evaluation of previous systems for automated
        determination of subcellular location from microscope images has been done
        using datasets in which each location class consisted of multiple images of
        the same representative protein. Here, we frame a more challenging and
        useful problem where previously unseen proteins are to be classified.

        Results: Using CD-tagging, we generated two new image datasets for
        evaluation of this problem, which contain several different proteins
        for each location class. Evaluation of previous methods on these new
        datasets showed that it is much harder to train a classifier that
        generalizes across different proteins than one that simply recognizes a
        protein it was trained on. We therefore developed and evaluated
        additional approaches, incorporating novel modifications of local
        features techniques. These extended the notion of local features to
        exploit both the protein image and any reference markers that were
        imaged in parallel. With these, we obtained a large accuracy
        improvement in our new datasets over existing methods. Additionally,
        these features help achieve classification improvements for other
        previously studied datasets.

        Availability: The datasets are available for download at
        https://murphylab.cbd.cmu.edu/data/. The software was written in Python
        and C++ and is available under an open-source license at
        https://murphylab.cbd.cmu.edu/software/. The code is split into a
        library which can be easily reused for other data and a small driver
        script for reproducing all results presented here. A step-by-step
        tutorial on applying the methods to new datasets is also available at
        that address.

        Contact: murphy@cmu.edu}
    }
