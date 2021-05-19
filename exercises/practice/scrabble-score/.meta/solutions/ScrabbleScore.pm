package ScrabbleScore;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<scrabble_score>;

use lib 'lib';
use Exercism::QuickSolve;

sub scrabble_score {
  my ($word) = @_;

  quicksolve(
    input     => $word,
    input_key => 'word',
  );
}

1;
