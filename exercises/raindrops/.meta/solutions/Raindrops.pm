package Raindrops;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(raindrop);

sub raindrop {
  my ($number) = @_;
  my $drops = '';

  if ( $number % 3 == 0 ) {
    $drops .= 'Pling';
  }
  if ( $number % 5 == 0 ) {
    $drops .= 'Plang';
  }
  if ( $number % 7 == 0 ) {
    $drops .= 'Plong';
  }

  return $drops || $number;
}

1;
