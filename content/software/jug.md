---
title: Jug
---


<a href="https://github.com/luispedro/jug">
    <img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub" />
</a>

# Jug: A Task-Based Parallelization Framework

## Citation

If you use Jug to generate results for a scientific publication, please
cite:

> Coelho, L.P., (2017). Jug: Software for Parallel Reproducible
> Computation in Python. Journal of Open Research Software. 5(1), p.30.
>
> <https://doi.org/10.5334/jors.161>

## What is it?

It is a *light-weight, Python only, distributed computing framework.*

Jug allows you to write code that is broken up into tasks and run
different tasks on different processors. You can also think of it as a
lightweight map-reduce type of system, although it\'s a bit more
flexible (and less scalable).

It has two storage backends: One uses the filesystem to communicate
between processes and works correctly over NFS, so you can coordinate
processes on different machines. The other uses a redis database and all
it needs is for different processes to be able to communicate with a
common redis server.

Jug is a pure Python implementation and should work on any platform.
Python 3 is supported (at least 3.3 and greater).

[Jug Documentation and Tutorial](https://jug.rtfd.org)

## Short Example

Here is a one minute example. Save the following to a file called
`primes.py`:

    from jug import TaskGenerator
    from time import sleep

    @TaskGenerator
    def is_prime(n):
        sleep(1.)
        for j in range(2,n-1):
            if (n % j) == 0:
                return False
        return True

    primes100 = map(is_prime, list(range(2,101)))

Of course, this is only for didactical purposes, normally you would use
a better method. Similarly, the `sleep` function is so that it does not
run too fast.

Now type `jug status primes.py` to get:

    Task name                    Waiting       Ready    Finished     Running
    ------------------------------------------------------------------------
    primes.is_prime                    0          99           0           0
    ........................................................................
    Total:                             0          99           0           0

This tells you that you have 99 tasks called `primes.is_prime` ready to
run. So run `jug execute primes.py &`. You can even run multiple
instances in the background (if you have multiple cores, for example).
After starting 4 instances and waiting a few seconds, you can check the
status again (with `jug status primes.py`):

    Task name                    Waiting       Ready    Finished     Running
    ------------------------------------------------------------------------
    primes.is_prime                    0          63          32           4
    ........................................................................
    Total:                             0          63          32           4

Now you have 32 tasks finished, 4 running, and 63 still ready.
Eventually, they will all finish and you can inspect the results with
`jug shell primes.py`. This will give you an `ipython` shell. The
[primes100]{.title-ref} variable is available, but it is an ugly list of
[jug.Task]{.title-ref} objects. To get the actual value, you call the
[value]{.title-ref} function:

    In [1]: primes100 = value(primes100)

    In [2]: primes100[:10]
    Out[2]: [True, True, False, True, False, True, False, False, False, True]

## More Information

Here are the [full API docs](https://jug.readthedocs.org/en/latest/),
which include several
[worked](https://jug.readthedocs.org/en/latest/decrypt-example.html)
[out](https://jug.readthedocs.org/en/latest/text-example.html)
[examples](https://packages.python.org/Jug/text-example.html). There is
also a *video* ([vimeo](https://vimeo.com/8972696) or
[showmedo](https://showmedo.com/videotutorials/video?name=9750000;fromSeriesID=975)),
and a [presentation](/files/jug-decrypt-presentation.pdf).

*Mailing List*: <https://groups.google.com/group/jug-users>

## Where can I get this?

[PyPI](https://pypi.python.org/pypi/Jug) for stable releases,
[github](https://github.com/luispedro/jug) for the cutting edge. The code
is licensed MIT.

You should be able to use `pip`:

    pip install jug

## Features

-   Persistent data across runs
-   Re-use partial results if you change the algorithms (for example, if
    you search over a few more parameters for the best, then it will
    reuse the pre-computed values). Normally, I have a main computation
    script and then write a second visualisation script to plot out the
    results or compute some summary statistics and it\'s good if the
    second script is easy to write, easy to change, and reuses all
    computational results seamlessly.
-   Supports concurrency with a very flexible system: CPUs can join the
    computation at any time. This allows it to be used in batch
    processing systems.
-   You can check up on the status of the computation at any time ([jug
    status]{.title-ref})
-   Two backends: file-based if all the processors share a filesystem
    (works over NFS too) or [redis](https://code.google.com/p/redis/)
    based if they can all connect to the same redis server.
