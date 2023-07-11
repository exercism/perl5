package Hamming;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<hamming_distance>;

sub hamming_distance {
    my ( $strand1, $strand2 ) = @_;
    if ( length $strand1 != length $strand2 ) {
        die 'left and right strands must be of equal length';
    }
    return
        scalar
        grep { [ split //, $strand1 ]->[$_] ne [ split //, $strand2 ]->[$_] }
        0 .. length($strand1) - 1;
}

1;
