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

*If you like milk, please consider donating for our `fundraiser
<http://beiraproject.org/fr>`__* If you happen to live in Pittsburgh, then come
to our party!

Where can I get it?
-------------------

`Github <http://github.com/luispedro/milk/>`_ as usual. Alternatively the
`python packages index <http://pypi.python.org/pypi/milk/>`_ also contains
official releases,the latest of which can be obtained by::

    easy_install milk

or::

    pip install milk

if you use these tools.


Examples
--------

Here is how to test how well you can classify some ``features,labels`` data,
measured by cross-validation::

    import numpy as np
    import milk
    features = np.random.rand(100,10) # 2d array of features: 100 examples of 10 features each
    labels = np.zeros(100)
    features[50:] += .5
    labels[50:] = 1
    confusion_matrix, names = milk.nfoldcrossvalidation(features, labels)
    print 'Accuracy:', confusion_matrix.trace()/float(confusion_matrix.sum())

If want to use a classifier, you instanciate a *learner object* and call its
``train()`` method::

    import numpy as np
    import milk
    features = np.random.rand(100,10)
    labels = np.zeros(100)
    features[50:] += .5
    labels[50:] = 1
    learner = milk.defaultclassifier()
    model = learner.train(features, labels)

    # Now you can use the model on new examples:
    example = np.random.rand(10)
    print model.apply(example)
    example2 = np.random.rand(10)
    example2 += .5
    print model.apply(example2)
    

More Documentation
------------------

API Documentation: `http://packages.python.org/milk/
<http://packages.python.org/milk/>`__

Mailing list (**New: March 2011**): `http://groups.google.com/group/milk-users
<http://groups.google.com/group/milk-users>`__

Features
--------

- Pythonic interface to libSVM. I took their code and implemented a wrapper instead of using auto-generated ones.
- Stepwise Discriminant Analysis for feature selection.
- K-means clustering. A simple implementation but it works well with very large datasets.
- Models can be pickle()d and unpickle()d.
