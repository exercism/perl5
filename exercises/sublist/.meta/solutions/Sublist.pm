package Sublist;

use strict;
use warnings;

use List::Util qw(first);
use List::MoreUtils qw(pairwise all);

sub check_lists {
  my ( $l1, $l2 ) = @_;

  if ( is_equal( $l1, $l2 ) ) {
    return "equal";
  }
  if ( @$l1 == 0 ) {
    return "sublist";
  }
  if ( @$l2 == 0 ) {
    return "superlist";
  }
  if ( is_sublist( $l1, $l2 ) ) {
    return "sublist";
  }
  if ( is_sublist( $l2, $l1 ) ) {
    return "superlist";
  }

  return "unequal";
}

sub is_equal {
  my ( $l1, $l2 ) = @_;

  return unless @$l1 == @$l2;

  foreach my $i ( 0 .. @$l1 - 1 ) {
    return unless $l1->[$i] == $l2->[$i];
  }

  return 1;
}

sub is_sublist {
  my ( $l1, $l2 ) = @_;

  return if @$l1 > @$l2;

  my $idx = -1;
  while () {
    $idx = first { $l2->[$_] == $l1->[0] } $idx + 1 .. @$l2 - 1;
    return unless defined $idx;
    return if @$l1 > @$l2 - $idx;

    my @l2_rest = @{$l2}[ $idx .. $idx + @$l1 - 1 ];
    return 1
      if all { $_->[0] == $_->[1] } pairwise { [ $a, $b ] } @$l1,
      @l2_rest;
  }
}

1;

