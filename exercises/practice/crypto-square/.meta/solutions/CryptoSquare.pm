package CryptoSquare;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<cipher>;

use lib 'lib';
use Exercism::QuickSolve;

sub cipher {
  my ($text) = @_;

  quicksolve(
    input     => $text,
    input_key => 'plaintext',
  );
}

1;
