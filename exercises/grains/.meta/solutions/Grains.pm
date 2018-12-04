package Grains;
use strict;
use warnings;
use bignum;
use Exporter 'import';
our @EXPORT_OK = qw(grains_on_square total_grains);

sub grains_on_square {
  my ($square) = @_;
  die 'invalid square' if $square < 1 || $square > 64;
  return '' . 2 ** ($square - 1);
}

sub total_grains {
  return '' . 2 ** 64 - 1;
}

1;
