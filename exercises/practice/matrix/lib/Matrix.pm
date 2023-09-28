package Matrix;

use v5.38;
use Moo;

has string => (
    is => 'ro',
);

sub row ( $self, $index ) {
    return undef;
}

sub column ( $self, $index ) {
    return undef;
}
