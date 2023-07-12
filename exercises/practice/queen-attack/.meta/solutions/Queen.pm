package Queen;

use Moo;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

has row => (
    is  => 'ro',
    isa => sub {
        die 'row not on board' if $_[0] < 0 || $_[0] > 7;
    },
);

has column => (
    is  => 'ro',
    isa => sub {
        die 'column not on board' if $_[0] < 0 || $_[0] > 7;
    },
);

sub can_attack {
    my ( $self, $other ) = @_;

    # Same row or column
    return 1 if $self->row == $other->row || $self->column == $other->column;

    # Same diagonal
    return 1
        if abs( $self->row - $other->row )
        == abs( $self->column - $other->column );

    return 0;
}

1;
