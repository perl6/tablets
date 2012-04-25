Overview
========

These are the Perl Tablets, written in 
[Pandoc-Markdown](http://johnmacfarlane.net/pandoc/).

They are available online at <http://tablets.perl6.org>.


How to Help
===========

* Just start reading and report issues if your not sure.

* Please pore over Appendix B taking note of the various links to the
  main Index (Appendix A). When you see a Perl 6 term without a link,
  find its corresponding anchor in the Index, then (in Appendix B) create a link to it.

* Several it terms in the glossary (Appendix G) are still unexplained.

* The Tablet 1: History needs a lot of help, especially information from people
  who were involved in the subprojects.


Rules for Anchor Names
======================

* Index A has following rules:
* Anchors are case sensitive, if the term is "BEGIN", the anchor is also "BEGIN".
* Parts of the anchor name are divided by a minus ("-").
* None alphanumeric chars are descibed as lowercase name.
* But use for that only one word, "=" is "equal" not "equal sign".
* "==" is double-equal, "===" is "triple-equal"
* A secondary anchor can dexribe the name of an operator.
* Index G has following rules:
* Anchor uses always the abbreviation, acronym or short form.
* Acronyms are uppercase rest is always lower case.

Format Rules for Index A
========================

* Perl 6 builtins are bold (\*\*...\*\*)
* terms and Perl 5 builtins are italic (\*...\*)
* code snipptes are in (\`...\`)
* between item name, its explanation and additional infos is an &mdash; (\&mdash\;)


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

CONTRIBUTORS
============

* lichtkind <lichtkind@cpan.org>
* uvtc
* raiph
* Siddhant
* samlh
* moritz

