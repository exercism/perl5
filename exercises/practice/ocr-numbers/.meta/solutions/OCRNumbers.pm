package OCRNumbers;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<convert>;

use lib 'lib';
use Exercism::QuickSolve;

sub convert {
  my ($rows) = @_;

  quicksolve(
    input     => $rows,
    input_key => 'rows',
  );
}

1;
