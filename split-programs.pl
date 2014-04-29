use XML::TreeBuilder;
my $tree = XML::TreeBuilder->new; # empty tree
my $file =shift;
$tree->parse_file($file);
use File::Basename qw(basename);
$file =~ s/\..*?$//;
$counter = 0;
for ($tree->look_down("_tag", "programlisting")) {
    open OUT, ">$file.".++$counter or die $!;
    print OUT $_->as_text."\n";
    close OUT;
}
