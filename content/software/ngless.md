---
title: "NGLess: NGS Processing with Less Work"
meta: NGLess is a domain-specific language for next-generation sequencing data processing — preprocessing, mapping and counting in short, reproducible scripts
---

Source code: [github.com/ngless-toolkit/ngless](https://github.com/ngless-toolkit/ngless).

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
[https://www.big-data-biology.org/software/ngless/](https://www.big-data-biology.org/software/ngless/).
