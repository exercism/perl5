package Queen;

use Moo;
use feature qw<say>;

has row => (
    is  => 'ro',
    isa => sub {
        die 'row not positive' if $_[0] < 0;
        die 'row not on board' if $_[0] > 7;
    },
);

has column => (
    is  => 'ro',
    isa => sub {
        die 'column not positive' if $_[0] < 0;
        die 'column not on board' if $_[0] > 7;
    },
);

sub can_attack {
    my ( $self, $other ) = @_;
    return undef;
}

1;
