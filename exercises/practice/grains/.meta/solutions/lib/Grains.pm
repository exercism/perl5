package Grains;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<grains_on_square total_grains>;

use bignum;
use List::Util qw(sum);

sub grains_on_square ($square) {
    if ( $square < 1 || $square > 64 ) {
        die 'square must be between 1 and 64';
    }
    return 2**( $square - 1 );
}

sub total_grains () {
    return sum map { grains_on_square($_) } 1 .. 64;
}

1;
