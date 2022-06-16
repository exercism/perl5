package DifferenceOfSquares;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK
  = qw<square_of_sum sum_of_squares difference_of_squares>;

use lib 'lib';
use Exercism::QuickSolve;

sub square_of_sum {
  my ($number) = @_;

  quicksolve(
    input     => $number,
    input_key => 'number',
    property  => 'squareOfSum',
  );
}

sub sum_of_squares {
  my ($number) = @_;

  quicksolve(
    input     => $number,
    input_key => 'number',
    property  => 'sumOfSquares',
  );
}

sub difference_of_squares {
  my ($number) = @_;

  quicksolve(
    input     => $number,
    input_key => 'number',
    property  => 'differenceOfSquares',
  );
}

1;
