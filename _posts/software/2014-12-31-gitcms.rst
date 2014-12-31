---
title: Git CMS
categories: software
permalink: software/git-cms
---

.. raw:: html

    <a href="http://github.com/luispedro/django-gitcms">
        <img style="position: absolute; top: 0; right: 0; border: 0;" src="http://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub" />
    </a>


Git Content Management System
=============================

How is this website run?
------------------------

This is a django website with a twist: *all content is stored in text files*. I manage those files with git. A little script loads those files into the database and then django serves them.

In fact, all of the content and its history is actually `publicly available`_
(but you don't have to make your history available in order to use this
system). You can all see this an example of how to use django-gitcms.

.. _`publicly available`: http://github.com/luispedro/luispedro_org

Where can I get the code for this?
----------------------------------

Github_, of course. The code is license Affero 3 (GPL for web applications).

.. _Github: http://github.com/luispedro/django-gitcms

I have also released it on `PyPI <http://pypi.python.org/pypi/django-gitcms>`_
if you prefer. (This also means that `pip install django-gitcms` or
`easy_install django-gitcms` will automatically find and download the latest
version).

Features
--------

- Your website is using *django*. This means that it's easy to add any functionality you want.
- Out of the box, it supports:
    - Restructured text articles (pages such as this one)
    - menus
    - raw files (for images and such)
    - a conference system
    - a blog

but the main point is that the architechture is easily extensible. I'm selling
you an idea more than software.

Examples
--------

Django-gitcms powers `luispedro.org <http://luispedro.org>`_ and
`pythonvision.org <http://pythonvision.org>`_ (pythonvision.org is still in
Beta in terms of content, but you can see it up and running).

Alternative Projects
--------------------

- `yst <http://github.com/jgm/yst>`_: Uses `Yaml <http://www.yaml.org>`_ as a language and a system of string templates.
- `gitwiki`_: A Wiki with a git back-end. Several other similar projects exist.
- `nesta <http://effectif.com/nesta>`_: A ruby based CMS with text files as its backend.

Why is this worse than gitwiki?
--------------------------------

Because there is *no web front-end* to the history or even an edit button. It's git all the way. It's not friendly to non-technical users (it's very friendly for technical users—those of us who live on the command line and don't want to have to learn a new way of doing things).

Why is this better than `gitwiki`_?
-----------------------------------

.. _`gitwiki`: http://github.com/al3x/git-wiki

Because you can store any type of data, not only hyper-text files.

For example, in this website, the `conferences </conferences/upcoming/>`_ is a django app whose data is a text file that looks like:

::

    name: International Symposium on Biomedical Imaging (ISBI)
    short_name: ISBI
    location: Rotterdam, The Netherlands
    start: April 14 2010
    end: April 17 2010
    submission_deadline: November 2 2009

followed by many more examples. Actually, the menus on this website are also saved as a `yaml <http://www.yaml.org>`_ file, while the `publications </publications>`_ app saves its information as a bibtex file (I use `exhibit <http://simile.mit.edu/wiki/Exhibit>`_ for the display, but pre-process the bibtex file everytime it changes). I can write any functionality I want with django and store the information as a text file (I only have to write a *load()* function in Python, which can do whatever I want).

This is not really comparable to wiki-git-like projects. We just have different goals.

Why is this better than yst?
----------------------------

Because it uses django so you can do any Python processing you want. Also, the website does not have to be static, so you gain a lot of flexibility there.

Why is this better than nesta?
------------------------------

I don't know how nesta works because I don't know RoR. But I know Django on Python, so I wanted to use a system based on those technologies.

