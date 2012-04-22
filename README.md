Overview
========

These are the Perl Tablets, written in 
[Pandoc-Markdown](http://johnmacfarlane.net/pandoc/).

They are available online at <http://tablets.perl6.org>.



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

Rules for Anchor Names
======================

* Anchors are case sensitive, if the term is "BEGIN", the anchor is also "BEGIN".
* Parts of the anchor name are divided by a minus ("-").
* None alphanumeric chars are descibed as lowercase name.
* But use for that only one word, "=" is "equal" not "equal sign".
* "==" is double-equal, "===" is "triple-equal"
* A secondary anchor can dexribe the name of an operator.


Generating the html
===================

After updating any .txt files, to regenerate the corresponding html
files, run `./build-html.pl` in the docs directory.



Publishing the Tablets
======================

`scp` the docs/*.html files and the styles.css file to the web.


LICENSE
=======

Creative Commonc Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0) 

http://creativecommons.org/licenses/by-sa/3.0/deed.en


TODO
====

  * add LICENSE file (and add note about it to this README)

  * add CONTRIBUTORS file
