#!/usr/bin/perl -w
use strict;
use v5.10;

my $pandoc_cmd = {
    normal => 'pandoc -s --toc --css=styles.css -H _head-inc -B _nav-header -A _nav-footer -o %s %s',
    appendixAG => 'pandoc -s   --css=styles.css -H _head-inc -B _nav-header -A _nav-footer -o %s %s',
    index =>      'pandoc -s   --css=styles.css -H _head-inc                               -o %s %s', # -N
};

for my $txt_file (<*.txt>) {
    my $html_file = substr($txt_file,0,-3) . 'html';
    my $cmd;
    if      ($txt_file eq 'index.txt') {
             $cmd = $pandoc_cmd->{'index'};
    } elsif ($txt_file ~~ [qw(appendix-a-index.txt appendix-g-glossary.txt)]) {
             $cmd = $pandoc_cmd->{'appendixAG'};
    } else { $cmd = $pandoc_cmd->{'normal'}; }
    #print "Processing:", $txt_file, '-->', $html_file
    system sprintf $cmd, $html_file, $txt_file;
}
