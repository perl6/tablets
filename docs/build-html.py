#!/usr/bin/env python

import glob, os.path

pandoc_cmd  = '''pandoc -s --toc -N --css=styles.css -B _nav -A _nav -o %s %s'''
pandoc_cmd2 = '''pandoc -s          --css=styles.css -B _nav -A _nav -o %s %s'''

txt_files = glob.glob('*.txt')

for txt_fn in txt_files:
    html_fn = txt_fn[:-3] + 'html'
    if not os.path.exists(html_fn) or os.path.getmtime(txt_fn) > os.path.getmtime(html_fn):
        if txt_fn == 'toc.txt' or txt_fn == 'ap-a-index.txt':
            print "Processing:", txt_fn, '-->', html_fn
            os.system(pandoc_cmd2 % (html_fn, txt_fn))
        else:
            print "Processing:", txt_fn, '-->', html_fn
            os.system(pandoc_cmd % (html_fn, txt_fn))
