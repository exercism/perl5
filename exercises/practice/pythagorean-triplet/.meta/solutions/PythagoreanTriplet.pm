package PythagoreanTriplet;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<triplets_with_sum>;

sub triplets_with_sum ($sum) {
    my @solutions;
    for my $side_a ( 1 .. $sum ) {
        my $numerator   = 2 * $side_a**2 + $sum**2 - 2 * $sum * $side_a;
        my $denominator = 2 * ( $sum - $side_a );
        if ( $denominator > 0 and $numerator % $denominator == 0 ) {
            my $side_c = $numerator / $denominator;
            my $side_b = $sum - $side_a - $side_c;
            push @solutions, [ $side_a, $side_b, $side_c ] if $side_b > $side_a;
        }
    }
    return [@solutions];
}

1;
