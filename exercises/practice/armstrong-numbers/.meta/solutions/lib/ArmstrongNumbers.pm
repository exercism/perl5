package ArmstrongNumbers;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_armstrong_number>;

use bignum;

sub is_armstrong_number ($number) {
    my $n    = $number->copy();
    my $size = $n->length();
    my $sum  = Math::BigInt->bzero();
    my $rem;
    while ( $n->is_positive() ) {
        ( $n, $rem ) = $n->bdiv(10);
        $sum = $sum->badd( $rem->bpow($size) );
    }
    return $sum->beq($number);
}

1;
