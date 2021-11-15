---
title: No Copy Reduce
categories: software
permalink: software/ncreduce/
---

No Copy Reduce Operations for Numpy
===================================

Numpy arrays come with several reduce operations: sum(), std(), argmin(),
min(), ....

The traditional implementation of these suffers from two big problems: It is
slow and it often allocates intermediate memory. I have code that is failing
with OOM (out of memory) exceptions in calls to ndarray.std(). I regularly
handle arrays with 100 million entries (have a couple of million objects * 20
features per object = 100 million doubles), so this is a real problem for me.

This being open-source, I decided to solve the problem. My first idea was to
try to improve the numpy code. I failed to see how to do that while supporting
everything that numpy does (multiple types, for example), so I started an
implementation of reduce operations that uses C++ templates to make code
optimised into the types it actually uses, choosing the right version to use at
run time. In the spirit or release-early/release-often, I attach the first
version of this code that runs.

This is now a mostly dormant project, but it achieved what I wanted and I will
still resort to it whenever a function like ndarray.sum shows up as being the
bottleneck in my code (you would be surprised at how often that happens).

Basic Idea
----------
`ndarray.std` does basically the following (The examples are in pseudo-code even though the implementation happens to be in C):

::

    def stddev(A):
             mu = A.mean()
             diff=(A-mu)
             maybe_conj=(diff if not complex(A) else diff.conjugate())
             diff *= maybe_conj
             return diff.sum()

With a lot of temporary arrays. My code does:

::

    def stddev(A):
             mu = A.mean() # No getting around this temporary
             std = 0
             for i in xrange(A.size):
                     diff = (A[i]-mu)
                     if complex(A):
                             diff *= conjugate(diff)
                     else:
                             diff *= diff
                     std += diff
             return sqrt(diff/A.size)

Of course, my code does it while taking into account the geometry of the array.
It handles arrays with arbitrary strides.

I do it while avoiding copying the array at any time (while most of the
existing code will transpose/copy the array so that it is well behaved in
memory).

Implementation
--------------

I have written some template infrastructure so that, if I wanted a very fast
entropy calculation, on a normalised array, you could do:

::

    template < ... >
     void compute_entropy(BaseIterator data, BaseIterator past, ResultsIterator results) {
             while (data != past) {
                     if (*data) *result += *data * std::log(*data);
                     ++data;
                     ++result;
             }
     }

and the machinery will instantiate this in several variations, deciding at run-time which one to call. You just have to write a C interface function like

::

    PyObject* fast_entropy(PyArrayObject *self, PyObject *args, PyObject *kwds)
     {
         int axis=NPY_MAXDIMS;
         PyArray_Descr *dtype=NULL;
         PyArrayObject *out=NULL;
         static char *kwlist[] = {"array","axis", "dtype", "out", NULL};
        if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O&O&O&", kwlist,
                                          &self,
                                          PyArray_AxisConverter,&axis,
                                          PyArray_DescrConverter2, &dtype,
                                          PyArray_OutputConverter, &out)) {
             Py_XDECREF(dtype);
             return NULL;
         }
        int num = _get_type_num_double(self->descr, dtype);
         Py_XDECREF(dtype);
         return compress_dispatch(self, out, axis, num, EmptyType()); // This decides which function to call
     }


For contiguous arrays, `axis=None`, this becomes

::

    void compute_entropy(Base* data, Base* past, Results* result) {
             while (data != past) {
                     if (*data) *result += *data * std::log(*data);
                     ++data;
             }
     }

which is probably as fast as it can be. If the array is not contiguous, this becomes

::

    void compute_entropy(numpy_iterator data, numpy_iterator past, Results* result) {
             while (data != past) {
                     if (*data) *result += *data * std::log(*data);
                     ++data;
             }
     }

where `numpy_iterator` is a type that knows how to iterate over numpy arrays following strides.

If `axis is not None`, then the result will not be a single value, it will be an array. The machinery will automatically create the array of the right size and pass it to you with so that the following gets instantiated:

::

    void compute_entropy(numpy_iterator data, numpy_iterator past,
     numpy_iterator results) {
             while (data != past) {
                     if (*data) *results += *data * std::log(*data);
                     ++data;
                     ++results;
             }
     }

The results parameter has the strides set up correctly to iterate over results, including looping back when necessary so that the code works as it should.

Notice that the ++results operation seems to be dropping in and out. In fact, I was oversimplifying above. There is no instantiation with Result*, but with no_iteration which behaves like Result*, but with an empty operator ++(). You never change your template implementation. (The code above was for explanatory purposes, not an example of working code. The interface I actually used takes more parameters which are not very important for expository purposes. This allows you to, for example, implement the ddof parameter in std()).

Advantages
----------

For most operations, my code is faster (it's hard to beat ndarray.sum(), but
easy to beat ndarray.std()) than numpy on both an intel 32 bit machine and an
AMD 64 bit machine both newer than one year (you can test it on your machine by
runnning profile.py). For some specific operations, like summing along a
non-last axis on a moderately large array, it is slower (I think that the
copy&process tactic might be better in this case than the no-copy/one pass
operation I am using). In most cases I tested, it is faster. In particular, the
basic case (a well-behaved array), it is faster.

More important than speed (at least for me) is the fact that this does not
allocate more memory than needed. This will not fail with OOM errors. It's easy
to implement specific optimisations. For example, replace a sum function for a
specific case to call AMD's framewave SIMD library (which uses SIMD
instructions):

::

    void compute_sum(short* data, short* past, no_iteration result) {
             fwiSum_16s_C1R  ( data, sizeof(short), past-start, &*result);
     }

or, compute the standard deviation of an array of boolean with a single pass (sigma = sqrt(p(1-p))):

::

    void compute_std(bool* data, bool* past, no_iteration result) {
         size_type N = (past-data);
         size_type pos = 0;
         while (data != past) {
             if (*data) ++pos;
             ++data;
         }
         *result = std::sqrt(ResType(pos)/ResType(N)*(1-ResType(pos)/ResType(N)));
    }

