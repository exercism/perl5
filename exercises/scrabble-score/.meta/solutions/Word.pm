package Word;

use strict;
use warnings;
use List::Util 'first';

sub new {
  my ( $class, $word ) = @_;
  return bless { word => lc $word } => $class;
}

sub score {
  my ( $self, %extension ) = @_;
  my $score = 0;

  my %values = qw(
    aeioulnrst 1 dg 2 bcmp 3 fhvwy 4
    k 5 jx 8 qz 10
    ZERO 0
  );

  foreach my $c ( split '' => $self->{word} ) {
    $score += $values{ first {/$c/} keys %values or 'ZERO' };
  }

  $score *= ( 2**$extension{double} ) if $extension{double};
  $score *= ( 3**$extension{triple} ) if $extension{triple};

  return $score;
}

1;
