package Example;

use strict;
use warnings;

sub new {
    my ($class, $number) = @_;
    my $self = bless {} => $class;
    $self->{number} = $self->_get_digits($number);

    return $self;
}
sub _get_digits {
    my ($self, $number) = @_;
    my $digits = $number;
    $digits =~ s/\D//g;
    
    return $digits if length $digits == 10;
    return substr $digits, 1, 10 if $digits =~ m/1\d{10}/;
    return "0" x 10;
}

sub number { $_[0]->{number} }
sub area_code { substr $_[0]->{number}, 0, 3 }

sub pretty {
    my $pretty = $_[0]->{number};
    $pretty =~ s/(\d\d\d)(\d\d\d)(\d{4})/\($1\) $2\-$3/;
    return $pretty;
}

__PACKAGE__;
