#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use ScrabbleScore qw(score);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 12;

imported_ok qw(score) or bail_out;

for my $case ( @{ $C_DATA->{cases} } ) {
  is score( $case->{input}{word} ), $case->{expected},
    $case->{description};
}

__DATA__
{
  "exercise": "scrabble-score",
  "version": "1.1.0",
  "cases": [
    {
      "description": "lowercase letter",
      "property": "score",
      "input": {
        "word": "a"
      },
      "expected": 1
    },
    {
      "description": "uppercase letter",
      "property": "score",
      "input": {
        "word": "A"
      },
      "expected": 1
    },
    {
      "description": "valuable letter",
      "property": "score",
      "input": {
        "word": "f"
      },
      "expected": 4
    },
    {
      "description": "short word",
      "property": "score",
      "input": {
        "word": "at"
      },
      "expected": 2
    },
    {
      "description": "short, valuable word",
      "property": "score",
      "input": {
        "word": "zoo"
      },
      "expected": 12
    },
    {
      "description": "medium word",
      "property": "score",
      "input": {
        "word": "street"
      },
      "expected": 6
    },
    {
      "description": "medium, valuable word",
      "property": "score",
      "input": {
        "word": "quirky"
      },
      "expected": 22
    },
    {
      "description": "long, mixed-case word",
      "property": "score",
      "input": {
        "word": "OxyphenButazone"
      },
      "expected": 41
    },
    {
      "description": "english-like word",
      "property": "score",
      "input": {
        "word": "pinata"
      },
      "expected": 8
    },
    {
      "description": "empty input",
      "property": "score",
      "input": {
        "word": ""
      },
      "expected": 0
    },
    {
      "description": "entire alphabet available",
      "property": "score",
      "input": {
        "word": "abcdefghijklmnopqrstuvwxyz"
      },
      "expected": 87
    }
  ]
}
