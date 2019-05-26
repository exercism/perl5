package Crypto;

use strict;
use warnings;
use POSIX qw(fmod ceil);

sub new {
  my ( $class, $plaintext ) = @_;
  return bless { plaintext => $plaintext } => $class;
}

sub normalize_plaintext {
  my $self       = shift;
  my $normalized = lc $self->{plaintext};
  $normalized =~ s/[^0-9a-zA-Z]//g;

  return $normalized;
}

sub size {
  my $self = shift;
  my $size
    = @_ > 0
    ? sqrt( length $_[0] )
    : sqrt( length $self->normalize_plaintext );

  return int($size) if fmod( $size, 1 ) == 0;
  return ceil($size);
}

sub normalize_ciphertext {
  my $self = shift;
  join ' ', $self->_columns;
}

sub ciphertext {
  my $self = shift;
  join '', $self->_columns;
}

sub plaintext_segments {
  my $self = shift;
  return $self->_segmentize( $self->normalize_plaintext,
    $self->size );
}

sub _segmentize {
  my ( $self, $to_segment, $size ) = @_;
  [ grep {$_} split /(.{$size})/, $to_segment ];
}

sub _columns {
  my $self               = shift;
  my $plaintext_segments = $self->plaintext_segments;
  my @columns;

  foreach my $index ( 0 .. @$plaintext_segments ) {
    my $column;
    foreach my $seg (@$plaintext_segments) {
      $column .= substr $seg, $index, 1 if $index < length $seg;
    }
    push @columns, $column if $column;
  }
  @columns;
}

__PACKAGE__;
