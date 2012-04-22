Overview
========

These are the Perl Tablets, written in 
[Pandoc-Markdown](http://johnmacfarlane.net/pandoc/).

They are available online at <http://tablets.perl6.org>.


How to Help
===========

To contribute, pore over Appendix B looking at the various links to
the main Index (Appendix A), and when you see an perl 6 term without a link
look into the index how its anchor is named and set the link
(appendix-a-index.txt#anchor).


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
