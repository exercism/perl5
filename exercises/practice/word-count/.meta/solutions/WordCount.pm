package WordCount;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<count_words>;

use lib 'lib';
use Exercism::QuickSolve;

sub count_words {
  my ($sentence) = @_;

  quicksolve(
    input     => $sentence,
    input_key => 'sentence',
  );
}

1;
