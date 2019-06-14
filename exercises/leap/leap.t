#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5"; # Find modules in the same dir as this file.

use Leap qw(is_leap_year);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 7;    # This is how many tests we expect to run.

imported_ok qw(is_leap_year) or bail_out;

for ( @{ $C_DATA->{cases} } ) {
  is(
    is_leap_year( $_->{input}{year} ),
    $_->{expected} ? T : DF,    # Check if True, or Defined but False
    $_->{description}
  );
}

__DATA__
{
  "exercise": "leap",
  "version": "1.5.1",
  "cases": [
    {
      "description": "year not divisible by 4 in common year",
      "property": "leapYear",
      "input": {
        "year": 2015
      },
      "expected": false
    },
    {
      "description": "year divisible by 2, not divisible by 4 in common year",
      "property": "leapYear",
      "input": {
        "year": 1970
      },
      "expected": false
    },
    {
      "description": "year divisible by 4, not divisible by 100 in leap year",
      "property": "leapYear",
      "input": {
        "year": 1996
      },
      "expected": true
    },
    {
      "description": "year divisible by 100, not divisible by 400 in common year",
      "property": "leapYear",
      "input": {
        "year": 2100
      },
      "expected": false
    },
    {
      "description": "year divisible by 400 in leap year",
      "property": "leapYear",
      "input": {
        "year": 2000
      },
      "expected": true
    },
    {
      "description": "year divisible by 200, not divisible by 400 in common year",
      "property": "leapYear",
      "input": {
        "year": 1800
      },
      "expected": false
    }
  ]
}
