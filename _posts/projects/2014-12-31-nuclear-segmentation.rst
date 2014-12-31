---
meta: We present a benchmark dataset for segmentation of nuclei in fluorescent microscopy images of cells and a comparison of several algorithms.
title: Nuclear Segmentation
categories: work
permalink: projects/nuclear-segmentation
---

Nuclear Segmentation
--------------------

The goal of this project was to quantitatively evaluate a series of nuclear
segmentation algorithms for use in our work. We hand-segmented several images
from two datasets and used those as gold standards to evaluate methods.

.. image:: /files/images/gnf-segmented-41.png
   :alt: Example image from the dataset


We generated two datasets, *U2OS* and *NIH3T3*, named after the cell type that was imaged.

+---------------+-------------+-------------+
|               |     U2OS    |   NIH3T3    |
+===============+=============+=============+
| Pixel size    | 1349 × 1030 | 1344 × 1024 |
+---------------+-------------+-------------+
| Nr. Cells     | 1831        |        2178 |
+---------------+-------------+-------------+
| Avg. Cover    | 23%         |         18% |
+---------------+-------------+-------------+
| Min Nr. Cells | 24          |          29 |
+---------------+-------------+-------------+
| Max Nr. Cells | 63          |          70 |
+---------------+-------------+-------------+


A model based method developed by B. Roysam's group (`Lin et al., 2003
<http://www.ncbi.nlm.nih.gov/pubmed/14566936>`__) was the best of the methods
we evaluated at the time. In the meanwhile, however, other groups have reported
better results on our dataset (`list of citations at Google Scholar
<http://scholar.google.com/scholar?oi=bibs&hl=en&cites=738266029844352763>`__).


Code & Data
~~~~~~~~~~~

You can get the exact version used for the paper from the `MurphyLab's
reproducibility repository
<http://murphylab.cbi.cmu.edu/software/2009_ISBI_NuclearSegmentation/>`__ or,
from `my github page <https://github.com/luispedro/Coelho2009_ISBI_NuclearSegmentation>`__, a version
that has been updated to work better in newer installations.

If you want to use the image above or any of the images in the dataset, feel
free, as long as you cite our paper (see citation below).

Citation
~~~~~~~~

*Nuclear segmentation in microscope cell images: A hand-segmented dataset and
comparison of algorithms* by Luis Pedro Coelho, Aabid Shariff, and Robert F.
Murphy

Digital Object Identifier: `10.1109/ISBI.2009.5193098
<http://dx.doi.org/10.1109/ISBI.2009.5193098>`__

Open access `PubMed Central version <http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2901896/>`__.

Full citation (use this if you use this code/dataset in a paper)::

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

