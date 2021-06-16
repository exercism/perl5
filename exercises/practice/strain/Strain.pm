package Strain;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<keep discard>;

sub keep {
  my ( $input, $function ) = @_;
  return undef;
}

sub discard {
  my ( $input, $function ) = @_;
  return undef;
}

1;
