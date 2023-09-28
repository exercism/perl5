package RNA;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<to_rna>;

sub to_rna ($dna) { $dna =~ tr/CGTA/GCAU/r }

1;
