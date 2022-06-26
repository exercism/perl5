package Sieve;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<find_primes>;

use lib 'lib';
use Exercism::QuickSolve;

sub find_primes {
    my ($limit) = @_;

    quicksolve(
        input     => $limit,
        input_key => 'limit',
    );
}

1;
