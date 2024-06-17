package Clock;

use v5.40;
use Moo;

# rwp = read-write protected
has hour   => ( is => 'rwp' );
has minute => ( is => 'rwp' );

sub time ($self) {
    return undef;
}

sub add_minutes ( $self, $amount ) {
    return $self;
}

sub subtract_minutes ( $self, $amount ) {
    return $self;
}

1;
