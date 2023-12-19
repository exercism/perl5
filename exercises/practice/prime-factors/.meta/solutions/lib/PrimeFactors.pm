package PrimeFactors;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<factors>;

sub factors ($number) {
    my @factors;

    for ( my $i = 2; $i * $i <= $number; $i++ ) {
        while ( $number % $i == 0 ) {
            push @factors, $i;
            $number /= $i;
        }
    }

    push @factors, $number if $number > 1;

    return \@factors;
}

1;
