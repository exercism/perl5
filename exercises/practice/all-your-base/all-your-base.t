#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use AllYourBase qw<rebase>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<rebase> or bail_out;

for my $case (@test_cases) {
    if ( ref $case->{expected} ne 'HASH' ) {
        is( rebase( $case->{input} ),
            $case->{expected}, $case->{description}, );
    }
    else {
        like dies( sub { rebase( $case->{input} ) } ),
            qr/$case->{expected}{error}/, $case->{description};
    }
}

done_testing;

__DATA__
[
  {
    "description": "single bit one to decimal",
    "expected": [
      1
    ],
    "input": {
      "digits": [
        1
      ],
      "inputBase": 2,
      "outputBase": 10
    },
    "property": "rebase"
  },
  {
    "description": "binary to single decimal",
    "expected": [
      5
    ],
    "input": {
      "digits": [
        1,
        0,
        1
      ],
      "inputBase": 2,
      "outputBase": 10
    },
    "property": "rebase"
  },
  {
    "description": "single decimal to binary",
    "expected": [
      1,
      0,
      1
    ],
    "input": {
      "digits": [
        5
      ],
      "inputBase": 10,
      "outputBase": 2
    },
    "property": "rebase"
  },
  {
    "description": "binary to multiple decimal",
    "expected": [
      4,
      2
    ],
    "input": {
      "digits": [
        1,
        0,
        1,
        0,
        1,
        0
      ],
      "inputBase": 2,
      "outputBase": 10
    },
    "property": "rebase"
  },
  {
    "description": "decimal to binary",
    "expected": [
      1,
      0,
      1,
      0,
      1,
      0
    ],
    "input": {
      "digits": [
        4,
        2
      ],
      "inputBase": 10,
      "outputBase": 2
    },
    "property": "rebase"
  },
  {
    "description": "trinary to hexadecimal",
    "expected": [
      2,
      10
    ],
    "input": {
      "digits": [
        1,
        1,
        2,
        0
      ],
      "inputBase": 3,
      "outputBase": 16
    },
    "property": "rebase"
  },
  {
    "description": "hexadecimal to trinary",
    "expected": [
      1,
      1,
      2,
      0
    ],
    "input": {
      "digits": [
        2,
        10
      ],
      "inputBase": 16,
      "outputBase": 3
    },
    "property": "rebase"
  },
  {
    "description": "15-bit integer",
    "expected": [
      6,
      10,
      45
    ],
    "input": {
      "digits": [
        3,
        46,
        60
      ],
      "inputBase": 97,
      "outputBase": 73
    },
    "property": "rebase"
  },
  {
    "description": "empty list",
    "expected": [
      0
    ],
    "input": {
      "digits": [],
      "inputBase": 2,
      "outputBase": 10
    },
    "property": "rebase"
  },
  {
    "description": "single zero",
    "expected": [
      0
    ],
    "input": {
      "digits": [
        0
      ],
      "inputBase": 10,
      "outputBase": 2
    },
    "property": "rebase"
  },
  {
    "description": "multiple zeros",
    "expected": [
      0
    ],
    "input": {
      "digits": [
        0,
        0,
        0
      ],
      "inputBase": 10,
      "outputBase": 2
    },
    "property": "rebase"
  },
  {
    "description": "leading zeros",
    "expected": [
      4,
      2
    ],
    "input": {
      "digits": [
        0,
        6,
        0
      ],
      "inputBase": 7,
      "outputBase": 10
    },
    "property": "rebase"
  },
  {
    "description": "input base is one",
    "expected": {
      "error": "input base must be >= 2"
    },
    "input": {
      "digits": [
        0
      ],
      "inputBase": 1,
      "outputBase": 10
    },
    "property": "rebase"
  },
  {
    "description": "input base is zero",
    "expected": {
      "error": "input base must be >= 2"
    },
    "input": {
      "digits": [],
      "inputBase": 0,
      "outputBase": 10
    },
    "property": "rebase"
  },
  {
    "description": "input base is negative",
    "expected": {
      "error": "input base must be >= 2"
    },
    "input": {
      "digits": [
        1
      ],
      "inputBase": -2,
      "outputBase": 10
    },
    "property": "rebase"
  },
  {
    "description": "negative digit",
    "expected": {
      "error": "all digits must satisfy 0 <= d < input base"
    },
    "input": {
      "digits": [
        1,
        -1,
        1,
        0,
        1,
        0
      ],
      "inputBase": 2,
      "outputBase": 10
    },
    "property": "rebase"
  },
  {
    "description": "invalid positive digit",
    "expected": {
      "error": "all digits must satisfy 0 <= d < input base"
    },
    "input": {
      "digits": [
        1,
        2,
        1,
        0,
        1,
        0
      ],
      "inputBase": 2,
      "outputBase": 10
    },
    "property": "rebase"
  },
  {
    "description": "output base is one",
    "expected": {
      "error": "output base must be >= 2"
    },
    "input": {
      "digits": [
        1,
        0,
        1,
        0,
        1,
        0
      ],
      "inputBase": 2,
      "outputBase": 1
    },
    "property": "rebase"
  },
  {
    "description": "output base is zero",
    "expected": {
      "error": "output base must be >= 2"
    },
    "input": {
      "digits": [
        7
      ],
      "inputBase": 10,
      "outputBase": 0
    },
    "property": "rebase"
  },
  {
    "description": "output base is negative",
    "expected": {
      "error": "output base must be >= 2"
    },
    "input": {
      "digits": [
        1
      ],
      "inputBase": 2,
      "outputBase": -7
    },
    "property": "rebase"
  },
  {
    "description": "both bases are negative",
    "expected": {
      "error": "input base must be >= 2"
    },
    "input": {
      "digits": [
        1
      ],
      "inputBase": -2,
      "outputBase": -7
    },
    "property": "rebase"
  }
]
