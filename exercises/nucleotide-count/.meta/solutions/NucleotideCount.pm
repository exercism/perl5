package NucleotideCount;

use strict;
use warnings;

use Carp 'croak';

our @_NUCLEOTIDES = qw(G C A T);
our $_VALIDATION = qr/^[@_NUCLEOTIDES]*$/;

sub new {
  my ($class, $sequence) = @_;

  croak 'Invalid DNA sequence' unless $sequence =~ $_VALIDATION;

  bless { sequence => $sequence }, $class;
}

sub count {
  my ($self, $nucleotide) = @_;

  croak 'Invalid nucleotide' unless $nucleotide =~ $_VALIDATION and length $nucleotide == 1;

  unless (exists $self->{$nucleotide}) {
    # there is probably a cleaner way to do this
    my @matches = ($self->{sequence} =~ /$nucleotide/g);
    $self->{$nucleotide} = @matches;
  }

  $self->{$nucleotide} ||= $self->{sequence} =~ tr/$nucleotide//d;
}

sub nucleotide_counts {
  my ($self) = @_;

  my $counts = {};
  $counts->{$_} = $self->count($_) for @_NUCLEOTIDES;
  return $counts;
}

1;
