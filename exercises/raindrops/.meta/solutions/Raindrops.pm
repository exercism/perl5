package Raindrops 1;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(raindrop);

sub raindrop {
  my ($num) = @_;
  my %sounds = (Pling => 3, Plang => 5, Plong => 7);
  my $str = '';
  foreach (qw(Pling Plang Plong)) {
    if ($num % $sounds{$_} == 0) {
      $str .= $_;
    }
  }
  return $str || $num;
}

1;
