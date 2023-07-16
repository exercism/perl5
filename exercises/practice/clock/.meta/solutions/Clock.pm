package Clock;

use Moo;
use experimental qw<signatures postderef postderef_qq>;

use POSIX ();

has [qw(hour minute)] => (
    is      => 'rwp',
    default => 0,
);

sub time ($self) {
    return sprintf '%02d:%02d', $self->hour, $self->minute;
}

sub add_minutes ( $self, $amount ) {
    $self->_set_minute( $self->minute + $amount );
    return $self->BUILD;
}

sub subtract_minutes ( $self, $amount ) {
    return $self->add_minutes( -$amount );
}

sub BUILD ($self) {
    $self->_set_hour( ( $self->hour + POSIX::floor( $self->minute / 60 ) ) % 24 );
    $self->_set_minute( $self->minute % 60 );
    return $self;
}

1;
