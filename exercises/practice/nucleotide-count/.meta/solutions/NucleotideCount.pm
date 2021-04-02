package NucleotideCount;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<count_nucleotides>;

sub count_nucleotides {
  my ($strand) = @_;
  die 'Invalid nucleotide in strand' if $strand =~ /[^ACGT]/;
  my %count = qw(A 0 C 0 G 0 T 0);
  map { $count{$_}++ } split( //, $strand );
  return \%count;
}

1;
