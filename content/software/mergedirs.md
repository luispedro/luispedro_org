---
title: "Mergedirs: Merge two directories without losing files\"
---

<a href="http://github.com/luispedro/mergedirs">
    <img style="position: absolute; top: 0; right: 0; border: 0;" src="http://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub" />
</a>

This small script is used to merge two directories which may overlap in
files (mostly because they were originally copies which have since
diverged).

# Example

Layout:

    dir1/
        file.txt
        photo.jpg
        something.doc

    dir2/
        newfile.txt
        photo.jpg
        something.doc

Now, assume that `photo.jpg` is the same (same content, same file type)
in both directories, but `something.doc` is different. Run:

    mergedirs dir1/ dir2

And you will get:

    dir1/
        something.doc

    dir2/
        file.txt
        newfile.txt
        photo.jpg
        something.doc

Merge will **never** cause any data loss, only remove extra copies of
your files.

There are a few helpful options, which you can read about using
`mergedirs --help`.

# Where can I get it?

[Github](http://github.com/luispedro/mergedirs/) as usual.
