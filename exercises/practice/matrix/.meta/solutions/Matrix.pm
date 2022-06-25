package Matrix;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<row column>;

use lib 'lib';
use Exercism::QuickSolve;

sub row {
    my ($input) = @_;

    quicksolve( input => $input );
}

sub column {
    my ($input) = @_;

    quicksolve( input => $input );
}

1;
