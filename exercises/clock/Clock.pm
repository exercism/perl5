package Clock;
use strict;
use warnings;

sub new {
  my ( $class, $attributes ) = @_;
  return bless $attributes, $class;
}

sub time {
  my ($self) = @_;
  return undef;
}

sub add_minutes {
  my ( $self, $amount ) = @_;
  return undef;
}

sub subtract_minutes {
  my ( $self, $amount ) = @_;
  return undef;
}

1;
