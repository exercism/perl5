#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Triangle qw<is_equilateral is_isosceles is_scalene>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<is_equilateral is_isosceles is_scalene> or bail_out;

for my $case (@test_cases) {
  my $func;
  if ( $case->{property} eq 'equilateral' ) {
    $func = \&is_equilateral;
  }
  elsif ( $case->{property} eq 'isosceles' ) {
    $func = \&is_isosceles;
  }
  elsif ( $case->{property} eq 'scalene' ) {
    $func = \&is_scalene;
  }

  is(
    $func->( $case->{input}{sides} ),
    $case->{expected} ? T : DF,
    $case->{description},
  );
}

done_testing;

__DATA__
[
  {
    "description": "equilateral triangle: all sides are equal",
    "expected": true,
    "input": {
      "sides": [
        2,
        2,
        2
      ]
    },
    "property": "equilateral"
  },
  {
    "description": "equilateral triangle: any side is unequal",
    "expected": false,
    "input": {
      "sides": [
        2,
        3,
        2
      ]
    },
    "property": "equilateral"
  },
  {
    "description": "equilateral triangle: no sides are equal",
    "expected": false,
    "input": {
      "sides": [
        5,
        4,
        6
      ]
    },
    "property": "equilateral"
  },
  {
    "description": "equilateral triangle: all zero sides is not a triangle",
    "expected": false,
    "input": {
      "sides": [
        0,
        0,
        0
      ]
    },
    "property": "equilateral"
  },
  {
    "description": "equilateral triangle: sides may be floats",
    "expected": true,
    "input": {
      "sides": [
        0.5,
        0.5,
        0.5
      ]
    },
    "property": "equilateral"
  },
  {
    "description": "isosceles triangle: last two sides are equal",
    "expected": true,
    "input": {
      "sides": [
        3,
        4,
        4
      ]
    },
    "property": "isosceles"
  },
  {
    "description": "isosceles triangle: first two sides are equal",
    "expected": true,
    "input": {
      "sides": [
        4,
        4,
        3
      ]
    },
    "property": "isosceles"
  },
  {
    "description": "isosceles triangle: first and last sides are equal",
    "expected": true,
    "input": {
      "sides": [
        4,
        3,
        4
      ]
    },
    "property": "isosceles"
  },
  {
    "description": "isosceles triangle: equilateral triangles are also isosceles",
    "expected": true,
    "input": {
      "sides": [
        4,
        4,
        4
      ]
    },
    "property": "isosceles"
  },
  {
    "description": "isosceles triangle: no sides are equal",
    "expected": false,
    "input": {
      "sides": [
        2,
        3,
        4
      ]
    },
    "property": "isosceles"
  },
  {
    "description": "isosceles triangle: first triangle inequality violation",
    "expected": false,
    "input": {
      "sides": [
        1,
        1,
        3
      ]
    },
    "property": "isosceles"
  },
  {
    "description": "isosceles triangle: second triangle inequality violation",
    "expected": false,
    "input": {
      "sides": [
        1,
        3,
        1
      ]
    },
    "property": "isosceles"
  },
  {
    "description": "isosceles triangle: third triangle inequality violation",
    "expected": false,
    "input": {
      "sides": [
        3,
        1,
        1
      ]
    },
    "property": "isosceles"
  },
  {
    "description": "isosceles triangle: sides may be floats",
    "expected": true,
    "input": {
      "sides": [
        0.5,
        0.4,
        0.5
      ]
    },
    "property": "isosceles"
  },
  {
    "description": "scalene triangle: no sides are equal",
    "expected": true,
    "input": {
      "sides": [
        5,
        4,
        6
      ]
    },
    "property": "scalene"
  },
  {
    "description": "scalene triangle: all sides are equal",
    "expected": false,
    "input": {
      "sides": [
        4,
        4,
        4
      ]
    },
    "property": "scalene"
  },
  {
    "description": "scalene triangle: two sides are equal",
    "expected": false,
    "input": {
      "sides": [
        4,
        4,
        3
      ]
    },
    "property": "scalene"
  },
  {
    "description": "scalene triangle: may not violate triangle inequality",
    "expected": false,
    "input": {
      "sides": [
        7,
        3,
        2
      ]
    },
    "property": "scalene"
  },
  {
    "description": "scalene triangle: sides may be floats",
    "expected": true,
    "input": {
      "sides": [
        0.5,
        0.4,
        0.6
      ]
    },
    "property": "scalene"
  }
]
