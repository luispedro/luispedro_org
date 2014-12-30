title: SLIF
url: projects/slif
categories: work
..

SLIF: Structured Literature Image Finder
========================================

SLIF is the *Structured Literature Image Finder` (previously, *Subcellular
Location Image Finder*), which was project from the `Murphy Lab <http://murphylab.web.cmu.edu>`__, which I was a part of.
It searches through scientific journals, looking for images, which it
categorises, makes available, and (partially) analyses.

.. image:: /files/images/slif-overview.png
    :alt: SLIF Pipeline


The figure above (from `Coelho et al., 2010`_) is a
diagram of the SLIF pipeline: figures are extracted from papers, broken up into
panels & captions, which are then analysed to build navigavtion models.

In this project, I was responsible for the computer vision aspects of the
processing pipeline. I also handled much of the integration effort of the
several components and coordinated the preparation of the multi-author
publications that resulted from the effort. This project was a finalist in the
`Elsevier Grand Challenge <http://www.elseviergrandchallenge.com/>`__ (4 teams
out of 70 were chosen for the final). I represented our team in both the
semi-final and the final of this competition.

The SLIF page on the Murphy Lab website `many more details <http://murphylab.web.cmu.edu/services/SLIF/>`__,
including some historical information and presentation materials.

References
----------

These are the most recent references, on which I was involved. The first paper
focus most on the image analysis side of the pipeline, the second of the
overall service.

.. _`Coelho et al., 2010`:

- **Structured Literature Image  Finder: Extracting Information from Text and
  Images in Biomedical  Literature** by Luis Pedro Coelho, Amr Ahmed, Andrew
  Arnold, Joshua Kangas, Abdul-Saboor Sheikh, Eric P. Xing, William W. Cohen,
  and Robert F. Murphy, in Lecture Notes in Bioinformatics vol. 6004 [`PDF
  version </files/papers/2010/lpc-slif-lncs-2010.pdf>`__] This also introduced
  *parameter-free threshold adjacency statistics*, a variation on *threshold
  adjacency statistics* without any parameters (`details on pftas <http://mahotas.rtfd.org/api.html#mahotas.features.pftas>`__).

- **Structured Literature Image Finder: Parsing Text and Figures in Biomedical
  Literature** by Amr Ahmed, Andrew Arnold, Luis Pedro Coelho, Joshua Kangas,
  Abdul-Saboor Sheikh, Eric Xing, William Cohen and Robert F. Murphy *in* Web
  Semantics: Science, Services and Agents on the World Wide Web [`online
  version <http://dx.doi.org/10.1016/j.websem.2010.04.002>`_]


In BibTex format::

    @article{j.websem255,
        title = {Structured literature image finder: Parsing text and figures in biomedical literature},
        author = {Amr Ahmed and Luis Pedro Coelho and Andrew Arnold and Joshua Kangas and Abdul-Saboor Sheikh and Eric Xing and William Cohen and Robert F. Murphy},
        journal = {Web Semantics: Science, Services and Agents on the World Wide Web},
        volume = {8},
        number = {2-3},
        year = {2012},
        publisher = {Elsevier},
        keywords = {Image search; Image indexing; Topic modelling},
        issn = {1570-8268},
        url = {http://www.websemanticsjournal.org/index.php/ps/article/view/255}
    }

    @article{Coelho2010,
        title = {Structured Literature Image Finder: Extracting Information from Text and Images in Biomedical Literature.},
        author = {Coelho, Luis Pedro and Ahmed, Amr and Arnold, Andrew and Kangas, Joshua and Sheikh, Abdul-Saboor and Xing, Eric P. and Cohen, William W. and Murphy, Robert F.},
        doi = {10.1007/978-3-642-13131-8\_4},
        issn = {0302-9743},
        journal = {Lecture notes in computer science},
        month = jan,
        pages = {23--32},
        pmid = {20628552},
        url = {http://www.pubmedcentral.nih.gov/articlerender.fcgi?artid=2901994\&tool=pmcentrez\&rendertype=abstract},
        volume = {6004},
        year = {2010}
    }
