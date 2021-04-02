#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use RomanNumerals qw<to_roman>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 20;

imported_ok qw<to_roman> or bail_out;

for my $case (@test_cases) {
  is to_roman( $case->{input}{number} ), $case->{expected},
    $case->{description};
}

__DATA__
[
  {
    "description": "1 is I",
    "expected": "I",
    "input": {
      "number": 1
    },
    "property": "roman"
  },
  {
    "description": "2 is II",
    "expected": "II",
    "input": {
      "number": 2
    },
    "property": "roman"
  },
  {
    "description": "3 is III",
    "expected": "III",
    "input": {
      "number": 3
    },
    "property": "roman"
  },
  {
    "description": "4 is IV",
    "expected": "IV",
    "input": {
      "number": 4
    },
    "property": "roman"
  },
  {
    "description": "5 is V",
    "expected": "V",
    "input": {
      "number": 5
    },
    "property": "roman"
  },
  {
    "description": "6 is VI",
    "expected": "VI",
    "input": {
      "number": 6
    },
    "property": "roman"
  },
  {
    "description": "9 is IX",
    "expected": "IX",
    "input": {
      "number": 9
    },
    "property": "roman"
  },
  {
    "description": "27 is XXVII",
    "expected": "XXVII",
    "input": {
      "number": 27
    },
    "property": "roman"
  },
  {
    "description": "48 is XLVIII",
    "expected": "XLVIII",
    "input": {
      "number": 48
    },
    "property": "roman"
  },
  {
    "description": "49 is XLIX",
    "expected": "XLIX",
    "input": {
      "number": 49
    },
    "property": "roman"
  },
  {
    "description": "59 is LIX",
    "expected": "LIX",
    "input": {
      "number": 59
    },
    "property": "roman"
  },
  {
    "description": "93 is XCIII",
    "expected": "XCIII",
    "input": {
      "number": 93
    },
    "property": "roman"
  },
  {
    "description": "141 is CXLI",
    "expected": "CXLI",
    "input": {
      "number": 141
    },
    "property": "roman"
  },
  {
    "description": "163 is CLXIII",
    "expected": "CLXIII",
    "input": {
      "number": 163
    },
    "property": "roman"
  },
  {
    "description": "402 is CDII",
    "expected": "CDII",
    "input": {
      "number": 402
    },
    "property": "roman"
  },
  {
    "description": "575 is DLXXV",
    "expected": "DLXXV",
    "input": {
      "number": 575
    },
    "property": "roman"
  },
  {
    "description": "911 is CMXI",
    "expected": "CMXI",
    "input": {
      "number": 911
    },
    "property": "roman"
  },
  {
    "description": "1024 is MXXIV",
    "expected": "MXXIV",
    "input": {
      "number": 1024
    },
    "property": "roman"
  },
  {
    "description": "3000 is MMM",
    "expected": "MMM",
    "input": {
      "number": 3000
    },
    "property": "roman"
  }
]
