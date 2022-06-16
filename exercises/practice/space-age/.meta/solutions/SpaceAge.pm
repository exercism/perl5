package SpaceAge;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<age_on_planet>;

use lib 'lib';
use Exercism::QuickSolve;

sub age_on_planet {
  my ($args) = @_;

  quicksolve( input => $args );
}

1;
