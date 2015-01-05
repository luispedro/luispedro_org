---
title: "Milksets: Machine Learning Datasets for Python"
categories: software work python
permalink: software/milksets
---

.. raw:: html

    <a href="http://github.com/luispedro/milksets">
        <img style="position: absolute; top: 0; right: 0; border: 0;" src="http://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub" />
    </a>

Milksets: Machine Learning Datasets for Python
==============================================

This packages contains some U.C.I. datasets in a common Pythonic interface,
which makes them easy to use with `milk </software/milk/>`_.

It is used as::

    from milksets import wine
    features,labels = wine.load()

`features` will be a 2d-`numpy.ndarray` of features and `labels` will be a
1d-`numpy.ndarray` of labels starting at `0` through `N-1` (independently of
how the labels were coded in the original data).

Where can I get it?
-------------------

`Github <http://github.com/luispedro/milksets/>`_ as usual. Alternatively the
`python packages index <http://pypi.python.org/pypi/milksets/>`_ also contains
official releases,the latest of which can be obtained by

    easy_install milksets

or

    pip install milksets

if you use these tools.
