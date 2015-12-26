#!/usr/bin/perl
use strict;
use warnings;
use autodie;
use v5.10;

my (%file, %data, %sum, $FH, $content, @fn_parts);
my %pattern = (
	head   => qr/\n### |\n\n.*\n\-+\n\n|\S\n=+\n\n|\n\n# \[.\]\(#nav-top\)\n\n/, # 4 kinds of markdown headlines
	item   => qr/\n\n<a id/, 
	anchor => qr/<a id="/,
	link   => qr/\]\(/,
	line   => qr/(?<!\n)\n/,                                                     # no empty lines
);
my $head = '    page     title   item  anchor  links   lines   kbytes';
my $format = "%11s    %3s   %4s   %4s   %5s   %5s   %6d\n";

# filter out all the tablet files
for my $md_file (<*.txt>){
	@fn_parts = split '-', $md_file;
	next unless @fn_parts > 1;
	$file{ ucfirst ($fn_parts[0]) . '-' . uc($fn_parts[1]) } = $md_file;
}
die "No .txt file found. Are you in the docs/ directory?\n" if not %file;

# and sniff through them
print "$head \n", '-' x length $head,"\n";
for my $page (sort keys %file) {
	open $FH, '<', $file{$page};
	$content = do {local $/; <$FH>};
	$data{'size'} = -s $file{$page};
	for my $type (keys %pattern) {
		$data{$type} =()= $content =~ /$pattern{$type}/g;
		$sum{$type} += $data{$type};
	}
	$sum{'size'} += $data{'size'};
	printf $format, $page, $data{'head'}, $data{'item'},
	                $data{'anchor'}, $data{'link'}, $data{'line'}, $data{'size'}/1024;
}
print '-' x length $head,"\n";
printf $format, 'Sum', $sum{'head'}, $sum{'item'},
                       $sum{'anchor'},  $sum{'link'}, $sum{'line'}, $sum{'size'}/1024;


print "TODO:\n";
my $nr;
	open $FH, '<', 'appendix-a-index.txt';
	$content = do {local $/; <$FH>};
	$nr =()= $content =~ /\&mdash;\n\n|&mdash; /g;
	print " empty index entries: $nr\n";
	open $FH, '<', 'appendix-f-faq.txt';
	$content = do {local $/; <$FH>};
	$nr =()= $content =~ /---\n\n/g;
	print " unanswered questions: $nr\n";
	open $FH, '<', 'appendix-g-glossary.txt';
	$content = do {local $/; <$FH>};
	$nr =()= $content =~ /\&mdash;\n\n|&mdash; /g;
	print " empty glossary terms: $nr\n";
