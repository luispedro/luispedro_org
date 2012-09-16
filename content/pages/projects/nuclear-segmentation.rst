title: Nuclear Segmentation
url: projects/nuclear-segmentation
categories: work
..

Nuclear Segmentation
--------------------

The goal of this project was to quantitatively evaluate a series of nuclear
segmentation algorithms for use in our work. We hand-segmented several images
from two datasets and used those as gold standards to evaluate methods.

.. image:: /files/images/gnf-segmented-41.png
   :alt: Example image from the dataset


A model based method developed Roysam's group (`Lin et al., 2003 <http://www.ncbi.nlm.nih.gov/pubmed/14566936>`) was the best of the methods we evaluated at the time. In the meanwhile, however, other groups have reported better results in our dataset (`list of citations at Google Scholar <http://scholar.google.com/scholar?oi=bibs&hl=en&cites=738266029844352763>`__).

Code & Data
~~~~~~~~~~~

You can get the exact version used for the paper from the `MurphyLab's reproducibility repository <http://murphylab.cbi.cmu.edu/software/2009_ISBI_NuclearSegmentation/>`__ or, from `my github page <https://github.com/luispedro/segmentation>`__, a version that has been updated to work better in newer installations.


Citation
~~~~~~~~

*Nuclear segmentation in microscope cell images: A hand-segmented dataset and
comparison of algorithms* by Luis Pedro Coelho, Aabid Shariff, and Robert F.
Murphy

Digital Object Identifier: `10.1109/ISBI.2009.5193098
<http://dx.doi.org/10.1109/ISBI.2009.5193098>`__


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

