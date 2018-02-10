package BinarySearchTree;

use warnings;
use strict;

sub new {
  my ($class, $value) = @_;

  $class = ref $class if ref $class;
  bless { data => $value, }, $class;
}

sub data {
  my ($self) = @_;
  return $self->{data};
}

sub left {
  my ($self) = @_;

  $self->{left} ||= $self->new();
  return $self->{left};
}

sub right {
  my ($self) = @_;

  $self->{right} ||= $self->new();
  return $self->{right};
}

sub insert {
  my ($self, $value) = @_;

  if ($self->{data}) {
    if ($value <= $self->{data}) {
      $self->left->insert($value);
    } else {
      $self->right->insert($value);
    }
  } else {
    $self->{data} = $value;
  }
}

sub each {
  my ($self, $sub) = @_;

  $self->left->each($sub)  if $self->{left};
  $sub->($self->{data})    if $self->{data};
  $self->right->each($sub) if $self->{right};
}

1;
