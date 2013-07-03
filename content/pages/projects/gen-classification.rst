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

A manuscript describing this project and its results is in press.

Local Features for Bioimage Analysis
------------------------------------

We also show that using `SURF <http://en.wikipedia.org/wiki/SURF>`__ (a form of achieves
excellent results in subcellular classification and we recommend it for
bioimage analysis).

Open source code is available as part of my computer vision package, `mahotas
</software/mahotas>`__, to implement these features.


