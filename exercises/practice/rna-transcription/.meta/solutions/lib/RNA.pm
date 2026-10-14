package RNA;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<to_rna>;

sub to_rna ($dna) { $dna =~ tr/CGTA/GCAU/r }

1;
