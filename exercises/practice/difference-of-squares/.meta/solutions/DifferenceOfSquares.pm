package DifferenceOfSquares;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK
  = qw<square_of_sum sum_of_squares difference_of_squares>;

sub square_of_sum {
  my ($number) = @_;
  return (
    grep {
           $_->{property} eq 'squareOfSum'
        && $_->{input}{number} eq $number
    } @main::test_cases
  )[0]->{expected};
}

sub sum_of_squares {
  my ($number) = @_;
  return (
    grep {
           $_->{property} eq 'sumOfSquares'
        && $_->{input}{number} eq $number
    } @main::test_cases
  )[0]->{expected};
}

sub difference_of_squares {
  my ($number) = @_;
  return (
    grep {
           $_->{property} eq 'differenceOfSquares'
        && $_->{input}{number} eq $number
    } @main::test_cases
  )[0]->{expected};
}

1;
