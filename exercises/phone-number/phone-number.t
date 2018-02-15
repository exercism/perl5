#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib $FindBin::Bin;
use JSON::PP;

my $exercise = 'PhoneNumber';
my $test_version = 3;
use Test::More tests => 16;

use_ok $exercise or BAIL_OUT;

my $exercise_version = $exercise->VERSION // 0;
if ($exercise_version != $test_version) {
  warn "\nExercise version mismatch. Further tests may fail!"
    . "\n$exercise is v$exercise_version. "
    . "Test is v$test_version.\n";
  BAIL_OUT if $ENV{EXERCISM};
}

my %subs;
foreach ( qw(clean_number) ) {
  can_ok $exercise, $_;
  $subs{$_} = $exercise->can($_);
}

my $C_DATA = do { local $/; decode_json(<DATA>); };
foreach my $subcases (@{$C_DATA->{cases}}) {
  is $subs{clean_number}->($_->{input}{phrase}), $_->{expected}, $_->{description} foreach @{$subcases->{cases}};
}

__DATA__
{
  "exercise": "phone-number",
  "version": "1.4.0",
  "cases": [
    {
      "description": "Cleanup user-entered phone numbers",
      "comments": [
        " Returns the cleaned phone number if given number is valid, "
      , " else returns nil. Note that number is not formatted,       "
      , " just a 10-digit number is returned.                        "
      ],
      "cases": [
        {
          "description": "cleans the number",
          "property": "clean",
          "input": {
            "phrase": "(223) 456-7890"
          },
          "expected": "2234567890"
        },
        {
          "description": "cleans numbers with dots",
          "property": "clean",
          "input": {
            "phrase": "223.456.7890"
          },
          "expected": "2234567890"
        },
        {
          "description": "cleans numbers with multiple spaces",
          "property": "clean",
          "input": {
            "phrase": "223 456   7890   "
          },
          "expected": "2234567890"
        },
        {
          "description": "invalid when 9 digits",
          "property": "clean",
          "input": {
            "phrase": "123456789"
          },
          "expected": null
        },
        {
          "description": "invalid when 11 digits does not start with a 1",
          "property": "clean",
          "input": {
            "phrase": "22234567890"
          },
          "expected": null
        },
        {
          "description": "valid when 11 digits and starting with 1",
          "property": "clean",
          "input": {
            "phrase": "12234567890"
          },
          "expected": "2234567890"
        },
        {
          "description": "valid when 11 digits and starting with 1 even with punctuation",
          "property": "clean",
          "input": {
            "phrase": "+1 (223) 456-7890"
          },
          "expected": "2234567890"
        },
        {
          "description": "invalid when more than 11 digits",
          "property": "clean",
          "input": {
            "phrase": "321234567890"
          },
          "expected": null
        },
        {
          "description": "invalid with letters",
          "property": "clean",
          "input": {
            "phrase": "123-abc-7890"
          },
          "expected": null
        },
        {
          "description": "invalid with punctuations",
          "property": "clean",
          "input": {
            "phrase": "123-@:!-7890"
          },
          "expected": null
        },
        {
          "description": "invalid if area code starts with 0",
          "property": "clean",
          "input": {
            "phrase": "(023) 456-7890"
          },
          "expected": null
        },
        {
          "description": "invalid if area code starts with 1",
          "property": "clean",
          "input": {
            "phrase": "(123) 456-7890"
          },
          "expected": null
        },
        {
          "description": "invalid if exchange code starts with 0",
          "property": "clean",
          "input": {
            "phrase": "(223) 056-7890"
          },
          "expected": null
        },
        {
          "description": "invalid if exchange code starts with 1",
          "property": "clean",
          "input": {
            "phrase": "(223) 156-7890"
          },
          "expected": null
        }
      ]
    }
  ]
}
