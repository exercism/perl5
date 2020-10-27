package Allergies;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<allergic_to list_allergies>;

use constant ALLERGENS => {
  eggs         => 1,
  peanuts      => 2,
  shellfish    => 4,
  strawberries => 8,
  tomatoes     => 16,
  chocolate    => 32,
  pollen       => 64,
  cats         => 128,
};

sub allergic_to {
  my ($input) = @_;
  ALLERGENS->{ $input->{item} } & $input->{score};
}

sub list_allergies {
  my ($score) = @_;
  return [
    grep { allergic_to { item => $_, score => $score } }
      keys %{ +ALLERGENS }
  ];
}

1;
