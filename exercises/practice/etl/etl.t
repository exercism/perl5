#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use ETL qw<transform>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 5;

imported_ok qw<transform> or bail_out;

for my $case (@test_cases) {
  &is(
    transform( $case->{input}{legacy} ),
    @{$case}{qw<expected description>}
  );
}

__DATA__
[
  {
    "description": "single letter",
    "expected": {
      "a": 1
    },
    "input": {
      "legacy": {
        "1": [
          "A"
        ]
      }
    },
    "property": "transform"
  },
  {
    "description": "single score with multiple letters",
    "expected": {
      "a": 1,
      "e": 1,
      "i": 1,
      "o": 1,
      "u": 1
    },
    "input": {
      "legacy": {
        "1": [
          "A",
          "E",
          "I",
          "O",
          "U"
        ]
      }
    },
    "property": "transform"
  },
  {
    "description": "multiple scores with multiple letters",
    "expected": {
      "a": 1,
      "d": 2,
      "e": 1,
      "g": 2
    },
    "input": {
      "legacy": {
        "1": [
          "A",
          "E"
        ],
        "2": [
          "D",
          "G"
        ]
      }
    },
    "property": "transform"
  },
  {
    "description": "multiple scores with differing numbers of letters",
    "expected": {
      "a": 1,
      "b": 3,
      "c": 3,
      "d": 2,
      "e": 1,
      "f": 4,
      "g": 2,
      "h": 4,
      "i": 1,
      "j": 8,
      "k": 5,
      "l": 1,
      "m": 3,
      "n": 1,
      "o": 1,
      "p": 3,
      "q": 10,
      "r": 1,
      "s": 1,
      "t": 1,
      "u": 1,
      "v": 4,
      "w": 4,
      "x": 8,
      "y": 4,
      "z": 10
    },
    "input": {
      "legacy": {
        "1": [
          "A",
          "E",
          "I",
          "O",
          "U",
          "L",
          "N",
          "R",
          "S",
          "T"
        ],
        "10": [
          "Q",
          "Z"
        ],
        "2": [
          "D",
          "G"
        ],
        "3": [
          "B",
          "C",
          "M",
          "P"
        ],
        "4": [
          "F",
          "H",
          "V",
          "W",
          "Y"
        ],
        "5": [
          "K"
        ],
        "8": [
          "J",
          "X"
        ]
      }
    },
    "property": "transform"
  }
]
