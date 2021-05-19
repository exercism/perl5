#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use SumOfMultiples qw<sum_of_multiples>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<sum_of_multiples> or bail_out;

for my $case (@test_cases) {
  is( sum_of_multiples( $case->{input} ),
    $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "no multiples within limit",
    "expected": 0,
    "input": {
      "factors": [
        3,
        5
      ],
      "limit": 1
    },
    "property": "sum"
  },
  {
    "description": "one factor has multiples within limit",
    "expected": 3,
    "input": {
      "factors": [
        3,
        5
      ],
      "limit": 4
    },
    "property": "sum"
  },
  {
    "description": "more than one multiple within limit",
    "expected": 9,
    "input": {
      "factors": [
        3
      ],
      "limit": 7
    },
    "property": "sum"
  },
  {
    "description": "more than one factor with multiples within limit",
    "expected": 23,
    "input": {
      "factors": [
        3,
        5
      ],
      "limit": 10
    },
    "property": "sum"
  },
  {
    "description": "each multiple is only counted once",
    "expected": 2318,
    "input": {
      "factors": [
        3,
        5
      ],
      "limit": 100
    },
    "property": "sum"
  },
  {
    "description": "a much larger limit",
    "expected": 233168,
    "input": {
      "factors": [
        3,
        5
      ],
      "limit": 1000
    },
    "property": "sum"
  },
  {
    "description": "three factors",
    "expected": 51,
    "input": {
      "factors": [
        7,
        13,
        17
      ],
      "limit": 20
    },
    "property": "sum"
  },
  {
    "description": "factors not relatively prime",
    "expected": 30,
    "input": {
      "factors": [
        4,
        6
      ],
      "limit": 15
    },
    "property": "sum"
  },
  {
    "description": "some pairs of factors relatively prime and some not",
    "expected": 4419,
    "input": {
      "factors": [
        5,
        6,
        8
      ],
      "limit": 150
    },
    "property": "sum"
  },
  {
    "description": "one factor is a multiple of another",
    "expected": 275,
    "input": {
      "factors": [
        5,
        25
      ],
      "limit": 51
    },
    "property": "sum"
  },
  {
    "description": "much larger factors",
    "expected": 2203160,
    "input": {
      "factors": [
        43,
        47
      ],
      "limit": 10000
    },
    "property": "sum"
  },
  {
    "description": "all numbers are multiples of 1",
    "expected": 4950,
    "input": {
      "factors": [
        1
      ],
      "limit": 100
    },
    "property": "sum"
  },
  {
    "description": "no factors means an empty sum",
    "expected": 0,
    "input": {
      "factors": [],
      "limit": 10000
    },
    "property": "sum"
  },
  {
    "description": "the only multiple of 0 is 0",
    "expected": 0,
    "input": {
      "factors": [
        0
      ],
      "limit": 1
    },
    "property": "sum"
  },
  {
    "description": "the factor 0 does not affect the sum of multiples of other factors",
    "expected": 3,
    "input": {
      "factors": [
        3,
        0
      ],
      "limit": 4
    },
    "property": "sum"
  },
  {
    "description": "solutions using include-exclude must extend to cardinality greater than 3",
    "expected": 39614537,
    "input": {
      "factors": [
        2,
        3,
        5,
        7,
        11
      ],
      "limit": 10000
    },
    "property": "sum"
  }
]
