package Sieve;

use strict;
use warnings;

sub new {
    my ($class, $max) = @_;
    die "ArgumentError, number too small: $max" if $max < 2;
    bless { max => $max }, $class;
}

sub primes {
    my $self = shift;
    my $prime = 2;

    return [$prime] if $self->{max} == $prime;

    my @list = 3..$self->{max};
    my @primes = ($prime,);

    while(@list > 0) {
        my @candidates = grep { $_ % $prime != 0 } @list;
        $prime = shift @candidates;
        push @primes => $prime;
        @list = @candidates;
    }

    return [@primes];
}

1;
