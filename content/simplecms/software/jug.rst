title: Jug
url: software/jug
categories: software python
..

.. raw:: html

    <a href="http://github.com/luispedro/jug">
        <img style="position: absolute; top: 0; right: 0; border: 0;" src="http://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub" />
    </a>

Jug: A Task-Based Parallelization Framework
===========================================

What is it?
-----------
One line summary: it is a *light-weight, Python only, implementation of a
MapReduce* framework.

Jug allows you to write code that is broken up into tasks and run different
tasks on different processors. You can also think of it as a lightweight
map-reduce type of system, although it's a bit more flexible (and less
scalable).

It has two storage backends: One uses the filesystem to communicate between
processes and works correctly over NFS, so you can coordinate processes on
different machines. The other uses a redis database and all it needs is for
different processes to be able to communicate with a common redis server.

Jug is a pure Python implementation and should work on any platform.

Mailing List
------------

*Mailing List*: `http://groups.google.com/group/jug-users
<http://groups.google.com/group/jug-users>`_


Tutorial
--------

There is a `worked out example
<http://luispedro.org/jug-docs/decrypt-example.html>`_, which comes with a
*video* (`vimeo <http://vimeo.com/8972696>`_ or `showmedo
<http://showmedo.com/videotutorials/video?name=9750000;fromSeriesID=975>`_),
and a `presentation </files/jug-decrypt-presentation.pdf>`_.

If that is not enough, here is another `tutorial </software/jug/tutorial>`_.


Where can I get the code for this?
----------------------------------

`PyPI <http://pypi.python.org/pypi/Jug>`_ for stable releases, github_ for the
cutting edge. The code is licensed MIT.

You should be able to use ``easy_install`` or ``pip``::

    pip install jug
    easy_install jug

.. _github: http://github.com/luispedro/jug


Features
--------

- Persistent data across runs
- Re-use partial results if you change the algorithms (for example, if you search over a few more parameters for the best, then it will reuse the pre-computed values). Normally, I have a main computation script and then write a second visualisation script to plot out the results or compute some summary statistics and it's good if the second script is easy to write, easy to change, and reuses all computational results seamlessly.
- Supports concurrency with a very flexible system: CPUs can join the computation at any time. In some environments this is a necessity.
- You can check up on the status of the computation at any time (`jug status`)
- Two backends: file-based if all the processors share a filesystem (works over NFS too) or `redis <http://code.google.com/p/redis/>`_ based if they can all connect to the same redis server.
