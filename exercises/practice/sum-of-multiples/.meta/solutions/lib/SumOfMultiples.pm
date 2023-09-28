package SumOfMultiples;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<sum_of_multiples>;

sub sum_of_multiples ( $factors, $limit ) {

    $factors = [ grep { $_ > 0 } @{$factors} ];
    my %multiples;

    for my $factor (@$factors) {
        for ( my $i = 1; $i * $factor < $limit; $i++ ) {
            $multiples{ $i * $factor } = 1;
        }
    }
    my $sum = 0;
    for my $multiple ( keys %multiples ) {
        $sum += $multiple;
    }

    return $sum;
}

1;
