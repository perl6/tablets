Overview
========

These are the Perl Tablets, written in 
[Pandoc-Markdown](http://johnmacfarlane.net/pandoc/).

They are available online at <http://tablets.perl6.org>.


How to Help
===========

One way to contribute is to pore over Appendix B taking note of Perl ops,
builtins etc that aren't linked to the main Index (Appendix A).
When you see a Perl 6 term in Appendix B without a link, find its corresponding anchor in
the Index, then (in Appendix B) create link to it.


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

Creative Commons Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0) 

http://creativecommons.org/licenses/by-sa/3.0/deed.en
