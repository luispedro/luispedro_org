---
title: Software
categories: work software
permalink: software/
---

# Software

I have written some open-source software, some to scratch an itch, and some as
part of my research.

## Currently Active Projects

### [NGLess](/software/ngless)

NGLess is a domain specific language for Next-Generation Sequencing (NGS)
processing, with a focus on metagenomics.

More information: [http://ngless.embl.de](http://ngless.embl.de)

License: MIT.

### [mahotas](/software/mahotas)

mahotas is a computer vision package for Python. It operates on numpy arrays.
It is implemented in C++ as it has a strong efficiency focus.

License: MIT.

### [Jug](/software/jug)

Jug is a task based framework for running embarassingly parallel code in Python.
You can also think of it as a light-weight python-based map-reduce environment.

License: MIT.

### [mahotas-imread](/software/imread)

Imread serves to read and save image files to and from numpy arrays.

License: MIT.


### [conduit-algorithms](/software/conduit-algorithms)

A series of [conduit](http://hackage.haskell.org/package/conduit) based
algorithms in Haskell.

License: MIT

## Reproducible Research

I have also made some [code available for reproducible research](/software/reproducible).


## Dormant Projects

These are projects that work but which I am not too interested in pursuing
right now, but which I might revive in the future.

### [Pymorph](software/pymorph): Python Morphology Toolbox

This is a *Python image morphology* toolbox which I have adopted (i.e., taken
over maintaining). This works, but I am not adding any more functionality.

Includes basic operations such as
    - erode
    - dilate
    - open
    - tophat opening
    - watershed
    - ...

License: BSD.

### [Milk](/software/milk)

Milk is a Pythonic *machine learning toolkit*

License: MIT.


### [Hex](/software/hex)

Hex is a TeX engine in Haskell. It currently does not do much, but it is
progressing. The goal is a full reimplementation.

License: GPL.


### [ncreduce](software/ncreduce): No Copy Reduce Operations for Numpy

This improves on the speed of reduce-type operations in
[numpy](http://www.numpy.org). The code works great for its purpose, and I
still resort to it everytime that ndarray.sum shows up in my profiles as a time
hog (surprisingly often). However, it is too large (the binary is huge).

I learned a lot about numpy's internals while doing it and I developed this
technique for writing fast clean C++ to work on numpy code.

License: GPL.

### [readmagick](software/readmagick)

This used ImageMagick to read images. It has been superceded by imread.


### [gitcms](software/git-cms)

This is the system behind this website. It is a django based content managed
system, where all the content is stored on flat text files. I use git to manage
those text files and publish on the website.

License: Affero GPL.

## Bits & Pieces

These are little projects that are helpful, but not part of anything larger.

### [FASTA Python Reader](/software/fasta)

Parses FASTA files in Python. As a major feature, it correctly handles comments
(which many programmes do not). As a major mis-feature, it was one of the first
Python classes that I wrote and it shows.

License: MIT
