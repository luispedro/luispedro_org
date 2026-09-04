---
title: Imread
categories: software python
meta: Mahotas-imread reads images into numpy arrays. A small Python package for image input and output, spun off from mahotas
---

# Mahotas-imread: Reads images into numpy arrays

A dedicated page with documentation is available at
[https://imread.rtfd.org](https://imread.rtfd.org). This page is just a
summary.

If you are using mahotas-imread in a scientific publication, please cite
the [mahotas](/software/mahotas) paper (imread is an off-shoot and does
not, currently, have its own paper):

> Coelho, L.P. 2013. Mahotas: Open source software for scriptable
> computer vision. Journal of Open Research Software 1(1):e3, DOI:
> <https://dx.doi.org/10.5334/jors.ac>

This project is a spin off of mahotas (for reasons of maintainability, I
felt it was better to not encumber mahotas with all the IO code that
imread contains).

This is a simple module, which has two main functions

- `imread`: reads an image from a file
- `imsave`: saves an image to a file

It currently works on PNG, JPEG, and TIFF (including some TIFF
variations such as STK or LSM).

## Where can I get it?

<iframe
src="https://ghbtns.com/github-btn.html?user=luispedro&repo=imread&type=watch&count=true&size=large"
allowtransparency="true" frameborder="0" scrolling="0" width="152px"
height="30px"></iframe>

[Github](https://github.com/luispedro/imread) as usual.
