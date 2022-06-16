package Say;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<say_number>;

use lib 'lib';
use Exercism::QuickSolve;

sub say_number {
  my ($number) = @_;

  quicksolve(
    input     => $number,
    input_key => 'number',
  );
}

1;
