#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Raindrops qw<raindrop>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 19;

imported_ok qw<raindrop> or bail_out;

for my $case (@test_cases) {
  is raindrop( $case->{input}{number} ), $case->{expected},
    $case->{description};
}

__DATA__
[
  {
    "description": "the sound for 1 is 1",
    "expected": "1",
    "input": {
      "number": 1
    },
    "property": "convert"
  },
  {
    "description": "the sound for 3 is Pling",
    "expected": "Pling",
    "input": {
      "number": 3
    },
    "property": "convert"
  },
  {
    "description": "the sound for 5 is Plang",
    "expected": "Plang",
    "input": {
      "number": 5
    },
    "property": "convert"
  },
  {
    "description": "the sound for 7 is Plong",
    "expected": "Plong",
    "input": {
      "number": 7
    },
    "property": "convert"
  },
  {
    "description": "the sound for 6 is Pling as it has a factor 3",
    "expected": "Pling",
    "input": {
      "number": 6
    },
    "property": "convert"
  },
  {
    "description": "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base",
    "expected": "8",
    "input": {
      "number": 8
    },
    "property": "convert"
  },
  {
    "description": "the sound for 9 is Pling as it has a factor 3",
    "expected": "Pling",
    "input": {
      "number": 9
    },
    "property": "convert"
  },
  {
    "description": "the sound for 10 is Plang as it has a factor 5",
    "expected": "Plang",
    "input": {
      "number": 10
    },
    "property": "convert"
  },
  {
    "description": "the sound for 14 is Plong as it has a factor of 7",
    "expected": "Plong",
    "input": {
      "number": 14
    },
    "property": "convert"
  },
  {
    "description": "the sound for 15 is PlingPlang as it has factors 3 and 5",
    "expected": "PlingPlang",
    "input": {
      "number": 15
    },
    "property": "convert"
  },
  {
    "description": "the sound for 21 is PlingPlong as it has factors 3 and 7",
    "expected": "PlingPlong",
    "input": {
      "number": 21
    },
    "property": "convert"
  },
  {
    "description": "the sound for 25 is Plang as it has a factor 5",
    "expected": "Plang",
    "input": {
      "number": 25
    },
    "property": "convert"
  },
  {
    "description": "the sound for 27 is Pling as it has a factor 3",
    "expected": "Pling",
    "input": {
      "number": 27
    },
    "property": "convert"
  },
  {
    "description": "the sound for 35 is PlangPlong as it has factors 5 and 7",
    "expected": "PlangPlong",
    "input": {
      "number": 35
    },
    "property": "convert"
  },
  {
    "description": "the sound for 49 is Plong as it has a factor 7",
    "expected": "Plong",
    "input": {
      "number": 49
    },
    "property": "convert"
  },
  {
    "description": "the sound for 52 is 52",
    "expected": "52",
    "input": {
      "number": 52
    },
    "property": "convert"
  },
  {
    "description": "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7",
    "expected": "PlingPlangPlong",
    "input": {
      "number": 105
    },
    "property": "convert"
  },
  {
    "description": "the sound for 3125 is Plang as it has a factor 5",
    "expected": "Plang",
    "input": {
      "number": 3125
    },
    "property": "convert"
  }
]
