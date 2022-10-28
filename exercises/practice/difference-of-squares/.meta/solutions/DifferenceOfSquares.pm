package DifferenceOfSquares;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<square_of_sum sum_of_squares difference_of_squares>;

use List::Util qw<sum>;

sub square_of_sum {
    my ($number) = @_;
    return sum( 1 .. $number )**2;
}

sub sum_of_squares {
    my ($number) = @_;
    return sum( map { $_**2 } 1 .. $number );
}

sub difference_of_squares {
    my ($number) = @_;
    return square_of_sum($number) - sum_of_squares($number);
}

1;
