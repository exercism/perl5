#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Accumulate qw<accumulate>;
use experimental qw<signatures>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 6;

imported_ok qw<accumulate> or bail_out;

for my $case (@test_cases) {
  my $func = sub {die};
  for ( $case->{input}{accumulator} ) {
    if ( $_ eq '(x) => x * x' ) {
      $func = sub ($x) { $x * $x };
    }
    elsif ( $_ eq '(x) => upcase(x)' ) {
      $func = sub ($x) { uc $x };
    }
    elsif ( $_ eq '(x) => reverse(x)' ) {
      $func = sub ($x) { scalar reverse $x };
    }
    elsif (
      $_ eq '(x) => accumulate(["1", "2", "3"], (y) => x + y))' )
    {
      $func = sub ($x) {
        accumulate( [ 1 .. 3 ], sub ($y) { $x . $y } );
      };
    }
  }

  is( accumulate( $case->{input}{list}, $func ),
    $case->{expected}, $case->{description} );
}

__DATA__
[
  {
    "description": "accumulate empty",
    "expected": [],
    "input": {
      "accumulator": "(x) => x * x",
      "list": []
    },
    "property": "accumulate"
  },
  {
    "description": "accumulate squares",
    "expected": [
      1,
      4,
      9
    ],
    "input": {
      "accumulator": "(x) => x * x",
      "list": [
        1,
        2,
        3
      ]
    },
    "property": "accumulate"
  },
  {
    "description": "accumulate upcases",
    "expected": [
      "HELLO",
      "WORLD"
    ],
    "input": {
      "accumulator": "(x) => upcase(x)",
      "list": [
        "Hello",
        "world"
      ]
    },
    "property": "accumulate"
  },
  {
    "description": "accumulate reversed strings",
    "expected": [
      "eht",
      "kciuq",
      "nworb",
      "xof",
      "cte"
    ],
    "input": {
      "accumulator": "(x) => reverse(x)",
      "list": [
        "the",
        "quick",
        "brown",
        "fox",
        "etc"
      ]
    },
    "property": "accumulate"
  },
  {
    "description": "accumulate recursively",
    "expected": [
      [
        "a1",
        "a2",
        "a3"
      ],
      [
        "b1",
        "b2",
        "b3"
      ],
      [
        "c1",
        "c2",
        "c3"
      ]
    ],
    "input": {
      "accumulator": "(x) => accumulate([\"1\", \"2\", \"3\"], (y) => x + y))",
      "list": [
        "a",
        "b",
        "c"
      ]
    },
    "property": "accumulate"
  }
]
