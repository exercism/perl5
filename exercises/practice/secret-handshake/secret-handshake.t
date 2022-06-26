#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use SecretHandshake qw<handshake>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<handshake> or bail_out;

for my $case (@test_cases) {
    is( handshake( $case->{input}{number} ),
        $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "wink for 1",
    "expected": [
      "wink"
    ],
    "input": {
      "number": 1
    },
    "property": "commands"
  },
  {
    "description": "double blink for 10",
    "expected": [
      "double blink"
    ],
    "input": {
      "number": 2
    },
    "property": "commands"
  },
  {
    "description": "close your eyes for 100",
    "expected": [
      "close your eyes"
    ],
    "input": {
      "number": 4
    },
    "property": "commands"
  },
  {
    "description": "jump for 1000",
    "expected": [
      "jump"
    ],
    "input": {
      "number": 8
    },
    "property": "commands"
  },
  {
    "description": "combine two actions",
    "expected": [
      "wink",
      "double blink"
    ],
    "input": {
      "number": 3
    },
    "property": "commands"
  },
  {
    "description": "reverse two actions",
    "expected": [
      "double blink",
      "wink"
    ],
    "input": {
      "number": 19
    },
    "property": "commands"
  },
  {
    "description": "reversing one action gives the same action",
    "expected": [
      "jump"
    ],
    "input": {
      "number": 24
    },
    "property": "commands"
  },
  {
    "description": "reversing no actions still gives no actions",
    "expected": [],
    "input": {
      "number": 16
    },
    "property": "commands"
  },
  {
    "description": "all possible actions",
    "expected": [
      "wink",
      "double blink",
      "close your eyes",
      "jump"
    ],
    "input": {
      "number": 15
    },
    "property": "commands"
  },
  {
    "description": "reverse all possible actions",
    "expected": [
      "jump",
      "close your eyes",
      "double blink",
      "wink"
    ],
    "input": {
      "number": 31
    },
    "property": "commands"
  },
  {
    "description": "do nothing for zero",
    "expected": [],
    "input": {
      "number": 0
    },
    "property": "commands"
  }
]
