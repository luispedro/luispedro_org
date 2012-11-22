title: Mahotas
url: software/mahotas
categories: software python
..

.. raw:: html

    <a href="http://github.com/luispedro/mahotas">
        <img style="position: absolute; top: 0; right: 0; border: 0;" src="http://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub" />
    </a>

Mahotas: Computer Vision in Python
==================================

Mahotas is a set of functions for image processing and computer vision in
Python.

It is completely based on numpy arrays as its datatype. It has its heavy
routines implemented in clean C++ in a way that is both very clean, type
independent (using templates), and fast.

All of the code is self contained and it has no other dependencies than numpy.
Freeimage or `imread </software/imread>`__ are an optional dependency if you
want to use the ``imread`` and ``imsave`` functions.

The code is `well documented <http://packages.python.org/mahotas/>`__ (**all**
public functions are extensively documented) and well tested (almost 100% test
coverage). It has **no known bugs** (if you email me a bug report with a clear
test case, I will typically fix it in less than 24 hours).

`Package and API documentation <http://packages.python.org/mahotas/>`__

There is a `manuscript about mahotas <http://arxiv.org/abs/1211.4907>`__, which 
will hopefully evolve into a journal publication later.


Algorithms
----------

- SURF
- watershed
- thresholding
- convex hull computation
- polygon drawing
- feature computation: Haralick textures, local binary patterns, and Zernike
  moment
- distance transform
- freeimage & imread interface
- ...

Install
-------

You can get the code from `pypi <http://pypi.python.org/pypi/mahotas>`_ or the
cutting edge from `github <http://www.github.com/luispedro/mahotas>`_.
Instalation should be possible using:::

    pip install mahotas

or::

    easy_install mahotas

You can also find Windows packages `here
<http://www.lfd.uci.edu/~gohlke/pythonlibs/>`_ by Christoph Gohlke at UCI. He
also has other useful Python packages.

For FreeBSD, mahotas is available in `the ports section
<http://www.freshports.org/graphics/mahotas>`__.

Support
-------

The official forum for discussion of mahotas issues is the `pythonvision
mailing list <http://groups.google.com/group/pythonvision>`_. Also, check out
`pythonvision.org <http://pythonvision.org>`_ while you're at it.

For bug reports, `mail me <mailto:luis@luispedro.org>`_. If you report a bug, I will
try to fix it. If it has a unit test, I **promise** to fix it.

Currently, **there are no known bugs**.

