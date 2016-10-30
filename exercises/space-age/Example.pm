package Example;

use strict;
use warnings;

my %orbital_period = qw(
    mercury 0.2408467
      venus 0.61519726
      earth 1
       mars 1.880818
    jupiter 11.862615
     saturn 29.447498
     uranus 84.016846
    neptune 164.79132
);

sub new {
    bless { seconds => $_[1] } => $_[0];
}

sub seconds { $_[0]->{seconds} }

sub _on_planet {
    my ($self, $planet) = @_;
    my $earth_years = $self->seconds / 31_557_600;

    return sprintf "%.2f" => ($earth_years / $orbital_period{$planet});
}

sub AUTOLOAD {
    my $sub = our $AUTOLOAD;
    $sub =~ s/.*::on_//;

    if ( grep { $_ eq $sub } keys %orbital_period ) {
        my $self = shift;
        return $self->_on_planet($sub);
    }
}

1;

