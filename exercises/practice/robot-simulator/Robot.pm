package Robot;

use Moo; use feature qw<say>;

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

sub enact {
    my ( $self, $instructions ) = @_;
    return $self;
}

1;
