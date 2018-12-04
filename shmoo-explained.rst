---
title: Yeast Mating
categories: work art
permalink: work/shmoo-video/explanation/
---

This is an explanation of my `yeast video </work/shmoo-video>`_ . See it and then come back. Or read this before seeing it to understand.

This was a small project for my Cell Biology course at CMU. The goals are, according to the class `website <http://www.andrew.cmu.edu/course/03-240/Grading.htm>`_ :

 JM Cell Bio Fair is a final project (in honor of Dr. Jon Minden) for the class in which groups of up to three students will construct and demonstrate models of cellular functions that were discussed in class. [...] These models can take virtually any form from a solid object to a play or song to a computer simulation.
 
I decided to model yeast mating. For more information, consult the `Wikipedia article <http://en.wikipedia.org/wiki/Mating_of_yeast>`_ , but the gist of it is that yeast can live as either haploid (one copy of each chromosome) or diploid (two copies --- like humans).

In the mating of yeast, two cells of different "sexes" (one of which is called *a*  and the other *alpha* ) fuse to make a single cell. Note that the mating process does not involve reproduction. In fact, we have less cells than we started out with.

Cells advertise themselves as available for mating by sending out pherormones. Each sex sends its own pherormones.

Stop animation video
--------------------

This video shows this process. Initially, there are two cells. One is an *alpha*, the other an *a*. They send out pheromones and listen to the presence of other pheromones. Once they have acquired sufficient pheromones of the other sex to both be confident in their prediction that another cell is present and know where it is, it changes shape, into a *shmoo*  shape (this is named after an `old cartoon <http://en.wikipedia.org/wiki/Shmoo>`_ ).

Once the cells have found each other, they merge into one.

Making of the video
-------------------
The cells are blobs of clay living on a white board. The pheromones are painted rice.

.. image:: /files/painting-rice.jpeg
   :alt: Painting Rice

It is notoriously hard to simulate random motion, so I had a computer run the simulation for me. A small python program outputs LaTeX:

::

    from random import choice

    print r'''\documentclass{article}
    \renewcommand{\baselinestretch}{1.6}
    \begin{document}

    \noindent'''

    symbols=['uparrow','to','downarrow','gets','nearrow','searrow','nwarrow','swarrow']
    for i in xrange(800):
        print r'$\%s$ ' % choice(symbols)


    print r'''

    \end{document}'''
    After processing, this outputs a series of randomly pointing arrows:

.. image:: /files/arrows.png
   :alt: Arrows

The objects in the field of vision are moved, one by one, in order (from top to bottom, left to right --- like a book). Each object is moved in the direction of the arrow and that arrow is crossed out. This simulates Brownian motion.

I particular, it struck me how often this random process generated seemingly ordered patterns where the rice would congregate at a certain area of the field. Had I done this "by hand", I would probably not have allowed those effects as *not random enough* .

Postprocessing
--------------
The project was done over a couple of weekends. In the end, over a thousand frames were collected.

I had marked the frame with four green markers, for guidance. I had hoped to be able to crop them out, but the actions was too close to the bottom ones. So, I **digitally edited them out** . I wrote a Python script to remove green and transform it to white:

::

    R,G,B=0,1,2
    def removegreen(inputfile):
        im=Image.open(inputfile)
        ima=array(scipy.misc.fromimage(im),dtype=uint16)
        positions=ima[:,:,G]>(40+maximum(ima[:,:,R],ima[:,:,B]))
        ima[positions,R]=ima[positions,G]
        ima[positions,B]=ima[positions,G]
        scipy.misc.toimage(array(ima,uint8)).save(inputfile)

This leaves some artifacts which are seen in the movie, but works well enough for 3 lines of code. I also used ImageMagick to normalize all the frames before encoding the film.

To use `Cortado <http://www.flumotion.net/cortado/>`_ and to spread open source software, I wanted to encode to `theora <http://www.theora.org>`_ . This was harder than I expected as the regular tools don't yet support it very well. Thus, I used a combination of mencoder+mplayer+theora_encoder generated the final output:

::

    mencoder "mf://*.jpg" -fps 7 -ovc copy -o shmoo-final.avi
    mplayer -vo yuv4mpeg -nosound shmoo-final.avi
    theora_encoder_example soundtrack.wav stream.yuv > output.ogg
 
Not very elegant, but it works. Furthermore, I believe that both mencoder and mplayer are lossless, so that only the theora encoding loses information, which is what one wants.

The Music
---------

The music is by `Rodrigo Leão <http://www.rodrigoleao.pt/>`_ , a Portuguese composer. It is called *Rua da Atalaia* and it's a part of the album `Mundo <http://www.amazon.com/Mundo-Best-Rodrigo-Leao/dp/B000MTP8CO/ref=sr_1_9/105-9613674-9933228?ie=UTF8&s=music&qid=1180036550&sr=8-9>`_ .

