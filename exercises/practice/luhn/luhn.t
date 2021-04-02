#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Luhn qw<is_luhn_valid>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 19;

imported_ok qw<is_luhn_valid> or bail_out;

for my $case (@test_cases) {
  is(
    is_luhn_valid( $case->{input}{value} ),
    $case->{expected}
    ? T
    : DF,
    $case->{description}
  );
}

__DATA__
[
  {
    "description": "single digit strings can not be valid",
    "expected": false,
    "input": {
      "value": "1"
    },
    "property": "valid"
  },
  {
    "description": "a single zero is invalid",
    "expected": false,
    "input": {
      "value": "0"
    },
    "property": "valid"
  },
  {
    "description": "a simple valid SIN that remains valid if reversed",
    "expected": true,
    "input": {
      "value": "059"
    },
    "property": "valid"
  },
  {
    "description": "a simple valid SIN that becomes invalid if reversed",
    "expected": true,
    "input": {
      "value": "59"
    },
    "property": "valid"
  },
  {
    "description": "a valid Canadian SIN",
    "expected": true,
    "input": {
      "value": "055 444 285"
    },
    "property": "valid"
  },
  {
    "description": "invalid Canadian SIN",
    "expected": false,
    "input": {
      "value": "055 444 286"
    },
    "property": "valid"
  },
  {
    "description": "invalid credit card",
    "expected": false,
    "input": {
      "value": "8273 1232 7352 0569"
    },
    "property": "valid"
  },
  {
    "description": "invalid long number with an even remainder",
    "expected": false,
    "input": {
      "value": "1 2345 6789 1234 5678 9012"
    },
    "property": "valid"
  },
  {
    "description": "valid number with an even number of digits",
    "expected": true,
    "input": {
      "value": "095 245 88"
    },
    "property": "valid"
  },
  {
    "description": "valid number with an odd number of spaces",
    "expected": true,
    "input": {
      "value": "234 567 891 234"
    },
    "property": "valid"
  },
  {
    "description": "valid strings with a non-digit added at the end become invalid",
    "expected": false,
    "input": {
      "value": "059a"
    },
    "property": "valid"
  },
  {
    "description": "valid strings with punctuation included become invalid",
    "expected": false,
    "input": {
      "value": "055-444-285"
    },
    "property": "valid"
  },
  {
    "description": "valid strings with symbols included become invalid",
    "expected": false,
    "input": {
      "value": "055# 444$ 285"
    },
    "property": "valid"
  },
  {
    "description": "single zero with space is invalid",
    "expected": false,
    "input": {
      "value": " 0"
    },
    "property": "valid"
  },
  {
    "description": "more than a single zero is valid",
    "expected": true,
    "input": {
      "value": "0000 0"
    },
    "property": "valid"
  },
  {
    "description": "input digit 9 is correctly converted to output digit 9",
    "expected": true,
    "input": {
      "value": "091"
    },
    "property": "valid"
  },
  {
    "description": "using ascii value for non-doubled non-digit isn't allowed",
    "expected": false,
    "input": {
      "value": "055b 444 285"
    },
    "property": "valid"
  },
  {
    "description": "using ascii value for doubled non-digit isn't allowed",
    "expected": false,
    "input": {
      "value": ":9"
    },
    "property": "valid"
  }
]
