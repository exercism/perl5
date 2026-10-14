package Anagram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub match_anagrams ( $subject, $candidates ) {

    return [
        grep {
            lc $_ ne lc $subject
                && join( '', sort( split( //, lc $_ ) ) ) eq
                join( '', sort( split( //, lc $subject ) ) )
        } @{$candidates}
    ];
}

1;
