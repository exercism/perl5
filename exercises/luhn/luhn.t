#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib $FindBin::Bin;
use JSON::PP;

my $exercise = 'Luhn';
my $test_version = 2;
use Test::More tests => 15;

use_ok $exercise or BAIL_OUT;

my $exercise_version = $exercise->VERSION // 0;
if ($exercise_version != $test_version) {
  warn "\nExercise version mismatch. Further tests may fail!"
    . "\n$exercise is v$exercise_version. "
    . "Test is v$test_version.\n";
  BAIL_OUT if $ENV{EXERCISM};
}

my %subs;
foreach ( qw(is_luhn_valid) ) {
  can_ok $exercise, $_;
  $subs{$_} = $exercise->can($_);
}

my $C_DATA = do { local $/; decode_json(<DATA>); };
is $subs{is_luhn_valid}->($_->{input}{value}), $_->{expected}, $_->{description} foreach @{$C_DATA->{cases}};

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
