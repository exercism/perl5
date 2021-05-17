#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PascalsTriangle qw<pascal_rows>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 9;

imported_ok qw<pascal_rows> or bail_out;

for my $case (@test_cases) {
  is pascal_rows( $case->{input}{count} ),
    join( "\n", map { join ' ', @$_ } @{ $case->{expected} } ),
    $case->{description};
}

__DATA__
[
  {
    "description": "zero rows",
    "expected": [],
    "input": {
      "count": 0
    },
    "property": "rows"
  },
  {
    "description": "single row",
    "expected": [
      [
        1
      ]
    ],
    "input": {
      "count": 1
    },
    "property": "rows"
  },
  {
    "description": "two rows",
    "expected": [
      [
        1
      ],
      [
        1,
        1
      ]
    ],
    "input": {
      "count": 2
    },
    "property": "rows"
  },
  {
    "description": "three rows",
    "expected": [
      [
        1
      ],
      [
        1,
        1
      ],
      [
        1,
        2,
        1
      ]
    ],
    "input": {
      "count": 3
    },
    "property": "rows"
  },
  {
    "description": "four rows",
    "expected": [
      [
        1
      ],
      [
        1,
        1
      ],
      [
        1,
        2,
        1
      ],
      [
        1,
        3,
        3,
        1
      ]
    ],
    "input": {
      "count": 4
    },
    "property": "rows"
  },
  {
    "description": "five rows",
    "expected": [
      [
        1
      ],
      [
        1,
        1
      ],
      [
        1,
        2,
        1
      ],
      [
        1,
        3,
        3,
        1
      ],
      [
        1,
        4,
        6,
        4,
        1
      ]
    ],
    "input": {
      "count": 5
    },
    "property": "rows"
  },
  {
    "description": "six rows",
    "expected": [
      [
        1
      ],
      [
        1,
        1
      ],
      [
        1,
        2,
        1
      ],
      [
        1,
        3,
        3,
        1
      ],
      [
        1,
        4,
        6,
        4,
        1
      ],
      [
        1,
        5,
        10,
        10,
        5,
        1
      ]
    ],
    "input": {
      "count": 6
    },
    "property": "rows"
  },
  {
    "description": "ten rows",
    "expected": [
      [
        1
      ],
      [
        1,
        1
      ],
      [
        1,
        2,
        1
      ],
      [
        1,
        3,
        3,
        1
      ],
      [
        1,
        4,
        6,
        4,
        1
      ],
      [
        1,
        5,
        10,
        10,
        5,
        1
      ],
      [
        1,
        6,
        15,
        20,
        15,
        6,
        1
      ],
      [
        1,
        7,
        21,
        35,
        35,
        21,
        7,
        1
      ],
      [
        1,
        8,
        28,
        56,
        70,
        56,
        28,
        8,
        1
      ],
      [
        1,
        9,
        36,
        84,
        126,
        126,
        84,
        36,
        9,
        1
      ]
    ],
    "input": {
      "count": 10
    },
    "property": "rows"
  }
]
