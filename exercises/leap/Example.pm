# Declare package 'Leap' with version
package Leap 2;
use strict;
use warnings;

sub is_leap {
  my $year = shift;
  divisible_by($year, 400)
    or divisible_by($year, 4) and !divisible_by($year, 100)
    ? 1 : 0;
}

sub divisible_by {
  $_[0] % $_[1] == 0 ? 1 : 0;
}

1;
