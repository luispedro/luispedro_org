---
title: Hex
categories: software
permalink: software/hex
---

.. raw:: html

    <a href="http://github.com/luispedro/hex">
        <img style="position: absolute; top: 0; right: 0; border: 0;" src="http://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub" />
    </a>

==================================
Hex: Reimplementing TeX in Haskell
==================================

Hex is a reimplementation of TeX in Haskell. It is not very functional yet. It
just does macro expansion. The main goals are for me to learn TeX and Haskell
by implementing on in the other.

Ideally, I will have a version of TeX that is more flexible and extensible than
the current one (which I use because I love its output, but cannot bear its
error messages).

The plan is to first write a faithful reimplementation of TeX and then, *make
it better*.

Current status
--------------

Version 0.0.5
~~~~~~~~~~~~~
Implements very basic Math typesetting.

Version 0.0.4
~~~~~~~~~~~~~

Added font capabilities (\font etc). Also, improve macro expansion (delimited macros, \if).

Version 0.0.3
~~~~~~~~~~~~~
TeX-like line breaking. Added \input and \message.

version 0.0.2
~~~~~~~~~~~~~

Implements character codes and macro namespaces. I think we have the basic
machinery to read input and covert it into a stream of TeX commands (except for
\input). Now, it is the backend which needs the most work.

version 0.0.1
~~~~~~~~~~~~~

Pre-pre-pre-pre-...-alpha. It can take an input file and output a DVI file of
text with badly broken lines. It does it slowly and with a lot of hardcoded
definitions (it supports exactly one font). It does not do any *page* breaking:
everything is on one page.

Right now, it is only interesting if you care to get involved in development.

**Sounds great! Where do I get this fabulous code?** Github, both for the
`cutting edge <http://github.com/luispedro/hex>`_ and `stable releases
<https://github.com/luispedro/hex/archives/master>`_.

What needs to be better in TeX?
-------------------------------

Here are my ideas for improving TeX:

1. Better error messages.
2. Better package management.
3. Document at-once-typesetting (instead of page-per-page).
4. Single pass implementation of cross-references.
5. Better handling of floats.
6. Better handling of images.
7. Faster.
8. Better scripting.
9. In-built (or script written) facilities for things like references (instead
   of relying on external programmes).
10. Use of multi-core machines.
11. More output formats (ePub?)

Some of these are traditionally built *on top* of TeX instead of modifying it.
While that is a good way to do some things, it also means that the results are
not as good as they should be. There is no reason to not have the handling of
floats at the TeX level, for example.

What needs to stay the same?
----------------------------

Good quality output.

Meta-Information
----------------

Author: Luis Pedro Coelho <luis@luispedro.org>

License: GPLv3 or later
