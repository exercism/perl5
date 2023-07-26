package Queen;

use v5.38;
use Moo;

has row => (
    is => 'ro',
);

has column => (
    is => 'ro',
);

sub can_attack ( $self, $other ) {
    return undef;
}
