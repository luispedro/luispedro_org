import sys
import requests
import yaml

base_url = 'https://api.crossref.org/works/'

def norm_doi(doi):
    for prefix in ['http://doi.org/',
            'https://doi.org/']:
        if doi.startswith(prefix):
            return doi[len(prefix):]
    return doi

def get_doi_meta(doi):
    '''looks up doi metadata on crossref'''
    doi = norm_doi(doi)
    r = requests.get(base_url + doi)
    if r.status_code != 200:
        raise IOError(f"Something bad happened (status code = {r.status_code})")
    data = r.json()
    return data['message']

def is_lpc(n):
    return 'Coelho' in n and n[0] == 'L'

def reformat_meta(meta):
    [title] = meta['title']
    if meta['container-title']:
        [journal] = meta['container-title']
    elif meta['subtype'] == 'preprint' and meta.get('institution', [{}])[0].get('name') == 'bioRxiv':
        journal = 'bioRxiv (PREPRINT)'
    else:
        print('Could not parse journal. Please add manually')
        journal = '?'
    doi = meta['DOI']
    authors = []
    for aut in meta.get('author', []):
        if "given" in aut and "family" in aut:
            authors.append(f'{aut["given"]} {aut["family"]}')
        elif 'name' in aut:
            authors.append(aut['name'])
        else:
            raise KeyError(f"Cannot format author: {aut}")


    if not authors:
        sys.stderr.write("Author information is missing.\n")
        sys.stderr.write("Proceeding... but check results manually\n")
        isFirstLast = False
    else:
        isFirstLast = is_lpc(authors[0]) or is_lpc(authors[-1])
    for pubkey in [
                'published-print',
                'published-online',
                'published',
                ]:
        if pubkey in meta:
            [date_parts] = meta[pubkey]['date-parts']
            break
    else:
        raise IOError("Date information is missing.\n")

    if len(date_parts) == 3:
        year, month, day = date_parts
    elif len(date_parts) == 2:
        year, month = date_parts
        day = 1
    elif len(date_parts) == 1:
        [year] = date_parts
        month = 1
        day = 1
    else:
        raise ValueError(f"Cannot parse date parts of form '{date_parts}'")
    return {
        'Title': title,
        'Authors': authors,
        'Journal': journal,
        'Doi': doi,
        'Year': year,
        'Date': f'{year}-{month:02}-{day:02}',
        'isFirstLast': isFirstLast,
        }

def main(argv):
    if len(argv) != 2:
        sys.stderr.write('Usage:\n')
        sys.stderr.write(f'\t{argv[0]} <DOI>\n')
        sys.exit(1)
    _,doi = argv

    meta = get_doi_meta(doi)
    remeta = reformat_meta(meta)
    ofile = 'papers.yaml'
    prev = open(ofile, 'rt').read()
    with open(ofile, 'at') as out:
        if prev and not prev.endswith('\n'):
            out.write('\n')
        out.write(yaml.dump([remeta], sort_keys=False, allow_unicode=True))

    print(f'Appended entry for {remeta["Doi"]} to {ofile}')
    print('Please do the following')
    print('    1. Manually check the newly appended entry at the end of the file')
    print('    2. Move it so that the file stays in ascending date order')
    print('    3. Announce it in the news feed: add a dated line to BOTH')
    print('       src/Page/Index.elm and content/news.md, e.g.')
    print(f'       **Aug 1** Our paper [Title](https://doi.org/{remeta["Doi"]}) is published in *Journal*.')

if __name__ == '__main__':
    main(sys.argv)

