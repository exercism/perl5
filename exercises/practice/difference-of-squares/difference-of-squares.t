#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use DifferenceOfSquares
  qw<square_of_sum sum_of_squares difference_of_squares>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<square_of_sum sum_of_squares difference_of_squares>
  or bail_out;

for my $case (@test_cases) {
  my $func;
  if ( $case->{property} eq 'squareOfSum' ) {
    $func = \&square_of_sum;
  }
  elsif ( $case->{property} eq 'sumOfSquares' ) {
    $func = \&sum_of_squares;
  }
  elsif ( $case->{property} eq 'differenceOfSquares' ) {
    $func = \&difference_of_squares;
  }

  is( $func->( $case->{input}{number} ),
    $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "Square the sum of the numbers up to the given number: square of sum 1",
    "expected": 1,
    "input": {
      "number": 1
    },
    "property": "squareOfSum"
  },
  {
    "description": "Square the sum of the numbers up to the given number: square of sum 5",
    "expected": 225,
    "input": {
      "number": 5
    },
    "property": "squareOfSum"
  },
  {
    "description": "Square the sum of the numbers up to the given number: square of sum 100",
    "expected": 25502500,
    "input": {
      "number": 100
    },
    "property": "squareOfSum"
  },
  {
    "description": "Sum the squares of the numbers up to the given number: sum of squares 1",
    "expected": 1,
    "input": {
      "number": 1
    },
    "property": "sumOfSquares"
  },
  {
    "description": "Sum the squares of the numbers up to the given number: sum of squares 5",
    "expected": 55,
    "input": {
      "number": 5
    },
    "property": "sumOfSquares"
  },
  {
    "description": "Sum the squares of the numbers up to the given number: sum of squares 100",
    "expected": 338350,
    "input": {
      "number": 100
    },
    "property": "sumOfSquares"
  },
  {
    "description": "Subtract sum of squares from square of sums: difference of squares 1",
    "expected": 0,
    "input": {
      "number": 1
    },
    "property": "differenceOfSquares"
  },
  {
    "description": "Subtract sum of squares from square of sums: difference of squares 5",
    "expected": 170,
    "input": {
      "number": 5
    },
    "property": "differenceOfSquares"
  },
  {
    "description": "Subtract sum of squares from square of sums: difference of squares 100",
    "expected": 25164150,
    "input": {
      "number": 100
    },
    "property": "differenceOfSquares"
  }
]
