package Isogram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_isogram>;

use List::Util qw(uniq);

sub is_isogram ($phrase) {
    my @letters = grep {/[[:alpha:]]/} split "", lc $phrase;
    return scalar(@letters) == scalar( uniq @letters );
}

1;
