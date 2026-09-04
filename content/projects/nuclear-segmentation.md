---
meta: We present a benchmark dataset for segmentation of nuclei in fluorescent microscopy images of cells and a comparison of several algorithms.
title: Nuclear Segmentation
categories: work
---

The goal of this project was to quantitatively evaluate a series of nuclear
segmentation algorithms for use in our work. We hand-segmented several images
from two datasets and used those as gold standards to evaluate methods.

![Example image from the dataset](/files/images/gnf-segmented-41.png)

We generated two datasets, *U2OS* and *NIH3T3*, named after the cell type that
was imaged.

<table class="table">
<thead>
<tr><th></th><th>U2OS</th><th>NIH3T3</th></tr>
</thead>
<tbody>
<tr><td>Pixel size</td><td>1349 × 1030</td><td>1344 × 1024</td></tr>
<tr><td>Nr. Cells</td><td>1831</td><td>2178</td></tr>
<tr><td>Avg. Cover</td><td>23%</td><td>18%</td></tr>
<tr><td>Min Nr. Cells</td><td>24</td><td>29</td></tr>
<tr><td>Max Nr. Cells</td><td>63</td><td>70</td></tr>
</tbody>
</table>

A model based method developed by B. Roysam's group ([Lin et al.,
2003](https://www.ncbi.nlm.nih.gov/pubmed/14566936)) was the best of the
methods we evaluated at the time. In the meanwhile, however, other groups have
reported better results on our dataset ([list of citations at Google
Scholar](https://scholar.google.com/scholar?oi=bibs&hl=en&cites=738266029844352763)).

## Code & Data

You can get the exact version used for the paper from the [MurphyLab's
reproducibility
repository](https://murphylab.cbd.cmu.edu/software/2009_ISBI_NuclearSegmentation/)
or, from [my github
page](https://github.com/luispedro/Coelho2009_ISBI_NuclearSegmentation), a
version that has been updated to work better in newer installations.

If you want to use the image above or any of the images in the dataset, feel
free, as long as you cite our paper (see citation below).

## Citation

*Nuclear segmentation in microscope cell images: A hand-segmented dataset and
comparison of algorithms* by Luis Pedro Coelho, Aabid Shariff, and Robert F.
Murphy

Digital Object Identifier:
[10.1109/ISBI.2009.5193098](https://dx.doi.org/10.1109/ISBI.2009.5193098)

Open access [PubMed Central
version](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2901896/).

Full citation (use this if you use this code/dataset in a paper):

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
        url = {https://ieeexplore.ieee.org/document/5193098}
    }
