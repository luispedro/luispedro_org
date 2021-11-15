import mahotas as mh
from jug import TaskGenerator
from glob import glob

@TaskGenerator
def method1(image, sigma):
    image = mh.imread(image)[:,:,0]
    image  = mh.gaussian_filter(image, sigma)
    binimage = (image > image.mean())
    labeled, _ = mh.label(binimage)
    return labeled

@TaskGenerator
def method2(image, sigma):
    image = mh.imread(image)[:,:,0]
    image  = mh.gaussian_filter(image, sigma)
    image = mh.stretch(image)
    binimage = (image > mh.otsu(image))
    labeled, _ = mh.label(binimage)
    return labeled

@TaskGenerator
def compare(labeled, ref):
    from milk.measures.cluster_agreement import rand_arand_jaccard
    ref = mh.imread(ref)
    return rand_arand_jaccard(labeled.ravel(), ref.ravel())[1]

@TaskGenerator
def print_results(results):
    import numpy as np
    r1, r2 = np.mean(results, 0)
    with open('output.txt', 'w') as out:
        out.write('Result method1: {}\nResult method2: {}'.format(r1,r2))

inputs = glob('images/*.jpg')
results = []
for im in inputs:
    m1 = method1(im, 2)
    m2 = method2(im, 4)
    ref = im.replace('images','references').replace('jpg','png')
    v1 = compare(m1, ref)
    v2 = compare(m2, ref)
    results.append( (v1,v2) )
print_results(results)
