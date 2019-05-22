#!/usr/bin/env perl
use strict;
use warnings;
use Test2::Bundle::More;
plan 19;

use JSON::PP;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use Raindrops qw(raindrop);

can_ok 'Raindrops', 'import'
  or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
foreach my $case ( @{ $C_DATA->{cases} } ) {
  is raindrop( $case->{input}{number} ), $case->{expected},
    $case->{description};
}

__DATA__
{
  "exercise": "raindrops",
  "version": "1.1.0",
  "cases": [
    {
      "description": "the sound for 1 is 1",
      "property": "convert",
      "input": {
        "number": 1
      },
      "expected": "1"
    },
    {
      "description": "the sound for 3 is Pling",
      "property": "convert",
      "input": {
        "number": 3
      },
      "expected": "Pling"
    },
    {
      "description": "the sound for 5 is Plang",
      "property": "convert",
      "input": {
        "number": 5
      },
      "expected": "Plang"
    },
    {
      "description": "the sound for 7 is Plong",
      "property": "convert",
      "input": {
        "number": 7
      },
      "expected": "Plong"
    },
    {
      "description": "the sound for 6 is Pling as it has a factor 3",
      "property": "convert",
      "input": {
        "number": 6
      },
      "expected": "Pling"
    },
    {
      "description": "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base",
      "property": "convert",
      "input": {
        "number": 8
      },
      "expected": "8"
    },
    {
      "description": "the sound for 9 is Pling as it has a factor 3",
      "property": "convert",
      "input": {
        "number": 9
      },
      "expected": "Pling"
    },
    {
      "description": "the sound for 10 is Plang as it has a factor 5",
      "property": "convert",
      "input": {
        "number": 10
      },
      "expected": "Plang"
    },
    {
      "description": "the sound for 14 is Plong as it has a factor of 7",
      "property": "convert",
      "input": {
        "number": 14
      },
      "expected": "Plong"
    },
    {
      "description": "the sound for 15 is PlingPlang as it has factors 3 and 5",
      "property": "convert",
      "input": {
        "number": 15
      },
      "expected": "PlingPlang"
    },
    {
      "description": "the sound for 21 is PlingPlong as it has factors 3 and 7",
      "property": "convert",
      "input": {
        "number": 21
      },
      "expected": "PlingPlong"
    },
    {
      "description": "the sound for 25 is Plang as it has a factor 5",
      "property": "convert",
      "input": {
        "number": 25
      },
      "expected": "Plang"
    },
    {
      "description": "the sound for 27 is Pling as it has a factor 3",
      "property": "convert",
      "input": {
        "number": 27
      },
      "expected": "Pling"
    },
    {
      "description": "the sound for 35 is PlangPlong as it has factors 5 and 7",
      "property": "convert",
      "input": {
        "number": 35
      },
      "expected": "PlangPlong"
    },
    {
      "description": "the sound for 49 is Plong as it has a factor 7",
      "property": "convert",
      "input": {
        "number": 49
      },
      "expected": "Plong"
    },
    {
      "description": "the sound for 52 is 52",
      "property": "convert",
      "input": {
        "number": 52
      },
      "expected": "52"
    },
    {
      "description": "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7",
      "property": "convert",
      "input": {
        "number": 105
      },
      "expected": "PlingPlangPlong"
    },
    {
      "description": "the sound for 3125 is Plang as it has a factor 5",
      "property": "convert",
      "input": {
        "number": 3125
      },
      "expected": "Plang"
    }
  ]
}
