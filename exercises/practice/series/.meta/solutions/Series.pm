package Series;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<slices>;

use lib 'lib';
use Exercism::QuickSolve;

sub slices {
  my ($args) = @_;

  quicksolve( input => $args );
}

1;
