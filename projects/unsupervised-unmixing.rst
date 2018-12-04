---
title: Unsupervised Subcellular Pattern Unmixing
categories: work
permalink: projects/unsupervised-unmixing/
---

The abstract of the `paper <http://bioinformatics.oxfordjournals.org/content/26/12/i7.full>`__ summarises the problem/solution well:

    Proteins exhibit complex subcellular distributions, which may include
    localizing in more than one organelle and varying in location depending on the
    cell physiology. Estimating the amount of protein distributed in each
    subcellular location is essential for quantitative understanding and modeling
    of protein dynamics and how they affect cell behaviors. We have previously
    described automated methods using fluorescent microscope images to determine
    the fractions of protein fluorescence in various subcellular locations when the
    basic locations in which a protein can be present are known. As this set of
    basic locations may be unknown (especially for studies on a proteome-wide
    scale), we here describe unsupervised methods to identify the fundamental
    patterns from images of mixed patterns and estimate the fractional composition
    of them.

    We developed two approaches to the problem, both based on identifying types
    of objects present in images and representing patterns by frequencies of
    those object types. One is a basis pursuit method (which is based on a
    linear mixture model), and the other is based on latent Dirichlet
    allocation (LDA). For testing both approaches, we used images previously
    acquired for testing supervised unmixing methods. These images were of
    cells labeled with various combinations of two organelle-specific probes
    that had the same fluorescent properties to simulate mixed patterns of
    subcellular location.

    We achieved 0.80 and 0.91 correlation between estimated and underlying
    fractions of the two probes (fundamental patterns) with basis pursuit and
    LDA approaches, respectively, indicating that our methods can unmix the
    complex subcellular distribution with reasonably high accuracy.


.. image:: /files/images/Fig1-unsupervised.png
   :alt: Pipeline figure


Overview of unmixing methods. (a) The algorithms use a collection of images as
input in which various concentrations of two probes are present (the
concentrations of the Mitotracker and Lysotracker probes are shown by
increasing intensity of red and green, respectively). Example images are shown
from wells containing only Mitotracker (b), only Lysotracker (c) and a mixture
of the two probes (d). (e) Objects with different size and shapes are extracted
and object features are calculated. (f) Objects are clustered into groups in
feature space, shown with different colors. (g) Fundamental patterns are
identified and the fractions they contribute to each image are estimated.
This is Figure 1 from the paper *Quantifying the distribution of probes between
subcellular locations using unsupervised pattern unmixing* (see link below).


Bibliography
------------

Quantifying the distribution of probes between subcellular locations using
unsupervised pattern unmixing by Luis Pedro Coelho, Tao Peng, and Robert F.
Murphy in Bioinformatics (2010) 26 (12): i7-i12.
[`Online Version <http://bioinformatics.oxfordjournals.org/content/26/12/i7.full>`__]

Full citation::

    @article{Coelho2010,
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
        
