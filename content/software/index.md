---
title: Software
categories: work software
---

I have written some open-source software, some to scratch an itch, and some as
part of my research.

## Currently Active Projects

### [SemiBin](/software/semibin)

SemiBin is a metagenomic binning tool which uses self-supervised deep learning
to reconstruct genomes (MAGs) from short- and long-read data.

More information: [https://semibin.rtfd.io](https://semibin.rtfd.io)

License: MIT.

### Macrel

Macrel screens genomes and metagenomes for antimicrobial peptides:
[https://github.com/BigDataBiology/macrel](https://github.com/BigDataBiology/macrel)

Described in [MACREL: antimicrobial peptide screening in genomes and
metagenomes](https://doi.org/10.7717/peerj.10555) (*PeerJ*, 2020).

### argNorm

argNorm normalizes the output of antibiotic resistance gene annotation tools to
the Antibiotic Resistance Ontology (ARO), so that results from different tools
can be compared:
[https://github.com/BigDataBiology/argNorm](https://github.com/BigDataBiology/argNorm)

Described in [argNorm: normalization of antibiotic resistance gene annotations
to the Antibiotic Resistance Ontology
(ARO)](https://doi.org/10.1093/bioinformatics/btaf173) (*Bioinformatics*,
2025).

License: MIT.

### [NGLess](/software/ngless)

NGLess is a domain specific language for Next-Generation Sequencing (NGS)
processing, with a focus on metagenomics.

More information: [https://www.big-data-biology.org/software/ngless/](https://www.big-data-biology.org/software/ngless/)

License: MIT.

### [mahotas](/software/mahotas)

mahotas is a computer vision package for Python. It operates on numpy arrays.
It is implemented in C++ as it has a strong efficiency focus.

License: MIT.

### [Jug](/software/jug)

Jug is a task based framework for running embarrassingly parallel code in Python.
You can also think of it as a light-weight python-based map-reduce environment.

License: MIT.

### [mahotas-imread](/software/imread)

Imread serves to read and save image files to and from numpy arrays.

License: MIT.


### [conduit-algorithms](/software/conduit-algorithms)

A series of [conduit](https://hackage.haskell.org/package/conduit) based
algorithms in Haskell.

License: MIT


### Diskhash

Disk-based hashtable: [https://github.com/luispedro/diskhash](https://github.com/luispedro/diskhash)


### fasta\_reader

Uses diskhash to index a FASTA file making it very fast to retrieve a sequence:

[https://github.com/luispedro/fasta\_reader](https://github.com/luispedro/fasta_reader)

## Data Resources

Large datasets produced by the lab, browsable online:

- [AMPSphere](https://ampsphere.big-data-biology.org/): a catalogue of
  candidate antimicrobial peptides from the global microbiome
  ([paper](https://doi.org/10.1016/j.cell.2024.05.013)).
- [GMSC](https://gmsc.big-data-biology.org/): the Global Microbial smORF
  Catalogue, of small proteins
  ([paper](https://doi.org/10.1038/s41467-024-51894-6)).
- [GMGC](https://gmgc.embl.de/): the Global Microbial Gene Catalog
  ([paper](https://doi.org/10.1038/s41586-021-04233-4)).

## Reproducible Research

I have also made some [code available for reproducible research of published
papers](/software/reproducible-research).


## Dormant Projects

These are projects that work but which I am not too interested in pursuing
right now, but which I might revive in the future.

### [Pymorph](/software/pymorph): Python Morphology Toolbox

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


