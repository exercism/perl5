package SumOfMultiples;

use strict;
use warnings;
use List::Util 'sum';

sub new {
    my ($class, @multiples_of) = @_;

    bless { multiples_of => [@multiples_of] } => $class;
}

sub to {
    my ($self, $to) = @_;
    $to = $to - 1;
    my $sum;
    my @multiples;
    
    foreach my $num (1..$to) {
        foreach my $multiple_of ( @{ $self->{multiples_of} } ) {
            if ($num % $multiple_of == 0) {
                push @multiples => $num;
                last;
            }
        }
    }

    return (sum @multiples) || 0;
}

1;
