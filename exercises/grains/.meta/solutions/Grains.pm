package Grains;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(grains_on_square total_grains);

sub grains_on_square {
  my ($square) = @_;
  if ($square < 1 || $square > 64) {
    die 'invalid square';
  }
  return int 2 ** ($square - 1);
}

sub total_grains {
  my $sum;
  map {$sum += grains_on_square($_)} 1..64;
  return $sum;
}

1;
