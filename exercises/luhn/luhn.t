#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use Luhn qw(is_luhn_valid);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 18;

imported_ok qw(is_luhn_valid) or bail_out;

for my $case ( @{ $C_DATA->{cases} } ) {
  is(
    is_luhn_valid( $case->{input}{value} ),
    $case->{expected}
    ? T
    : DF,
    $case->{description}
  );
}

__DATA__
{
  "exercise": "luhn",
  "version": "1.6.1",
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
      "description": "valid number with an even number of digits",
      "property": "valid",
      "input": {
        "value": "095 245 88"
      },
      "expected": true
    },
    {
      "description": "valid number with an odd number of spaces",
      "property": "valid",
      "input": {
        "value": "234 567 891 234"
      },
      "expected": true
    },
    {
      "description": "valid strings with a non-digit added at the end become invalid",
      "property": "valid",
      "input": {
        "value": "059a"
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
        "value": "055# 444$ 285"
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
    },
    {
      "comments": [
        "Convert non-digits to their ascii values and then offset them by 48 sometimes accidentally declare an invalid string to be valid.",
        "This test is designed to avoid that solution."
      ],
      "description": "using ascii value for non-doubled non-digit isn't allowed",
      "property": "valid",
      "input": {
        "value": "055b 444 285"
      },
      "expected": false
    },
    {
      "comments": [
        "Convert non-digits to their ascii values and then offset them by 48 sometimes accidentally declare an invalid string to be valid.",
        "This test is designed to avoid that solution."
      ],
      "description": "using ascii value for doubled non-digit isn't allowed",
      "property": "valid",
      "input": {
        "value": ":9"
      },
      "expected": false
    }
  ]
}
