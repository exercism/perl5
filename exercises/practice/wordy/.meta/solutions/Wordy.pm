package Wordy;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<answer>;

use lib 'lib';
use Exercism::QuickSolve;

sub answer {
    my ($question) = @_;

    quicksolve(
        input     => $question,
        input_key => 'question',
    );
}

1;
