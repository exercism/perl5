package Squares;

use strict;
use warnings;

use List::Util 'sum';

sub new {
    my ($class, $to) = @_;
    return bless { to => $to }, $class;
}

sub sum_of_squares {
    my $self = shift;
    return sum map { $_ ** 2 } 1..$self->{to};
}

sub square_of_sums {
    my $self = shift;
    return (sum 1..$self->{to}) ** 2;
}

sub difference {
    my $self = shift;
    return $self->square_of_sums - $self->sum_of_squares;
}

1;
