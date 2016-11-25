package Example;

use strict;
use warnings;

use bigint;
use List::Util qw(sum);

sub square {
    (get_square($_[0]))[-1]
}

sub get_square {
    my $n = shift;
    
    return 1 if $n == 1;

    my @squares = qw(1);

    push @squares => $squares[-1]*2 for 2..$n;
    
    return @squares;
}

sub total  {
    sum 0, get_square(64);
}

__PACKAGE__;
