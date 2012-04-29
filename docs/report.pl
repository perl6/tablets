open my $FH, '<', "appendix-a-index.txt";
my $c = do {local $/; <$FH>}; 
my @items =  ($c =~ /\n\n<a id/g); 
my @anchor =  ($c =~ /<a id="/g); 
my @links =  ($c =~ /\]\(/g); 
print "Index A items:",scalar @items, " anchor:",scalar @anchor, " links:", scalar @links, "\n";

open  $FH, '<', "appendix-b-grouped.txt";
$c = do {local $/; <$FH>}; 
@links =  ($c =~ /\]\(/g); 
print "Index B                     links:", scalar @links, "\n";

open  $FH, '<', "appendix-d-delta.txt";
$c = do {local $/; <$FH>}; 
@links =  ($c =~ /\]\(/g); 
print "Index D                     links:", scalar @links, "\n";

open  $FH, '<', "appendix-g-glossary.txt";
$c = do {local $/; <$FH>}; 
@items =  ($c =~ /\n\n<a id/g); 
@anchor =  ($c =~ /<a id="/g); 
@links =  ($c =~ /\]\(/g); 
print "Index G items:",scalar @items, " anchor:",scalar @anchor, " links:", scalar @links, "\n";

