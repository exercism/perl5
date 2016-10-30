package Example;

use strict;
use warnings;

my %_HEXTRA = qw(
    a 10
    b 11
    c 12
    d 13
    e 14
    f 15
);

sub new {
    my ($class, $hexadecimal) = @_;
    my $self = bless { hexadecimal => $hexadecimal } => $class;

    return $self;
}

sub to_decimal {
    my $self = shift;

    return 0 if $self->{hexadecimal} =~ m/[^0-9a-f]/;

    my $decimal = 0;
    my $index = length $self->{hexadecimal};

    foreach my $hexa ( split // => $self->{hexadecimal} ) {
       $hexa = $_HEXTRA{$hexa} if exists $_HEXTRA{$hexa};
       $decimal += $hexa * 16 ** --$index; 
    }

    return $decimal;
}

__PACKAGE__;
