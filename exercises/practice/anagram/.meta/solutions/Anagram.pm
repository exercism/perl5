package Anagram;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub match_anagrams {
  my ($input) = @_;

  return [
    grep {
      lc $_ ne lc $input->{subject}
        && join( '', sort( split( //, lc $_ ) ) ) eq
        join( '', sort( split( //, lc $input->{subject} ) ) )
    } @{ $input->{candidates} }
  ];
}

1;
