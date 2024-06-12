package Robot;

use v5.40;
use Moo;

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
    return $self;
}
