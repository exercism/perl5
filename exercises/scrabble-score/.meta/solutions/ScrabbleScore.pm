package ScrabbleScore;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(score);

use List::Util qw(sum0 pairmap);

my $scores = {
  pairmap {
    map { $_ => $a } split //, $b
  }
  qw(
    1 aeioulnrst
    2 dg
    3 bcmp
    4 fhvwy
    5 k
    8 jx
    10 qz
    )
};

sub score {
  my ( $word, %extensions ) = @_;
  my $double = $extensions{double} // 0;
  my $triple = $extensions{triple} // 0;
  return sum0 map { $scores->{$_} * 2**$double * 3**$triple } split //, lc $word;
}

1;
