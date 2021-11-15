---
title: Publications (BibTeX)
categories: research
permalink: publications/bibtex
---

Download `this list </files/papers/luispedro.bib>`__

::

    @article {BIES:BIES201300143,
        author = {Forslund, Kristoffer and Sunagawa, Shinichi and Coelho, Luis P. and Bork, Peer},
        title = {Metagenomic insights into the human gut resistome and the forces that shape it},
        journal = {BioEssays},
        volume = {36},
        number = {3},
        issn = {1521-1878},
        url = {http://dx.doi.org/10.1002/bies.201300143},
        doi = {10.1002/bies.201300143},
        pages = {316--329},
        keywords = {agricultural growth promoters, antibiotic resistance, antibiotic stewardship, antibiotics, gut microbiome, metagenomics, resistome},
        year = {2014},
    }


    @article{liehl2013host,
        title={Host-cell sensors for Plasmodium activate innate immunity against liver-stage infection},
        author={Liehl, Peter and Zuzarte-Lu{\'\i}s, Vanessa and Chan, Jennie
        and Zillinger, Thomas and Baptista, Fernanda and Carapau, Daniel and
        Konert, Madlen and Hanson, Kirsten K and Carret, C{\'e}line and
        Lassnig, Caroline and others},
        journal={Nature medicine},
        year={2013},
        publisher={Nature Publishing Group}
    }


    @article{Sunagawa2013,
        author = {Shinichi Sunagawa and Daniel R Mende and Georg Zeller and
        Fernando Izquierdo-Carrasco and Simon A Berger and Jens Roat Kultima
        and Luis Pedro Coelho and Manimozhiyan Arumugam and Julien Tap and
        Henrik Bjørn Nielsen and Simon Rasmussen and Søren Brunak and Oluf
        Pedersen and Francisco Guarner and Willem M de Vos and Jun Wang and
        Junhua Li and Joël Doré and S Dusko Ehrlich and Alexandros Stamatakis and
        Peer Bork},
        title = {Metagenomic species profiling using universal phylogenetic marker genes},
        year = {2013},
        doi = {10.1038/nmeth.2693}
    }


    @article{Coelho08072013,
    author = {Coelho, Luis Pedro and Kangas, Joshua D. and Naik, Armaghan W.
        and Osuna-Highley, Elvira and Glory-Afshar, Estelle and Fuhrman, Margaret
        and Simha, Ramanuja and Berget, Peter B. and Jarvik, Jonathan W. and
        Murphy, Robert F.},
    title = {Determining the subcellular location of new proteins from
        microscope images using local features},

    year = {2013},
    doi = {10.1093/bioinformatics/btt392},

    volume = {29}, 
    number = {18}, 
    pages = {2343-2349}, 


    abstract ={Motivation: Evaluation of previous systems for automated
        determination of subcellular location from microscope images has been done
        using datasets in which each location class consisted of multiple images of
        the same representative protein. Here, we frame a more challenging and
        useful problem where previously unseen proteins are to be
        classified.

        Results: Using CD-tagging, we generated two new image datasets for
        evaluation of this problem, which contain several different proteins
        for each location class. Evaluation of previous methods on these new
        datasets showed that it is much harder to train a classifier that
        generalizes across different proteins than one that simply recognizes a
        protein it was trained on.We therefore developed and evaluated
        additional approaches, incorporating novel modifications of local
        features techniques. These extended the notion of local features to
        exploit both the protein image and any reference markers that were
        imaged in parallel. With these, we obtained a large accuracy
        improvement in our new datasets over existing methods. Additionally,
        these features help achieve classification improvements for other
        previously studied datasets.

        Availability: The datasets are available for download at
        http://murphylab.web.cmu.edu/data/. The software was written in Python
        and C++ and is available under an open-source license at
        http://murphylab.web.cmu.edu/software/. The code is split into a
        library which can be easily reused for other data and a small driver
        script for reproducing all results presented here. A step-by-step
        tutorial on applying the methods to new datasets is also available at
        that address.

        Contact: murphy@cmu.edu},

    URL = {http://bioinformatics.oxfordjournals.org/content/early/2013/07/07/bioinformatics.btt392.abstract},
    eprint = {http://bioinformatics.oxfordjournals.org/content/early/2013/07/07/bioinformatics.btt392.full.pdf+html},
    journal = {Bioinformatics}
    }

    @article{Coelho15062010,
        author = {Coelho, Luis Pedro and Peng, Tao and Murphy, Robert F.}, 
        title = {Quantifying the distribution of probes between subcellular locations using unsupervised pattern unmixing}, 
        volume = {26}, 
        number = {12}, 
        pages = {i7-i12}, 
        year = {2010}, 
        doi = {10.1093/bioinformatics/btq220}, 
        URL = {http://bioinformatics.oxfordjournals.org/content/26/12/i7.abstract}, 
        eprint = {http://bioinformatics.oxfordjournals.org/content/26/12/i7.full.pdf+html}, 
        journal = {Bioinformatics} 
    }


    @inproceedings{dotted,
        title = {Dotted Suffix Trees: A Structure for Approximate Text Indexing},
        volume = {4209},
        year = {2006},
        pages = {329--336},
        publisher = {Springer},
        address = {Glasgow, Scotland},
        abstract = {The problem we address is text indexing for approximate
        matching. Given a text $T$ which undergoes some preprocessing to generate
        an index, we can later query this index to identify the places where a
        string occurs up to a certain number of errors $k$ (edition distance). The
        indexing structure occupies space $O(n \log^k n)$ in the average case,
        independent of alphabet size. This structure can be used to report the
        existence of a match with k errors in $O(3^k m^{k+1})$ and to report the
        occurrences in $O(3^k m^{k+1} + ed)$ time, where $m$ is the length of the
        pattern and ed and the number of matching edit scripts. The construction of
        the structure has time bound by $O(kNS)$, where $N$ is the number of nodes
        in the index and $S$ the alphabet size.},
        keywords = {String indexing, approximate matching},
        URL = {http://luispedro.org/files/dot-link.pdf},
        author = {Luis Pedro Coelho and Arlindo Oliveira}
    }


    @inproceedings{adaptive,
        title={An Adaptive Multiresolution Approach to Fingerprint Recognition},
        author = {Amina Chebira and Luis Pedro Coelho and Aliaksei Sandryhaila and Stephen Lin and William G. Jenkinson and Jeremiah MacSleyne and Christopher Hoffman and Philipp Cuadra and Charles Jackson and Markus P{\"u}schel and Jelena Kovacevic},
        booktitle={IEEE International Conference on Image Processing (ICIP 2007)},
        year={2007},
        month={Oct},
        volume={1},
        number={},
        pages={i457--460},
        abstract={We propose an adaptive multiresolution (MR) approach to the
        classification of fingerprint images. The system adds MR decomposition in
        front of a generic classifier consisting of feature computation and
        classification in each MR subspace, yielding local decisions, which are
        then combined into a global decision using a weighting algorithm. In our
        previous work on classification of protein subcellular location images, we
        showed that the space-frequency localized information in the MR subspaces
        adds significantly to the discriminative power of the system. Here, we go
        one step farther; We develop a new weighting method which allows for the
        discriminative power of each subband to be expressed and examined within
        each class. This, in turn, allows us to evaluate the importance of the
        information contained within a specific subband. Moreover, we develop a
        pruning procedure to eliminate the subbands that do not contain useful
        information. This leads to potential identification of the appropriate MR
        decomposition both on a per class basis and for a given dataset. With this
        new approach, we make the system adaptive, flexible as well as more
        accurate and efficient.},
        keywords={fingerprint identification, image classification, image
        resolutionadaptive multiresolution approach, fingerprint recognition,
        generic classifier, image classification, space-frequency localized
        information, weighting algorithm},
        doi={10.1109/ICIP.2007.4378990},
        ISSN={1522-4880},
    }

    @inproceedings{bird,
        title = {Identifying Subcellular Locations from Images of Unknown Resolution},
        editor = {Elloumi, M.; Küng, J.; Linial, M.; Murphy, R.; Schneider, K.; Toma, C.},
        volume = {13},
        year = {2008},
        month = {07/07/2008},
        publisher = {Springer},
        address = {Vienna, Austria},
        abstract = {Our group has previously used machine learning techniques to
        develop computational systems to automatically analyse fluorescence
        microscope images and classify the location of the depicted protein. Based
        on this work, we developed a system, the Subcellular Location Image Finder
        (slif), which mines images from scientifioc journals for analysis.

        For some of the images in journals, the system is able to automatically compute
        the pixel resolution (the physical space represented by each pixel), by
        identifying a scale bar and processing the caption text. However, scale bars
        are not always included. For those images, the pixel resolution is unknown.
        Blindly feeding these images into the classification pipeline results in
        unacceptably low accuracy. We first describe methods that minimise the impact
        of this problem by training resolution-insensitive classifiers.

        We show that these techniques are of limited use as classifiers can only be
        made insensitive to resolutions which are similar to each other. We then
        approach the problem in a different way by trying to estimate the resolution
        automatically and processing the image based on this prediction. Testing on
        digitally down-sampled images shows that the combination of these two
        approaches gives classification results which are essentially as good as if the
        resolution had been known.},
        keywords = {image processing; bioimaging},
        ISBN = {978-3-540-70598-7},
        author = {Luis Pedro Coelho and Robert F. Murphy}
    }

    @inproceedings{lpc:unmixing:cil2009,
        title = {Unsupervised Unmixing of Subcellular Location Patterns},
        author = {Luis Pedro Coelho and Robert F. Murphy},
        publisher = {Online Proceedings},
        address = {Montreal, Canada},
        year = {2009},
        month = {May},
        booktitle = {Proceedings of ICML-UAI-COLT 2009 Workshop on Automated Interpretation and Modeling of Cell Images (Cell Image Learning)},
        abstract = {With the advent of high-throughput microscopes, researchers can
        routinely image hundreds of different proteins per day, generating
        thousands of images. To be able to organize these images and extract
        meaningful information, we need automatic methods. The state-of-the-art in
        automated subcellular localization is classification in the space of image
        features. This approach is not suited, however, for handling mixture
        patterns (the pattern of a protein present in more than one location).

        We have previously described methods for determining the fraction of
        fluorescence in various subcellular locations when the basic locations in
        which a protein can be present are given a priori. However, knowing all
        fundamental patterns a priori may be problematic. The alternative is
        unsupervised unmixing: given a set of images from different proteins,
        identify the basic patterns that best explain all the observed images as
        either examples of such basic patterns or combinations thereof. 

        We extend our previous work to handle this problem. Using a validation
        dataset, we show that this method can recover the underlying mixed
        patterns. It identifies meaningful basis patterns and mixture coefficients
        that correlate well with the probe concentrations that generated the
        dataset (the probe concentrations were kept hidden from the algorithm).},

        url = {http://luispedro.org/papers/2009/lpc-unmixing-cil09.pdf},
    }

    @inproceedings{lpc:slif:biolink2009,
        author = {Amr Ahmed and Andrew Arnold and Luis Pedro Coelho and Joshua Kangas and Abdul-Saboor Sheikk and Eric P. Xing and William W. Cohen and Robert F. Murphy},
        title = {Structured Literature Image Finder},
        booktitle = {Proceedings of the Ninth Annual Meeting of the ISMB BioLINK Special Interest Group},
        pages = {209--212},
        year = {2009},
        month = {July},
        url = {http://luispedro.org/papers/2009/lpc-slif-biolink09.pdf},
    }

    @inproceedings{lpc:nuclear:isbi2009,
        author = {Luis Pedro Coelho and Aabid Shariff and Robert F. Murphy},
        title = {Nuclear segmentation in microscope cell images: A hand-segmented dataset and comparison of algorithms},
        booktitle = {Proceedings of the 2009 {IEEE} International Symposium on Biomedical Imaging},
        year = {2009},
        month = {June},
        pages = {518--521},
        url = {http://luispedro.org/papers/2009/lpc-nuclear-isbi09.pdf},
        abstract={Image segmentation is an essential step in many image analysis
        pipelines and many algorithms have been proposed to solve this problem.
        However, they are often evaluated subjectively or based on a small number
        of examples. To fill this gap, we hand-segmented a set of 97 fluorescence
        microscopy images (a total of 4009 cells) and objectively evaluated some
        previously proposed segmentation algorithms. We focus on algorithms
        appropriate for high-throughput settings, where only minimal user
        intervention is feasible. The hand-labeled dataset (and all software used
        to compare methods) is publicly available to enable others to use it as a
        benchmark for newly proposed algorithms.},
        keywords={biomedical optical imaging, cellular biophysics, image segmentation, medical image processing, optical microscopycells, fluorescence microscopy, hand-labeled dataset, high-throughput settings, image analysis pipelines, image segmentation, microscope}, 
        doi={10.1109/ISBI.2009.5193098}, 
        issn={1945-7928},
    }

    @inproceedings{lpc:cell-cycle:embc2009,
        author = {Buck, Taraz and Rao, Arvind and Coelho, Luis Pedro and Fuhrman, Margaret and Jarvik, Jonathan W. and Berget, Peter B. and Murphy, Robert F.},
        title = {Cell Cycle Dependence of Protein Subcellular Location Inferred from Static, Asynchronous Images},
        year = {2009},
        month = {September},
        booktitle={Engineering in Medicine and Biology Society, 2009. EMBC 2009. Annual International Conference of the IEEE}, 
        volume={}, 
        number={}, 
        pages={1016-1019}, 
        abstract={Protein subcellular location is one of the most important
        determinants of protein function during cellular processes. Changes in
        protein behavior during the cell cycle are expected to be involved in
        cellular reprogramming during disease and development, and there is
        therefore a critical need to understand cell-cycle dependent variation in
        protein localization which may be related to aberrant pathway activity.
        With this goal, it would be useful to have an automated method that can be
        applied on a proteomic scale to identify candidate proteins showing
        cell-cycle dependent variation of location. Fluorescence microscopy, and
        especially automated, high-throughput microscopy, can provide images for
        tens of thousands of fluorescently-tagged proteins for this purpose.
        Previous work on analysis of cell cycle variation has traditionally relied
        on obtaining time-series images over an entire cell cycle; these methods
        are not applicable to the single time point images that are much easier to
        obtain on a large scale. Hence a method that can infer cell
        cycle-dependence of proteins from asynchronous, static cell images would be
        preferable. In this work, we demonstrate such a method that can associate
        protein pattern variation in static images with cell cycle progression. We
        additionally show that a one-dimensional parameterization of cell cycle
        progression and protein feature pattern is sufficient to infer association
        between localization and cell cycle.},
        doi={10.1109/IEMBS.2009.5332888}, 
        ISSN={1557-170X},
    }

        
