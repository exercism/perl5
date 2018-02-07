#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
my $dir;
use lib $dir = $FindBin::Bin;
use JSON::PP;

my $exercise = 'Luhn';
my $test_version = 2;
my $module = $ENV{EXERCISM} ? 'Example' : $exercise;
use Test::More tests => 16;

use_ok $module or BAIL_OUT;

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

my $C_DATA;
is $subs{is_luhn_valid}->($_->{input}), $_->{expected}, $_->{description} foreach @{$C_DATA->{cases}};

SKIP: {
  skip '', 1 unless $ENV{EXERCISM};
  TODO: {
    local $TODO = 'update canonical-data';
    is_deeply eval q{
      use Path::Tiny;
      decode_json path("$dir/../../problem-specifications/exercises/".path($dir)->basename.'/canonical-data.json')->realpath->slurp;
    }, $C_DATA, 'canonical-data';
  }
}

done_testing;

INIT {
$C_DATA = decode_json <<'EOF';

{
  "exercise": "luhn",
  "version": "1.0.0",
  "cases": [
    {
      "description": "single digit strings can not be valid",
      "property": "valid",
      "input": "1",
      "expected": false
    },
    {
      "description": "A single zero is invalid",
      "property": "valid",
      "input": "0",
      "expected": false
    },
    {
      "description": "a simple valid SIN that remains valid if reversed",
      "property": "valid",
      "input": "059",
      "expected": true
    },
    {
      "description": "a simple valid SIN that becomes invalid if reversed",
      "property": "valid",
      "input": "59",
      "expected": true
    },
    {
      "description": "a valid Canadian SIN",
      "property": "valid",
      "input": "055 444 285",
      "expected": true
    },
    {
      "description": "invalid Canadian SIN",
      "property": "valid",
      "input": "055 444 286",
      "expected": false
    },
    {
      "description": "invalid credit card",
      "property": "valid",
      "input": "8273 1232 7352 0569",
      "expected": false
    },
    {
      "description": "valid strings with a non-digit included become invalid",
      "property": "valid",
      "input": "055a 444 285",
      "expected": false
    },
    {
      "description": "valid strings with punctuation included become invalid",
      "property": "valid",
      "input": "055-444-285",
      "expected": false
    },
    {
      "description": "valid strings with symbols included become invalid",
      "property": "valid",
      "input": "055£ 444$ 285",
      "expected": false
    },
    {
      "description": "single zero with space is invalid",
      "property": "valid",
      "input": " 0",
      "expected": false
    },
    {
      "description": "more than a single zero is valid",
      "property": "valid",
      "input": "0000 0",
      "expected": true
    },
    {
      "description": "input digit 9 is correctly converted to output digit 9",
      "property": "valid",
      "input": "091",
      "expected": true
    }
  ]
}

EOF
}
