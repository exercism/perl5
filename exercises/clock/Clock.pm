package Clock;
use strict;
use warnings;

sub new {
  my ($class, $attributes) = @_;
  return bless $attributes, $class;
}

sub time {
  my ($self) = @_;
}

sub add_minutes {
  my ($self, $amount) = @_;
}

sub subtract_minutes {
  my ($self, $amount) = @_;
}

1;
