package Triplet;

use strict;
use warnings;

sub new {
  my ( $class, @args ) = @_;
  my $self = bless {}, $class;

  # if hash is passed
  foreach my $arg (@args) {
    if ( ref $arg eq 'HASH' ) {
      foreach my $key ( keys %$arg ) {
        $self->{$key} = $arg->{$key};
      }
      return $self;
    }
  }

  # a, b, c is passed
  ( $self->{a}, $self->{b}, $self->{c} ) = @args;

  return $self;
}

sub is_pythagorean {
  my $self = shift;
  return $self->{a}**2 + $self->{b}**2 == $self->{c}**2;
}

sub sum {
  my $self = shift;
  return $self->{a} + $self->{b} + $self->{c};
}

sub product {
  my $self = shift;

  if ( $self->is_pythagorean ) {
    return $self->{a} * $self->{b} * $self->{c};
  }
  return 0;
}

sub products {
  my $self = shift;

  my $min = $self->{min_factor} || 1;
  my $max = $self->{max_factor} || 1;
  my $sum = $self->{sum}        || 0;
  my @triplets;
  my @product_triplets;

  foreach my $i ( $min .. $max ) {
    my @pytha_triplets;
    foreach my $j ( $i .. $max ) {
      foreach my $k ( $j .. $max ) {
        my $temp_triplet = __PACKAGE__->new( $i, $j, $k );
        push @pytha_triplets, $temp_triplet if $temp_triplet->is_pythagorean;
      }
    }
    push @triplets, @pytha_triplets;
  }

  if ( $self->{sum} ) {
    foreach my $triplet (@triplets) {
      push @product_triplets, $triplet if $self->{sum} == $triplet->sum;
    }
  }
  else {
    @product_triplets = @triplets;
  }

  return [ map { $_->product } @product_triplets ];
}

1;
