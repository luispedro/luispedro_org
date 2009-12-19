title: Software
url: software
categories: work software
..

Software
========

I have written some open-source software, some to scratch an itch, and some as part of my research.

Currently Active Projects
-------------------------

`Pymorph <software/pymorph>`_: Python Morphology Toolbox
........................................................

I did not write this, but I have been maintaining it now for a while.

License: BSD.

`gitcms <software/git-cms>`_
............................

This is the system behind this website. It is a `django` based content managed system, where all the content is stored on flat text files. I use git to manage those text files and publish on the website.

License: Affero GPL.

`Jug </software/jug>`_
.......................

Jug is a task based framework for running embarassingly parallel code in Python.

License: MIT.

`Milk </software/milk>`_
........................

Milk is a Pythonic *machine learning toolkit*

License: MIT.

Dormant Projects
----------------

These are projects that work but which I am not too interested in pursuing write now, but which I might revive in the future.

`ncreduce <software/ncreduce>`_: No Copy Reduce Operations for Numpy
....................................................................

This improves on the speed of reduce-type operations in `numpy <http://www.numpy.org>`_. The code works great for its purpose, but it is too large (the binary is huge).

I learned a lot about numpy's internals while doing it and I developed this technique for writing fast clean C++ to work on numpy code.

License: GPL.

Bits & Pieces
-------------

These are little projects that are helpful, but not part of anything larger.

`FASTA Python Reader </software/fasta>`_
.........................................

Parses FASTA files in Python. As a major feature, it correctly handles comments (which many programmes do not). As a major mis-feature, it was one of the first Python classes that I wrote and it shows.

License: MIT
