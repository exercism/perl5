#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use RomanNumerals qw(to_roman);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 20;

imported_ok qw(to_roman) or bail_out;

for my $case ( @{ $C_DATA->{cases} } ) {
  is to_roman( $case->{input}{number} ), $case->{expected},
    $case->{description};
}

__DATA__
{
  "exercise": "roman-numerals",
  "version": "1.2.0",
  "cases": [
    {
      "description": "1 is a single I",
      "property": "roman",
      "input": {
        "number": 1
      },
      "expected": "I"
    },
    {
      "description": "2 is two I's",
      "property": "roman",
      "input": {
        "number": 2
      },
      "expected": "II"
    },
    {
      "description": "3 is three I's",
      "property": "roman",
      "input": {
        "number": 3
      },
      "expected": "III"
    },
    {
      "description": "4, being 5 - 1, is IV",
      "property": "roman",
      "input": {
        "number": 4
      },
      "expected": "IV"
    },
    {
      "description": "5 is a single V",
      "property": "roman",
      "input": {
        "number": 5
      },
      "expected": "V"
    },
    {
      "description": "6, being 5 + 1, is VI",
      "property": "roman",
      "input": {
        "number": 6
      },
      "expected": "VI"
    },
    {
      "description": "9, being 10 - 1, is IX",
      "property": "roman",
      "input": {
        "number": 9
      },
      "expected": "IX"
    },
    {
      "description": "20 is two X's",
      "property": "roman",
      "input": {
        "number": 27
      },
      "expected": "XXVII"
    },
    {
      "description": "48 is not 50 - 2 but rather 40 + 8",
      "property": "roman",
      "input": {
        "number": 48
      },
      "expected": "XLVIII"
    },
    {
      "description": "49 is not 40 + 5 + 4 but rather 50 - 10 + 10 - 1",
      "property": "roman",
      "input": {
        "number": 49
      },
      "expected": "XLIX"
    },
    {
      "description": "50 is a single L",
      "property": "roman",
      "input": {
        "number": 59
      },
      "expected": "LIX"
    },
    {
      "description": "90, being 100 - 10, is XC",
      "property": "roman",
      "input": {
        "number": 93
      },
      "expected": "XCIII"
    },
    {
      "description": "100 is a single C",
      "property": "roman",
      "input": {
        "number": 141
      },
      "expected": "CXLI"
    },
    {
      "description": "60, being 50 + 10, is LX",
      "property": "roman",
      "input": {
        "number": 163
      },
      "expected": "CLXIII"
    },
    {
      "description": "400, being 500 - 100, is CD",
      "property": "roman",
      "input": {
        "number": 402
      },
      "expected": "CDII"
    },
    {
      "description": "500 is a single D",
      "property": "roman",
      "input": {
        "number": 575
      },
      "expected": "DLXXV"
    },
    {
      "description": "900, being 1000 - 100, is CM",
      "property": "roman",
      "input": {
        "number": 911
      },
      "expected": "CMXI"
    },
    {
      "description": "1000 is a single M",
      "property": "roman",
      "input": {
        "number": 1024
      },
      "expected": "MXXIV"
    },
    {
      "description": "3000 is three M's",
      "property": "roman",
      "input": {
        "number": 3000
      },
      "expected": "MMM"
    }
  ]
}
