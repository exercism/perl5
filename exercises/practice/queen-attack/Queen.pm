package Queen;

use Moo;
use feature qw<say>;

has row => (
    is => 'ro',
);

has column => (
    is => 'ro',
);

sub can_attack {
    my ( $self, $other ) = @_;
    return undef;
}

1;
