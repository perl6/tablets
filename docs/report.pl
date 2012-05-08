#!/usr/bin/perl
use strict;
use warnings;
use v5.10;

my (%file, %data, %sum, $FH, $content, @fn_parts);
my %pattern = (
	head   => qr/\n### |\n\n.*\n\-+\n\n|\S\n=+\n\n|\n\n# \[.\]\(#nav-top\)\n\n/, # 4 kinds of markdown headlines
	item   => qr/\n\n<a id/, 
	anchor => qr/<a id="/,
	link   => qr/\]\(/,
	line   => qr/(?<!\n)\n/,                                                     # no empty lines
);
my $head = '    page     title   item  anchor  links   lines    bytes';
my $format = "%11s    %3s   %4s   %4s   %5s   %5s   %6s\n";

# filter out all the tablet files
for my $md_file (<*.txt>){
	@fn_parts = split '-', $md_file;
	next unless @fn_parts > 1;
	$file{ ucfirst ($fn_parts[0]) . '-' . uc($fn_parts[1]) } = $md_file;
}


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
	                $data{'anchor'}, $data{'link'}, $data{'line'}, $data{'size'};
}
print '-' x length $head,"\n";
printf $format, 'Sum', $sum{'head'}, $sum{'item'},
                       $sum{'anchor'},  $sum{'link'}, $sum{'line'}, $sum{'size'};


# Tester
	print "TODO:\n";
	open $FH, '<', 'appendix-a-index.txt';
	$content = do {local $/; <$FH>};
	my $v =()= $content =~ /\&mdash;\n\n/g;
	print " empty index entries: $v\n";
	open $FH, '<', 'appendix-g-glossary.txt';
	$content = do {local $/; <$FH>};
	my $v =()= $content =~ /\&mdash;\n\n/g;
	print " empty glossary terms: $v\n";