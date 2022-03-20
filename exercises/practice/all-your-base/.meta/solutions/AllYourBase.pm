package AllYourBase;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

my @errors = (
  'input base must be >= 2',
  'output base must be >= 2',
  'all digits must satisfy 0 <= d < input base',
);

sub rebase {
  my ($input) = @_;

  if ( $input->{inputBase} < 2 ) {
    die $errors[0];
  }
  if ( $input->{outputBase} < 2 ) {
    die $errors[1];
  }
  for my $digit ( @{ $input->{digits} } ) {
    if ( $digit < 0 || $digit >= $input->{inputBase} ) {
      die $errors[2];
    }
  }

  return from_decimal( $input->{outputBase},
    to_decimal( $input->{inputBase}, $input->{digits} ) );
}

sub to_decimal {
  my ( $base, $digits ) = @_;
  my $elems = @{$digits};
  for ( @{$digits} ) {
    if ( $_ == 0 ) {
      $elems--;
    }
    else {
      last;
    }
  }

  my $sum = 0;
  for ( my $i = 0; $i < $elems; $i++ ) {
    $sum += $digits->[ -$i - 1 ] * $base**$i;
  }

  return $sum;
}

sub from_decimal {
  my ( $base, $number ) = @_;
  my @digits;
  while ( $number >= $base ) {
    unshift @digits, $number % $base;
    $number = int( $number / $base );
  }
  unshift @digits, $number;
  return [@digits];
}

1;
