package RNA;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<to_rna>;

sub to_rna { shift =~ tr/CGTA/GCAU/r }

1;
