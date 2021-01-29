package DNA;

use strict;
use warnings;

sub new {
  my ( $class, $strand ) = @_;
  my $self = bless {} => $class;
  $self->{strand} = $strand;
  $self->{len}    = length $strand;
  return $self;
}

sub hamming_distance {
  my ( $self, $strand ) = @_;
  my $distance;

  my $len = length $strand;
  $len = $self->{len} if $len > $self->{len};

  my @orig = split // => $self->{strand};
  my @inp  = split // => $strand;

  foreach my $index ( 0 .. $len - 1 ) {
    $distance++ if $orig[$index] ne $inp[$index];
  }

  return $distance || 0;
}

__PACKAGE__;
