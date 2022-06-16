package Minesweeper;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<annotate>;

use lib 'lib';
use Exercism::QuickSolve;

sub annotate {
  my ($minefield) = @_;

  quicksolve(
    input     => $minefield,
    input_key => 'minefield',
  );
}

1;
