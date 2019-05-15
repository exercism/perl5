package CustomSet;
use strict;
use warnings;

sub new {
  my ( $class, @members ) = @_;
  my %set;
  @set{@members} = ();
  bless \%set, $class;
}

sub add {
  my ( $self, $member ) = @_;
  $self->{$member} = 1;
  return $self;
}

sub remove {
  my ( $self, $member ) = @_;
  delete $self->{$member};
  return $self;
}

sub is_empty {
  my ($self) = @_;
  return !%$self;
}

sub is_member {
  my ( $self, $member ) = @_;
  return exists $self->{$member};
}

sub size {
  my ($self) = @_;
  return scalar keys %$self;
}

sub to_list {
  my ($self) = @_;
  return keys %$self;
}

sub union {
  my ( $self, $other ) = @_;
  return __PACKAGE__->new( keys %$self, keys %$other );
}

sub intersect {
  my ( $self, $other ) = @_;
  return __PACKAGE__->new( grep { $self->is_member($_) } keys %$other );
}

sub difference {
  my ( $self, $other ) = @_;
  return __PACKAGE__->new( grep { !$other->is_member($_) } keys %$self );
}

sub is_disjoint {
  my ( $self, $other ) = @_;
  return $self->intersect($other)->is_empty;
}

sub is_subset {
  my ( $self, $other ) = @_;
  return $other->difference($self)->is_empty;
}

sub is_equal {
  my ( $self, $other ) = @_;
  return $self->is_subset($other) && $other->is_subset($self);
}

1;
