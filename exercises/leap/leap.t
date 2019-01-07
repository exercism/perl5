#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 6; # This is how many tests we expect to run.
use JSON::PP;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5"; # Look for modules inside the same directory as this test file.
use Leap qw(is_leap_year);

can_ok 'Leap', 'import' or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
foreach (@{$C_DATA->{cases}}) {
  my $result = is_leap_year $_->{input}{year};
  ok(
    defined $result && !($result xor $_->{expected}),
    $_->{description}
  );
}

__DATA__
{
  "exercise": "leap",
  "version": "1.4.0",
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
    },
    {
      "description": "year divisible by 200, not divisible by 400: common year",
      "property": "leapYear",
      "input": {
        "year": 1800
      },
      "expected": false
    }
  ]
}
