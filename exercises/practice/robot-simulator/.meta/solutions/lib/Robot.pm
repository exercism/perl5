package Robot;

use Moo;
use experimental qw<signatures postderef postderef_qq>;

use List::Util qw<none>;

has x => (
    is => 'rwp',
);

has y => (
    is => 'rwp',
);

has direction => (
    is  => 'rwp',
    isa => sub {
        die if none { $_[0] eq $_ } qw<north south east west>;
    },
);

sub enact ( $self, $instructions ) {

    for my $step ( split //, $instructions ) {
        if ( $step eq 'A' ) {
            if ( $self->direction eq 'north' ) {
                $self->_set_y( $self->y + 1 );
            }
            elsif ( $self->direction eq 'south' ) {
                $self->_set_y( $self->y - 1 );
            }
            elsif ( $self->direction eq 'east' ) {
                $self->_set_x( $self->x + 1 );
            }
            elsif ( $self->direction eq 'west' ) {
                $self->_set_x( $self->x - 1 );
            }
        }
        elsif ( $step eq 'L' ) {
            if ( $self->direction eq 'north' ) {
                $self->_set_direction('west');
            }
            elsif ( $self->direction eq 'west' ) {
                $self->_set_direction('south');
            }
            elsif ( $self->direction eq 'south' ) {
                $self->_set_direction('east');
            }
            elsif ( $self->direction eq 'east' ) {
                $self->_set_direction('north');
            }
        }
        elsif ( $step eq 'R' ) {
            if ( $self->direction eq 'north' ) {
                $self->_set_direction('east');
            }
            elsif ( $self->direction eq 'east' ) {
                $self->_set_direction('south');
            }
            elsif ( $self->direction eq 'south' ) {
                $self->_set_direction('west');
            }
            elsif ( $self->direction eq 'west' ) {
                $self->_set_direction('north');
            }
        }
    }

    return $self;
}

1;
