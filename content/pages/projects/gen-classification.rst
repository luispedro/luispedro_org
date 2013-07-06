title: Generalisable Subcellular Location Classification
url: projects/gen-classification
categories: work
..

Generalisable Subcellular Location Analysis
===========================================

Most of subcellular location analysis in the past has been pursued using
datasets that contain multiple copies of the same *representative* protein
(i.e., a specific protein is selected to serve as a **nuclear protein**,
another to serve as a **microtubular** protein).

Algorithms are then evaluated by measuring their ability to recognise this
protein. It has then been inferred that the algorithm is thus capable of
recognizing location patterns. Unfortunately, this is a leap of judgement that
has not been tested. We tested this using a new dataset with multiple proteins
standing in the same location group.

The algorithms we were using previously performed significantly worse in this
new dataset and we thus employed new methods to achieve better results.

A paper describing this work has been accepted for publication in
Bioinformatics:

    *Local Features Provide Better Generalization of Subcellular Location
    Classifiers to New Proteins.* by **Luis Pedro Coelho**, Joshua D. Kangas,
    Armaghan Naik, Elvira Osuna-Highley, Estelle Glory-Afshar, Margaret
    Fuhrman, Ramanuja Simha, Peter B. Berget, Jonathan W. Jarvik, and Robert F.
    Murphy (2013). Bioinformatics, in press


Local Features for Bioimage Analysis
------------------------------------

We also show that using `SURF <http://en.wikipedia.org/wiki/SURF>`__ (a form of achieves
excellent results in subcellular classification and we recommend it for
bioimage analysis).

Open source code is available as part of my computer vision package, `mahotas
</software/mahotas>`__, to implement these features.


