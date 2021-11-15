---
title: FASTA Reader
categories: software python
permalink: software/fasta/
---

FASTA Reader in Python
======================

A very simple reader/writer for FASTA encoded DNA sequences.

::

	# -*- coding: utf-8 -*-
	# copyright  2006 inesc/id
	# written by Luis pedro coelho 
	#
	# licence: mit licence:
	#
	#   permission is hereby granted, free of charge, to any person obtaining a copy of
	#   this software and associated documentation files (the "software"), to deal in
	#   the software without restriction, including without limitation the rights to
	#   use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
	#   of the software, and to permit persons to whom the software is furnished to do
	#   so, subject to the following conditions:
	#   
	#   the above copyright notice and this permission notice shall be included in all
	#   copies or substantial portions of the software.
	#
	#   the software is provided "as is", without warranty of any kind, express or
	#   implied, including but not limited to the warranties of merchantability,
	#   fitness for a particular purpose and noninfringement. in no event shall the
	#   authors or copyright holders be liable for any claim, damages or other
	#   liability, whether in an action of contract, tort or otherwise, arising
	#   from, out of or in connection with the software or the use or other
	#   dealings in the software.

    class fasta_sequence:
        """
            fasta sequence with a header

            two members: header and seq        
        """
        __slots__ = [ 'seq', 'header']
        def __init__(self, h, s):
            self.header=h
            self.seq=s


    def fasta_read(input):
        """ 
            fasta_read(input):

            @param input can be either a file or the name of a file.

            returns a list of fasta_sequence objects with all the sequences in the file.
            comments (lines starting with ';') are ignored.
        """
        if type(input) == str:
            if input.endswith('.gz'):
                import gzip
                input=gzip.gzipfile(input)
            else:
                input=file(input)
        results = []
        header = ''
        seq_items = []
        first = True
        for line in input:
            if line[0] == ';':
                continue # comment
            elif line[0] == '>':
                if not first:
                    seq= "".join(seq_items)
                    results.append(fasta_sequence(header,seq))
                    seq_items = []
                header = line[1:-1] # eat '>' and '\n'
                first = False
            else:
                seq_items.append(line[:-1])
        if len(seq_items) > 0:
            seq = "".join(seq_items)
            results.append(fasta_sequence(header,seq))
        return results


    def fasta_write(output,s):
        """
            fasta_write(output, sequence[s])

            @param output either a file (opened for writing) or a filename
            @param sequence it can be either a fasta_sequence or a list of fasta_sequence objects

            writes the sequence(s) into the file in fasta format
        """
        line_width=70
        if type(output) == str:
            if output.endswith('.gz'):
                import gzip
                output=gzip.gzipfile(output,'w')
            else:
                output=file(output,'w')
        if type(s) == list:
            for ss in s:
                fasta_write(output,ss)
        else: 
            output.write("> %s\n" % s.header)
            for i in xrange(0,len(s.seq),line_width):
                output.write("%s\n" % s.seq[i:i+line_width])


    def rfasta_write(output,seqs):
        """
            restricted fasta

            this format (used by biopropector) is just fasta with the whole sequence on one line.
        """
        if type(output) == str: output=file(output,'w')
        for s in seqs:
            output.write("> %s\n" % s.header)
            output.write("%s\n" % s.seq)
