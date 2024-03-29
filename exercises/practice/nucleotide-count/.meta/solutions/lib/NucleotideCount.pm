package NucleotideCount;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<count_nucleotides>;

sub count_nucleotides ($strand) {
    die 'Invalid nucleotide in strand' if $strand =~ /[^ACGT]/;
    my %count = qw(A 0 C 0 G 0 T 0);
    for ( split //, $strand ) {
        $count{$_}++;
    }
    return \%count;
}

1;
