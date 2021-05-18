package AllYourBase;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

use lib 'lib';
use Exercism::QuickSolve;

sub rebase {
  my ($input) = @_;

  quicksolve( input => $input );
}

1;
