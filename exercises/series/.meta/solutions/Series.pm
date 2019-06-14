package Series;

use strict;
use warnings;

sub new {
  my $class = shift;
  bless { input => shift }, $class;
}

sub slice {
  my ( $self, $size ) = @_;
  my $input = $self->{input};

  die "ArgumentError" if $size > length $input;

  return [ map { [ split // ] } $input =~ m/(?=(.{$size}))/g ];
}

1;

