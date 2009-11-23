title: Python Snippets
url: software/snippets
categories: python software
..

Python Snippets
===============

Litte bits of code that are cute or otherwise helpful.


Python Trie
-----------

Here's how to build a word-trie in a few lines of code:

::
    
    # phrases = [ ('how','now','brown','cow'), ('what',...
    
    from collections import defaultdict
    def recursive():
        return defaultdict(recursive)
    SUCCESS = object()
    trie = recursive()
    for p in phrases:
        top = trie
        for w in p:
            top = top[w]
        top[SUCCESS] = p


The above example is a trie over words, but it could be over characters as well. Here's how to use it to parse a big text for matches:

::

    #text = ['a','long','list','of','words',...
    
    # Active will hold the list of locations in the trie that we are currently
    # looking at. At each step, we both start at the root and move down every
    # active node.
    active = []
    for w in text:
        active.append(trie)
        i = 0
        while i < len(active):
            if w in active[i]:
                active[i] = active[i][w]
                if SUCCESS in active[i]:
                    print 'Match', active[i][SUCCESS]
                i += 1
            else:
                del active[i]

This isn't the fastest way to do things, but it's fast enough for what I wanted it for.

Python Timeout
--------------

::

    # -*- coding: utf-8 -*-
    # Copyright (C) 2008-2009  Murphy Lab
    # Carnegie Mellon University
    # Written by Luís Pedro Coelho <lpc@cmu.edu>
    # License: MIT

    import signal
    __all__ = ['TimeOutError', 'timeout']
    class TimeOutError(Exception):
        def __init__(self):
            Exception.__init__(self,'Timeout')

    def _raise_TimeOut(sig, stack):
        raise TimeOutError()

    class timeout(object):
        def __init__(self, timeout, raise_exception=True):
            self.timeout = timeout
            self.raise_exception = raise_exception

        def __enter__(self):
            self.old_handler = signal.signal(signal.SIGALRM, _raise_TimeOut)
            signal.alarm(self.timeout)

        def __exit__(self, exc_type, exc_val, exc_tb):
            signal.signal(signal.SIGALRM, self.old_handler)
            signal.alarm(0)
            if exc_type is not TimeOutError:
                return False # Never swallow other exceptions
            return not self.raise_exception


You can use as:

::

    with timeout(2):
        sleep(1024**16)
    print 'I got out early'


