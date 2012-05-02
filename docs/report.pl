
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
for my $page (sort keys %file) {
	open $FH, '<', $file{$page};
	$content = do {local $/; <$FH>};
	$data{'size'} = -s $file{$page};
	for my $type (keys %pattern) {
		$data{$type} =()= $content =~ /$pattern{$type}/g;
		$sum{$type} += $data{$type};
	}
	$sum{'size'} += $data{'size'};
	printf "%11s  items: %4d  anchor: %4d  links: %5d  line: %5d  bytes: %6.d\n", 
		$page, $data{'item'}, $data{'anchor'}, $data{'link'}, $data{'line'}, $data{'size'};
}
print '-' x 80,"\n";
printf "Sum          items: %4d  anchor: %4d  links: %5d  line: %5d  bytes: %6d\n",
	$sum{'item'}, $sum{'anchor'}, $sum{'link'}, $sum{'line'}, $sum{'size'};

