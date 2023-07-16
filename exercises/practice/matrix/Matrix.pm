package Matrix;

use Moo;
use feature qw<say>;

has string => (
    is => 'ro',
);

sub row {
    my ( $self, $index ) = @_;
    return undef;
}

sub column {
    my ( $self, $index ) = @_;
    return undef;
}

1;
