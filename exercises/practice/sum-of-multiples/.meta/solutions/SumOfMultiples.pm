package SumOfMultiples;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<sum_of_multiples>;

use lib 'lib';
use Exercism::QuickSolve;

sub sum_of_multiples {
  my ($input) = @_;

  quicksolve( input => $input );
}

1;
