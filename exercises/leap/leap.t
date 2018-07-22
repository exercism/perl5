#!/usr/bin/env perl
use strict;
use warnings;
use JSON::PP;
use FindBin;
use lib $FindBin::Bin; # Look for the module inside the same directory as this test file.
use Leap qw(is_leap);

my $exercise = 'Leap'; # The name of this exercise.
can_ok $exercise, 'import' or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
ok !(is_leap($_->{input}{year}) xor $_->{expected}), $_->{description} foreach @{$C_DATA->{cases}};

__DATA__
{
  "exercise": "leap",
  "version": "1.3.0",
  "cases": [
    {
      "description": "year not divisible by 4: common year",
      "property": "leapYear",
      "input": {
        "year": 2015
      },
      "expected": false
    },
    {
      "description": "year divisible by 4, not divisible by 100: leap year",
      "property": "leapYear",
      "input": {
        "year": 1996
      },
      "expected": true
    },
    {
      "description": "year divisible by 100, not divisible by 400: common year",
      "property": "leapYear",
      "input": {
        "year": 2100
      },
      "expected": false
    },
    {
      "description": "year divisible by 400: leap year",
      "property": "leapYear",
      "input": {
        "year": 2000
      },
      "expected": true
    }
  ]
}
