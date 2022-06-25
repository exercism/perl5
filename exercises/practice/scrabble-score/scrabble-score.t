#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use ScrabbleScore qw<scrabble_score>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<scrabble_score> or bail_out;

for my $case (@test_cases) {
    is( scrabble_score( $case->{input}{word} ),
        $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "lowercase letter",
    "expected": 1,
    "input": {
      "word": "a"
    },
    "property": "score"
  },
  {
    "description": "uppercase letter",
    "expected": 1,
    "input": {
      "word": "A"
    },
    "property": "score"
  },
  {
    "description": "valuable letter",
    "expected": 4,
    "input": {
      "word": "f"
    },
    "property": "score"
  },
  {
    "description": "short word",
    "expected": 2,
    "input": {
      "word": "at"
    },
    "property": "score"
  },
  {
    "description": "short, valuable word",
    "expected": 12,
    "input": {
      "word": "zoo"
    },
    "property": "score"
  },
  {
    "description": "medium word",
    "expected": 6,
    "input": {
      "word": "street"
    },
    "property": "score"
  },
  {
    "description": "medium, valuable word",
    "expected": 22,
    "input": {
      "word": "quirky"
    },
    "property": "score"
  },
  {
    "description": "long, mixed-case word",
    "expected": 41,
    "input": {
      "word": "OxyphenButazone"
    },
    "property": "score"
  },
  {
    "description": "english-like word",
    "expected": 8,
    "input": {
      "word": "pinata"
    },
    "property": "score"
  },
  {
    "description": "empty input",
    "expected": 0,
    "input": {
      "word": ""
    },
    "property": "score"
  },
  {
    "description": "entire alphabet available",
    "expected": 87,
    "input": {
      "word": "abcdefghijklmnopqrstuvwxyz"
    },
    "property": "score"
  }
]
