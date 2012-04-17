Overview
========

These are the Perl Tablets, translated from html (where they currently
reside at the Perl 6 SocialText wiki), into
[Pandoc-Markdown](http://johnmacfarlane.net/pandoc/).



How to Help
===========

The Appendix A (Index) document needs anchor tags added. These anchor
tags are linked to primarily from Appendix B (Lookup & Short
Reference).

To contribute, pore over Appendix B looking at the various links to
the main Index, and when you see an anchor id that is not present in
the index (ap-a-index.txt), please add it directly above the relevant
paragraph like so:

    <a id="dollar-sigil"/>

(that one's already present).



Generating the html
===================

After updating any .txt files, to regenerate the corresponding html
files, run `./build-html.py` in the docs directory.



Publishing the Tablets
======================

`scp` the docs/*.html files and the styles.css file to the web.
These may end up appearing at <http://tablets.perl6.org/>.



TODO
====

  * add LICENSE file (and add note about it to this README)

  * add CONTRIBUTORS file
