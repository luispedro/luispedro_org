import gzip
import numpy as np
from matplotlib import pyplot as plt

def trim(qs, thresh):
    '''
    s,e = trim(qs, thresh)

    Trim sequences

    Parameters
    ----------
    qs : sequence of int
    thresh : int
        Threshold to use

    Returns
    -------
    s : int
        start position
    e : int
        one-past-the-end position
    '''    
    bestlen = 0
    startcur = 0
    best = (0,0)
    for i in xrange(len(qs)+1):
        if i >= len(qs) or qs[i] < thresh:
            curlen = i - startcur
            if curlen > bestlen:
                bestlen = curlen
                best = (startcur,i)
            startcur = (i+1)
    s,e = best
    return s,e


ifile = gzip.open('hw-HeLa.fq.gz', 'rb')
ofile = gzip.open('hw-trimmed.fq', 'w')
allqs = []
while True:
    header = ifile.readline().strip()
    seq = ifile.readline().strip()
    _ = ifile.readline().strip()
    chr_qs = ifile.readline().strip()
    qualities = [(ord(q) - 64)
                    for q in chr_qs]
    if not len(qualities):
        break
    allqs.append(qualities)
    s,e = trim(qualities, 26)
    print >>ofile, header
    print >>ofile, seq[s:e]
    print >>ofile, '+'
    print >>ofile, chr_qs[s:e]

allqs = np.array(allqs)
mean = allqs.mean(0)
std = allqs.std(0)
plt.fill_between(
        np.arange(len(mean)),
        mean - std,
        mean + std,
        color=(.7,.7,.7))
plt.plot(mean, color='k', lw=4)
plt.show()
