use strict;
use warnings;
use v5.10;

my (%file, %data, %sum, $FH, $content, @fn_parts);
for my $md_file (<*.txt>){
	@fn_parts = split '-', $md_file;
	next unless @fn_parts > 1;
	$file{ ucfirst ($fn_parts[0]) . '-' . uc($fn_parts[1]) } = $md_file;
}

my %pattern = (
	item   => qr/\n\n<a id/,
	anchor => qr/<a id="/,
	'link' => qr/\]\(/,
);


for my $page (sort keys %file) {
	open $FH, '<', $file{$page};
	$content = do {local $/; <$FH>};
	$data{'size'} = -s $file{$page};
	for my $type (keys %pattern) {
		$data{$type} =()= $content =~ /$pattern{$type}/g;
		$sum{$type} += $data{$type};
	}
	$sum{'size'} += $data{'size'};
	printf "%12s  items: %4d  anchor: %4d  links: %4d  bytes: %6.d\n", 
		$page, $data{'item'}, $data{'anchor'}, $data{'link'}, $data{'size'};
}
print '-' x 67,"\n";
printf "Sum           items: %4d  anchor: %4d  links: %4d  bytes: %6d\n",
	$sum{'item'}, $sum{'anchor'}, $sum{'link'}, $sum{'size'};

