---
title: "NGLess: NGS Processing with Less Work"
---


<a href="https://github.com/ngless-toolkit/ngless">
    <img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub" />
</a>

Ngless is a domain-specific language for NGS (next-generation sequencing
data) processing.

# Example

    ngless "1.0"
    input = fastq(['ctrl2.fq','ctrl2.fq','stim1.fq','stim2.fq'])
    input = preprocess(input) using |read|:
        read = read[5:]
        read = substrim(read, min_quality=26)
        if len(read) < 31:
            discard

    mapped = map(input, reference='hg19')
    write(count(mapped, features=['gene']),
            ofile='gene_counts.csv',
            format={csv})

More information: 
[https://ngless.embl.de](https://ngless.embl.de).
