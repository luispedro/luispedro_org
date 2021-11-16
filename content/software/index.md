---
title: Software
categories: work software
permalink: software/
---

I have written some open-source software, some to scratch an itch, and some as
part of my research.

## Currently Active Projects

### [NGLess](/software/ngless)

NGLess is a domain specific language for Next-Generation Sequencing (NGS)
processing, with a focus on metagenomics.

More information: [https://ngless.embl.de](https://ngless.embl.de)

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


### Diskhash

Disk-based hashtable: [https://github.com/luispedro/diskhash](https://github.com/luispedro/diskhash)


### fasta\_reader

Uses diskhash to index a FASTA file making it very fast to retrieve a sequence:

[https://github.com/luispedro/fasta\_reader](https://github.com/luispedro/fasta_reader)

## Reproducible Research

I have also made some [code available for reproducible research of published
papers](/software/reproducible).


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


### [Hex](/software/hex)

Hex is a TeX engine in Haskell. It currently does not do much, but it is
progressing. The goal is a full reimplementation.

License: GPL.


