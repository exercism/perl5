package Sieve;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<find_primes>;

# Solved by GitHub Copilot
sub find_primes ($n) {
    my @primes = (1) x ( $n + 1 );
    $primes[0] = $primes[1] = 0;

    for my $i ( 2 .. int( sqrt($n) ) ) {
        next unless $primes[$i];
        for ( my $j = $i**2; $j <= $n; $j += $i ) {
            $primes[$j] = 0;
        }
    }

    return [ grep { $primes[$_] } 2 .. $n ];
}

1;
