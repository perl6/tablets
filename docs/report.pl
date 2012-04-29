open my $FH, '<', "appendix-a-index.txt";
my $c = do {local $/; <$FH>}; 
my @d =  ($c =~ /\n\n<a id/g); 
print "Index A items:",scalar @d, "\n";

open  $FH, '<', "appendix-g-glossary.txt";
$c = do {local $/; <$FH>}; 
@d =  ($c =~ /\n\n<a id/g); 
print "Index G items:",scalar @d, "\n";

