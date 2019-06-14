package Clock;
use Moo;

use POSIX ();

has [qw(hour minute)] => (
  is      => 'rwp',
  default => 0,
);

sub time {
  my ($self) = @_;
  return sprintf '%02d:%02d', $self->hour, $self->minute;
}

sub add_minutes {
  my ( $self, $amount ) = @_;
  $self->_set_minute( $self->minute + $amount );
  return $self->BUILD;
}

sub subtract_minutes {
  my ( $self, $amount ) = @_;
  return $self->add_minutes( -$amount );
}

sub BUILD {
  my ($self) = @_;
  $self->_set_hour(
    ( $self->hour + POSIX::floor( $self->minute / 60 ) ) % 24 );
  $self->_set_minute( $self->minute % 60 );
  return $self;
}

1;
