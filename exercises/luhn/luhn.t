#!/usr/bin/env perl
use strict;
use warnings;
use JSON::PP;
use FindBin;
use lib $FindBin::Bin;
use Luhn qw(is_luhn_valid);

my $exercise = 'Luhn';
can_ok $exercise, 'import' or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
is is_luhn_valid($_->{input}{value}), $_->{expected}, $_->{description} foreach @{$C_DATA->{cases}};

__DATA__
{
  "exercise": "luhn",
  "version": "1.1.0",
  "cases": [
    {
      "description": "single digit strings can not be valid",
      "property": "valid",
      "input": {
        "value": "1"
      },
      "expected": false
    },
    {
      "description": "a single zero is invalid",
      "property": "valid",
      "input": {
        "value": "0"
      },
      "expected": false
    },
    {
      "description": "a simple valid SIN that remains valid if reversed",
      "property": "valid",
      "input": {
        "value": "059"
      },
      "expected": true
    },
    {
      "description": "a simple valid SIN that becomes invalid if reversed",
      "property": "valid",
      "input": {
        "value": "59"
      },
      "expected": true
    },
    {
      "description": "a valid Canadian SIN",
      "property": "valid",
      "input": {
        "value": "055 444 285"
      },
      "expected": true
    },
    {
      "description": "invalid Canadian SIN",
      "property": "valid",
      "input": {
        "value": "055 444 286"
      },
      "expected": false
    },
    {
      "description": "invalid credit card",
      "property": "valid",
      "input": {
        "value": "8273 1232 7352 0569"
      },
      "expected": false
    },
    {
      "description": "valid strings with a non-digit included become invalid",
      "property": "valid",
      "input": {
        "value": "055a 444 285"
      },
      "expected": false
    },
    {
      "description": "valid strings with punctuation included become invalid",
      "property": "valid",
      "input": {
        "value": "055-444-285"
      },
      "expected": false
    },
    {
      "description": "valid strings with symbols included become invalid",
      "property": "valid",
      "input": {
        "value": "055£ 444$ 285"
      },
      "expected": false
    },
    {
      "description": "single zero with space is invalid",
      "property": "valid",
      "input": {
        "value": " 0"
      },
      "expected": false
    },
    {
      "description": "more than a single zero is valid",
      "property": "valid",
      "input": {
        "value": "0000 0"
      },
      "expected": true
    },
    {
      "description": "input digit 9 is correctly converted to output digit 9",
      "property": "valid",
      "input": {
        "value": "091"
      },
      "expected": true
    }
  ]
}
