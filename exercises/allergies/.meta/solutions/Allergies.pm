package Allergies;

use strict;
use warnings;

use List::Util 'first';

my @allergens = qw(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats);

sub new {
  my ( $class, $score ) = @_;
  my $self = bless {} => $class;
  $self->{score} = reverse sprintf "%08b", $score;

  return $self;
}

sub allergic_to {
  my ( $self, $allergen ) = @_;

  my $index = first { $allergens[$_] eq $allergen } 0 .. $#allergens;

  return substr $self->{score}, $index, 1;
}

sub list {
  [ grep { $_[0]->allergic_to($_) } @allergens ]
}

__PACKAGE__;

