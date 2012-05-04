
use strict;
use warnings;
use v5.10;

my (%file, %data, %sum, $FH, $content, @fn_parts);
my %pattern = (
	item   => qr/\n\n<a id|\n### |\w\n\-+\n\n|\w\n=+\n\n/,
	anchor => qr/<a id="/,
	link   => qr/\]\(/,
	line   => qr/\n/,
);

# filter out all the tablet files
for my $md_file (<*.txt>){
	@fn_parts = split '-', $md_file;
	next unless @fn_parts > 1;
	$file{ ucfirst ($fn_parts[0]) . '-' . uc($fn_parts[1]) } = $md_file;
}


# and sniff through them
print "    page      item  anchor  links   lines    bytes \n", '-' x 50,"\n";
for my $page (sort keys %file) {
	open $FH, '<', $file{$page};
	$content = do {local $/; <$FH>};
	$data{'size'} = -s $file{$page};
	for my $type (keys %pattern) {
		$data{$type} =()= $content =~ /$pattern{$type}/g;
		$sum{$type} += $data{$type};
	}
	$sum{'size'} += $data{'size'};
	printf "%11s   %4d   %4d   %5d   %5d   %6.d\n", 
		$page, $data{'item'}, $data{'anchor'}, $data{'link'}, $data{'line'}, $data{'size'};
}
print '-' x 50,"\n";
printf "        Sum   %4d   %4d   %5d   %5d   %6d\n",
	$sum{'item'}, $sum{'anchor'}, $sum{'link'}, $sum{'line'}, $sum{'size'};

