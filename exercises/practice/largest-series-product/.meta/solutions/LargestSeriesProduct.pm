package LargestSeriesProduct;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<largest_product>;

sub largest_product {
  my ($input) = @_;
  return ( grep { $_->{input} eq $input } @main::test_cases )[0]
    ->{expected};
}

1;
