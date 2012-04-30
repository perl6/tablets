open my $FH, '<', "appendix-a-index.txt";
my $c = do {local $/; <$FH>}; 
my @items =  ($c =~ /\n\n<a id/g); 
my @anchor =  ($c =~ /<a id="/g); 
my @links =  ($c =~ /\]\(/g); 
printf "Index A  items: %4d  anchor: %4d  links: %4d\n", int @items, int @anchor, int @links;

open  $FH, '<', "appendix-b-grouped.txt";
$c = do {local $/; <$FH>}; 
@links =  ($c =~ /\]\(/g); 
printf "Index B                             links: %4d\n", int @links;

open  $FH, '<', "appendix-d-delta.txt";
$c = do {local $/; <$FH>}; 
@links =  ($c =~ /\]\(/g); 
printf "Index D                             links: %4d\n", int @links;

open  $FH, '<', "appendix-g-glossary.txt";
$c = do {local $/; <$FH>}; 
@items =  ($c =~ /\n\n<a id/g); 
@anchor =  ($c =~ /<a id="/g); 
@links =  ($c =~ /\]\(/g); 
printf "Index G  items: %4d  anchor: %4d  links: %4d\n", int @items, int @anchor, int @links;

