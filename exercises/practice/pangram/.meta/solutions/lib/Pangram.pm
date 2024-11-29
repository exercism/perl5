package Pangram;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_pangram>;

use List::Util qw(uniq);

sub is_pangram ($text) {
    my @letters = grep {/[[:alpha:]]/} split "", lc $text;
    return scalar( uniq @letters ) == 26;
}

1;
