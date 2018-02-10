package GradeSchool;

use strict;
use warnings;

sub new {
  my ($class) = @_;
  return bless {}, $class;
}

sub add {
  my ($self, $name, $grade) = @_;

  my @students = @{ $self->grade($grade) };
  $self->{$grade} = [sort @students, $name];
}

sub grade {
  my ($self, $grade) = @_;

  return $self->{$grade} || [];
}

1;
