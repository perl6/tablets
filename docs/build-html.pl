#!/usr/bin/perl -w
use strict;
use v5.10;

my $prefix = shift(@ARGV) // '.';

my $pandoc_cmd = {
    normal => 'pandoc -s --toc --css=styles.css -H _head-inc -B _nav-header -A _nav-footer -o %s %s',
    'appendix-a-index.txt'    => 'pandoc -s   --css=styles.css -H _head-inc -B _nav-header -A _nav-footer -o %s %s',
    'appendix-g-glossary.txt' => 'pandoc -s   --css=styles.css -H _head-inc -B _nav-header -A _nav-footer -o %s %s',
    'index.txt' =>      'pandoc -s   --css=styles.css -H _head-inc                               -o %s %s', # -N
};

for my $txt_file (<*.txt>) {
    my $html_file = substr($txt_file,0,-3) . 'html';
    my $cmd = $pandoc_cmd->{ $txt_file } // $pandoc_cmd->{normal};
    #print "Processing:", $txt_file, '-->', $html_file
    system sprintf $cmd, "$prefix/$html_file", $txt_file;
}
