package KindergartenGarden;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

use lib 'lib';
use Exercism::QuickSolve;

sub plants {
    my ($input) = @_;

    quicksolve(
        input => $input,
    );
}

1;
