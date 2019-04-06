package CustomSet;

use strict;
use warnings;

sub new {
  my $class = shift;

  my %set;
  @set{@_} = ();

  bless \%set, $class;
}

sub add {
  my ( $self, $new ) = @_;

  $self->{$new} = 1;
  return $self;
}

sub delete : method {
  my ( $self, $member ) = @_;

  delete $self->{$member};
  return $self;
}

sub union {
  my ( $self, $other ) = @_;

  return __PACKAGE__->new( keys %$self, keys %$other );
}

sub difference {
  my ( $self, $other ) = @_;

  return __PACKAGE__->new( grep { !$other->is_member($_) } keys %$self );
}

sub is_disjoint {
  my ( $self, $other ) = @_;

  return $self->intersect($other)->size() == 0;
}

sub empty {
  my $self = shift;

  %$self = ();
  return $self;
}

sub intersect {
  my ( $self, $other ) = @_;

  return __PACKAGE__->new( grep { $self->is_member($_) } keys %$other );
}

sub is_member {
  my ( $self, $member ) = @_;

  return exists $self->{$member};
}

sub size {
  my $self = shift;

  return scalar keys %$self;
}

sub is_subset {
  my ( $self, $other ) = @_;

  return $self->intersect($other)->size() == $other->size();
}

sub to_list {
  my $self = shift;

  return keys %$self;
}

sub is_equal {
  my ( $self, $other ) = @_;

  return $self->intersect($other)->size() == $self->size() && $self->size() == $other->size();
}

1;

