title: Milk: Machine Learning Toolkit for Python
url: software/milk
categories: software work python
---

.. raw:: html

    <a href="http://github.com/luispedro/milk">
        <img style="position: absolute; top: 0; right: 0; border: 0;" src="http://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub" />
    </a>

Milk: Machine Learning Toolkit for Python
=========================================

This is the code that I use for my research projects.

Where can I get it?
-------------------

`Github <http://github.com/luispedro/milk/>`_ as usual. Alternatively the `python packages index <http://pypi.python.org/pypi/milk/>`_ also contains official releases,the latest of which can be obtained by

    easy_install milk

or

    pip install milk

if you use these tools.

Features
--------

- Pythonic interface to libSVM. I took their code and implemented a wrapper instead of using auto-generated ones.
- Stepwise Discriminant Analysis for feature selection.
- K-means clustering. A simple implementation but it works well with very large datasets.
- Models can be pickle()d and unpickle()d.

TODO
----

- Little documentation beyond the API docs.
- It requires scipy.weave to be fast now. It should not.
