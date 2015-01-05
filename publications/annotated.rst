---
title: Publications
categories: research
permalink: publications/annotated/
---

Annotated List of Selected Publications
=======================================

(2013) Generalisable Subcellular Location Analysis
--------------------------------------------------

Most of subcellular location analysis in the past has been pursued using
datasets that contain multiple copies of the same *representative* protein
(i.e., a specific protein is selected to serve as a **nuclear protein**,
another to serve as a **microtubular** protein). Algorithms are then evaluated
by measuring their ability to recognise this protein. It has then been inferred
that the algorithm is thus capable of recognizing location patterns.
Unfortunately, this is a leap of judgement that has not been tested. We tested
this using a new dataset with multiple proteins standing in the same location
group. The algorithms we were using previously performed significantly worse in
this new dataset and we thus employed new methods to achieve better results.

The paper describing this work has been published in Bioinformatics:

   *Determining the subcellular location of new proteins from microscope images
   using local features* by **Luis Pedro Coelho**, Joshua D. Kangas, Armaghan
   Naik, Elvira Osuna-Highley, Estelle Glory-Afshar, Margaret Fuhrman, Ramanuja
   Simha, Peter B. Berget, Jonathan W. Jarvik, and Robert F.  Murphy (2013).
   Bioinformatics, [`DOI <http://dx.doi.org/10.1093/bioinformatics/btt392>`__]
   [`open access version
   <http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3753569/>`__]

Local Features for Bioimage Analysis
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We also show that using `SURF <http://en.wikipedia.org/wiki/SURF>`__ (a form of
local features which achieves excellent results in subcellular classification
and we recommend it for bioimage analysis).

This is a video abstract which includes the main results of the paper:

.. raw:: html

   <iframe src="http://wl.figshare.com/articles/744842/embed?show_title=1" width="568" height="502" frameborder="0"></iframe>

You can also read `several blog posts related to this paper
<http://metarabbit.wordpress.com/tag/coelho2013_bioinformatics/>`__.

Here is the full bibtex citation::

    @article{Coelho08072013,
    author = {Coelho, Luis Pedro and Kangas, Joshua D. and Naik, Armaghan W.
        and Osuna-Highley, Elvira and Glory-Afshar, Estelle and Fuhrman, Margaret
        and Simha, Ramanuja and Berget, Peter B. and Jarvik, Jonathan W. and
        Murphy, Robert F.},
    title = {Determining the subcellular location of new proteins from
        microscope images using local features},

    year = {2013},
    doi = {10.1093/bioinformatics/btt392},
    URL = {http://bioinformatics.oxfordjournals.org/content/early/2013/07/07/bioinformatics.btt392.abstract},
    eprint = {http://bioinformatics.oxfordjournals.org/content/early/2013/07/07/bioinformatics.btt392.full.pdf+html},
    journal = {Bioinformatics}
    }

`More about generalizable classification... </projects/gen-classification>`__

(2010) Unsupervised Subcellular Pattern Unmixing
------------------------------------------------

The goal of this project was to extend the supervised unmixing methods to an
unsupervised setting. The results were surprisingly good: *unsupervised is as
good as supervised.*

::

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

`More about this unsupervised unmixing... </projects/unsupervised-unmixing>`__

(2009) Nuclear Segmentation
---------------------------

This was an off-shoot of my work on RandTag. The goal was to figure out the
best segmentation algorithm for our data in an unbiased, quantitative, way. We
built a data set of hand-segmented images and tried out a few algorithms.


**Luis Pedro Coelho**, Aabid Shariff and Robert F. Murphy, *Nuclear
segmentation in microscope cell images: A hand-segmented dataset and comparison
of algorithms*: [`DOI link <http://dx.doi.org/10.1109/ISBI.2009.5193098>`__]

::

    @inproceedings{Coelho2009,
        title = {Nuclear segmentation in microscope cell images: A hand-segmented dataset and comparison of algorithms},
        author = {Coelho, Luis Pedro and Shariff, Aabid and Murphy, Robert F.},
        booktitle = {2009 IEEE International Symposium on Biomedical Imaging: From Nano to Macro},
        doi = {10.1109/ISBI.2009.5193098},
        isbn = {978-1-4244-3931-7},
        keywords = {segmentation},
        pages = {518--521},
        year = {2009},
        publisher = {IEEE},
        url = {http://ieeexplore.ieee.org/lpdocs/epic03/wrapper.htm?arnumber=5193098}
    }

All of the `data and source code <https://github.com/luispedro/Coelho2009_ISBI_NuclearSegmentation>`__
are publicly available.

`More info about Nuclear Segmentation project </projects/nuclear-segmentation>`__


(2009-2010) SLIF: Structured Literature Image Finder
----------------------------------------------------

The `SLIF Project </projects/slif>`__

On this project, I worked mainly on the image handling half of the pipeline,
but also on integration of the whole system. The work I did on the image
pipeline included using active learning techniques for dataset generation, and
development of multi-class image classifiers.

Slif is available at `http://slif.cbi.cmu.edu <http://slif.cbi.cmu.edu>`__.

- **Structured Literature Image Finder: Parsing Text and Figures in Biomedical
  Literature** by Amr Ahmed, Andrew Arnold, Luis Pedro Coelho, Joshua Kangas,
  Abdul-Saboor Sheikh, Eric Xing, William Cohen and Robert F. Murphy *in* Web
  Semantics: Science, Services and Agents on the World Wide Web [`online
  version <http://dx.doi.org/10.1016/j.websem.2010.04.002>`__]

.. raw:: html

    <div class="paper_info">
        <a href="http://www.sciencedirect.com/science/article/B758F-4YT6D7G-2/2/348444def95436f515c644e1a539d643" alt="Publisher">
            Publisher
        </a>
        <div class="more">
            This is an overview of the system focused on the visible aspects.
        </div>
        <div class="bibtex">
            <pre>
            @article{Ahmed2010,
                title = "Structured Literature Image Finder: Parsing Text and Figures in Biomedical Literature",
                journal = "Web Semantics: Science, Services and Agents on the World Wide Web",
                volume = "In Press, Accepted Manuscript",
                number = "",
                pages = " - ",
                year = "2010",
                note = "",
                issn = "1570-8268",
                doi = "DOI: 10.1016/j.websem.2010.04.002",
                url = "http://www.sciencedirect.com/science/article/B758F-4YT6D7G-2/2/348444def95436f515c644e1a539d643",
                author = "Amr Ahmed and Andrew Arnold and Luis Pedro Coelho and Joshua Kangas and Abdul-Saboor Sheikh and Eric Xing and William Cohen and Robert F. Murphy"
            }
            </pre>
        </div>
    </div>

-- Luis Pedro Coelho, Amr Ahmed, Andrew Arnold, Joshua Kangas, Abdul-Saboor
   Sheikk, Eric P. Xing, William W. Cohen, and Robert F. Murphy. **Structured
   Literature Image Finder: Extracting Information from Text and Images in
   Biomedical  Literature.** by Luis Pedro Coelho, Amr Ahmed, Andrew Arnold,
   Joshua Kangas, Abdul-Saboor Sheikk, Eric P. Xing, William W. Cohen, and
   Robert F. Murphy. *in* Lecture Notes in Bioinformatics, 2010 (to appear)

.. raw:: html

    <div class="paper_info">
        <div class="more">
            A slightly technical overview of the SLIF project with a focus on
            the image processing part. This is a companion paper to the one
            above.
        </div>
        <div class="bibtex">
            <pre>
            </pre>
        </div>
    </div>

