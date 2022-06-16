package House;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<recite>;

use lib 'lib';
use Exercism::QuickSolve;

sub recite {
  my ($input) = @_;
  quicksolve( input => $input );
}

1;
