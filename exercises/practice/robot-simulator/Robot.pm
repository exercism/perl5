package Robot;

use Moo;
use feature qw<say>;

has x => (
    is => 'rwp',
);

has y => (
    is => 'rwp',
);

has direction => (
    is => 'rwp',
);

sub enact {
    my ( $self, $instructions ) = @_;
    return $self;
}

1;
