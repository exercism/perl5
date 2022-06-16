package LargestSeriesProduct;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<largest_product>;

use lib 'lib';
use Exercism::QuickSolve;

sub largest_product {
  my ($input) = @_;

  quicksolve( input => $input );
}

1;
