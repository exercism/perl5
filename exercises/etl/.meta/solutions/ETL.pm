package ETL;

use strict;
use warnings;

sub transform {
  my $legacy = shift;
  my %scores;
  foreach my $num ( keys %$legacy ) {
    map { $scores{ lc $_ } = $num } @{ $legacy->{$num} };
  }

  return \%scores;
}

__PACKAGE__;
