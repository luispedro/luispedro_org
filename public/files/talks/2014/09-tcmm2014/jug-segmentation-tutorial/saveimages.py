import mahotas as mh
from jugfile import method1
from matplotlib import cm
import numpy as np

im = mh.imread('images/dna-21.jpg')
mh.imsave('image_stretched.jpeg', mh.stretch(im.astype(float)**.01))
m1 = method1.f('images/dna-21.jpg', 2)
m1 = m1.astype(np.uint8)
color = ((cm.rainbow(m1.astype(float)/m1.max())[:,:,:3]).reshape(m1.shape+(3,)))
color[m1 == 0] = (0,0,0)
mh.imsave('image_method1.jpeg', mh.stretch(color))

ref = mh.imread('references/dna-21.png')
color = ((cm.rainbow(ref.astype(float)/ref.max())[:,:,:3]).reshape(m1.shape+(3,)))
color[ref == 0] = (0,0,0)
mh.imsave('image_reference.jpeg', mh.stretch(color))


