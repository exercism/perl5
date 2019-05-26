package Clock;
use strict;
use warnings;

use POSIX;

sub new {
  my ( $class, $attributes ) = @_;
  my $self = {
    hour   => $attributes->{hour}   || 0,
    minute => $attributes->{minute} || 0,
  };
  return bless( $self, $class )->BUILD;
}

sub time {
  my ($self) = @_;
  return sprintf '%02d:%02d', $self->{hour}, $self->{minute};
}

sub add_minutes {
  my ( $self, $amount ) = @_;
  $self->{minute} += $amount;
  return $self->BUILD;
}

sub subtract_minutes {
  my ( $self, $amount ) = @_;
  return $self->add_minutes( -$amount );
}

sub BUILD {
  my ($self) = @_;
  $self->{hour}
    = ( $self->{hour} + floor( $self->{minute} / 60 ) ) % 24;
  $self->{minute} %= 60;
  return $self;
}

1;
