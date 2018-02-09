package Trinary;

use strict;
use warnings;

sub new {
    my ($class, $trinary) = @_;
    my $self = bless {} => $class;
    $self->{trinary} = $trinary;
    return $self;
}

sub to_decimal {
    my $self = shift;

    return 0 unless $self->{trinary} =~ /[012]/g;

    my ($sum, $index) = (0, length $self->{trinary});

    foreach my $digit (split // => $self->{trinary}) {
        $sum += $digit * 3 ** --$index;
    }

    return $sum;
}
__PACKAGE__;
