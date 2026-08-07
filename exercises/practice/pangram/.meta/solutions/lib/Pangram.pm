package Pangram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_pangram>;

use List::Util qw(uniq);

sub is_pangram ($text) {
    my @letters = grep {/[[:alpha:]]/} split "", lc $text;
    return scalar( uniq @letters ) == 26;
}

1;
