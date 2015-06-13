from os import walk, stat, path, utime
import pickle
import hashlib


HASH_CACHE_FILE = 'mtime_hash.pkl'

def hash_file(fname):
    with open(fname, 'rb') as ifile:
        s = hashlib.new('sha256')
        s.update(ifile.read())
        return s.hexdigest()

with open(HASH_CACHE_FILE, 'rb') as ifile:
    previous = pickle.load(ifile)

current = {}
for root, _, files in walk('_site'):
    for f in files:
        f = path.join(root, f)
        h = hash_file(f)
        pmtime = previous.get((f, h))
        if pmtime is not None:
            current[f, h] = pmtime
            utime(f, pmtime)
        else:
            sf = stat(f)
            current[f, h] = (sf.st_atime, sf.st_mtime)

with open(HASH_CACHE_FILE, 'wb') as output:
    pickle.dump(current, output, protocol=pickle.HIGHEST_PROTOCOL)
