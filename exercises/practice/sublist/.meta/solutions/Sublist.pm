package Sublist;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<compare_lists>;

use lib 'lib';
use Exercism::QuickSolve;

sub compare_lists {
  my ($args) = @_;

  quicksolve( input => $args );
}

1;
