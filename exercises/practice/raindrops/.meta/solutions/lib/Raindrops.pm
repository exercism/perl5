package Raindrops;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<raindrop>;

sub raindrop ($number) {
    my $drops = '';

    if ( $number % 3 == 0 ) {
        $drops .= 'Pling';
    }
    if ( $number % 5 == 0 ) {
        $drops .= 'Plang';
    }
    if ( $number % 7 == 0 ) {
        $drops .= 'Plong';
    }

    return $drops || $number;
}

1;
