from jug import TaskGenerator

@TaskGenerator
def stats_for(repo, pattern):
    import gitwc
    return gitwc.extract_stats(gitwc.stats_for_repo(repo, pattern))

@TaskGenerator
def do_plot(numpy_stats, mpl_stats, mahotas_stats, skimage_stats, sklearn_stats):
    from mpltools import style
    from matplotlib import pyplot as plt
    import datetime
    style.use('ggplot')

    def do_plot(s, name):
        import numpy as np
        plt.fill_between(np.concatenate(([min_date], s.datetimes)), np.concatenate(([0], s.lines/1000.)))
        plt.plot(np.concatenate(([min_date], s.datetimes)), np.concatenate(([0], s.lines/1000.)) , color="k", lw=2)
        plt.text(tx, s.lines.max()/1000.*.7, name)

    tx = datetime.datetime(2002,2,1)
    min_date = numpy_stats.datetimes[0]
    plt.subplot(5,1,1)
    do_plot(numpy_stats, 'numpy')
    plt.subplot(5,1,2)
    do_plot(mpl_stats, 'matplotlib')
    plt.subplot(5,1,3)
    do_plot(mahotas_stats, 'mahotas')
    plt.subplot(5,1,4)
    do_plot(skimage_stats, 'skimage')
    plt.subplot(5,1,5)
    do_plot(sklearn_stats, 'sklearn')
    plt.tight_layout()
    plt.savefig('nr_lines.png')

pattern = [
    '*.py',
    '*.c',
    '*.pyx',
    '*.cpp',
    '*.txt',
    '*.rst',
    ]
do_plot(
    stats_for('/home/luispedro/software/numpy/', pattern),
    stats_for('/home/luispedro/software/matplotlib/', pattern),
    stats_for('/home/luispedro/work/mahotas/', pattern),
    stats_for('/home/luispedro/software/scikit-image/', pattern),
    stats_for('/home/luispedro/software/scikit-learn/', pattern),
    )
    

