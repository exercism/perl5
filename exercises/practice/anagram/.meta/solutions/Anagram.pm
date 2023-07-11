package Anagram;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub match_anagrams {
    my ( $subject, $candidates ) = @_;

    return [
        grep {
            lc $_ ne lc $subject
                && join( '', sort( split( //, lc $_ ) ) ) eq
                join( '', sort( split( //, lc $subject ) ) )
        } @{$candidates}
    ];
}

1;
