my %file = (
	A => 'appendix-a-index.txt',
	B => 'appendix-b-grouped.txt',
	D => 'appendix-d-delta.txt',
	G => 'appendix-g-glossary.txt',
);
my %pattern = (
	item   => qr/\n\n<a id/,
	anchor => qr/<a id="/,
	'link' => qr/\]\(/,
);
my (%data, %sum, $FH, $content);

for my $page (sort keys %file) {
	open $FH, '<', $file{$page};
	$content = do {local $/; <$FH>};
	for my $type (keys %pattern) {
		$data{$type} =()= $content =~ /$pattern{$type}/g;
		$sum{$type} += $data{$type};
	}
	printf "Page $page  items: %4d  anchor: %4d  links: %4d\n", 
		$data{'item'}, $data{'anchor'}, $data{'link'};
}
print '-' x 47,"\n";
printf "Sum      items: %4d  anchor: %4d  links: %4d\n",
	$sum{'item'}, $sum{'anchor'}, $sum{'link'};

