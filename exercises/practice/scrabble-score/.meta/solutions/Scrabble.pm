package Scrabble;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<scrabble_score>;

sub scrabble_score ($word) {
    my $sum = 0;
    for ( split //, lc($word) ) {
        if (/[aeioulnrst]/) { $sum += 1 }
        if (/[dg]/)         { $sum += 2 }
        if (/[bcmp]/)       { $sum += 3 }
        if (/[fhvwy]/)      { $sum += 4 }
        if (/[k]/)          { $sum += 5 }
        if (/[jx]/)         { $sum += 8 }
        if (/[qz]/)         { $sum += 10 }
    }
    return $sum;
}

1;
