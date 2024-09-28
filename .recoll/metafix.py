
import sys
import re

# This can be used for local XMP field editing.
#
# A new instance is created for each PDF document (so the object could
# keep state to avoid, e.g. duplicate values)
#
# The metafix method receives an (original) field name, and the text
# value, and should return the possibly modified text.
class MetaFixer(object):
    def __init__(self):
        pass

    def metafix(self, nm, txt):
        if nm == 'bibtex:pages':
            txt = re.sub(r'--', '-', txt)
            txt = re.sub(r'^', ', p. ', txt)
        elif nm == 'bibtex:author':
            txt = re.sub(r'$', ':\ ', txt)
            pass
        elif nm == 'bibtex:chapter':
            txt = re.sub(r'^', ', in: id.: ', txt)
            pass
        elif nm == 'bibtex:editor':
            txt = re.sub(r'^', ', in: ', txt)
            txt = re.sub(r'$', ' (ed.):\ ', txt)
            pass
        elif nm == 'bibtex:year':
            txt = re.sub(r'^', ', ', txt)
            pass
        elif nm == 'bibtex:date':
            txt = re.sub(r'^', ', ', txt)
            pass
        elif nm == 'bibtex:volume':
            txt = re.sub(r'^', ', vol. ', txt)
            pass
        elif nm == 'bibtex:number':
            txt = re.sub(r'^', ', no. ', txt)
            pass
        elif nm == 'bibtex:journaltitle':
            txt = re.sub(r'^', ', in: ', txt)
            pass
        elif nm == 'bibtex:journal':
            txt = re.sub(r'^', ', in: ', txt)
            pass
        elif nm == 'bibtex:title':
            txt = re.sub(r'^', '"', txt)
            txt = re.sub(r'$', '"', txt)
            pass
        elif nm == 'bibtex:location':
            txt = re.sub(r'^', ', ', txt)
            txt = re.sub(r'$', ':\ ', txt)
            pass
        elif nm == 'bibtex:address':
            txt = re.sub(r'^', ', ', txt)
            txt = re.sub(r'$', ':\ ', txt)
            pass
        elif nm == 'bibtex:isbn':
            txt = re.sub(r'^', 'ISBN: ', txt)
            pass
        elif nm == 'bibtex:issn':
            txt = re.sub(r'^', 'ISSN: ', txt)
            pass
        elif nm == 'bibtex:doi':
            txt = re.sub(r'^', 'DOI: ', txt)
            pass
        elif nm == 'bibtex:bibtexkey':
            txt = re.sub(r'^', 'Key: ', txt)
            pass

        return txt


