package GradeSchool;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<roster>;

sub roster {
  my ( $students, $grade ) = @_;
  my %roster;
  map { push @{ $roster{ $_->[1] } }, $_->[0] } @{$students};
  for ( keys %roster ) {
    $roster{$_} = [ sort { $a cmp $b } @{ $roster{$_} } ];
  }
  if ($grade) {
    return $roster{$grade} || [];
  }
  return [ map {@$_} @roster{ sort { $a <=> $b } keys %roster } ];
}

1;
