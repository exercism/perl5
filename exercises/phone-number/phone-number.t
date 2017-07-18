#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
my $dir;
use lib $dir = $FindBin::Bin;
use JSON::PP;

my $exercise = 'PhoneNumber';
my $test_version = 2;
my $module = $ENV{EXERCISM} ? 'Example' : $exercise;
use Test::More tests => 15;

use_ok $module or BAIL_OUT;

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

my $C_DATA;
foreach my $subcases (@{$C_DATA->{cases}}) {
  is $subs{clean_number}->($_->{phrase}), $_->{expected}, $_->{description} foreach @{$subcases->{cases}};
}

SKIP: {
  skip '', 1 unless $ENV{EXERCISM};
  is_deeply eval q{
    use Path::Tiny;
    decode_json path("$dir/../../problem-specifications/exercises/".path($dir)->basename.'/canonical-data.json')->realpath->slurp;
  }, $C_DATA, 'canonical-data';
}

done_testing;

INIT {
$C_DATA = decode_json <<'EOF';

{
  "exercise": "phone-number",
  "version": "1.2.0",
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
          "phrase": "(223) 456-7890",
          "expected": "2234567890"
        },
        {
          "description": "cleans numbers with dots",
          "property": "clean",
          "phrase": "223.456.7890",
          "expected": "2234567890"
        },
        {
          "description": "cleans numbers with multiple spaces",
          "property": "clean",
          "phrase": "223 456   7890   ",
          "expected": "2234567890"
        },
        {
          "description": "invalid when 9 digits",
          "property": "clean",
          "phrase": "123456789",
          "expected": null
        },
        {
          "description": "invalid when 11 digits does not start with a 1",
          "property": "clean",
          "phrase": "22234567890",
          "expected": null
        },
        {
          "description": "valid when 11 digits and starting with 1",
          "property": "clean",
          "phrase": "12234567890",
          "expected": "2234567890"
        },
        {
          "description": "valid when 11 digits and starting with 1 even with punctuation",
          "property": "clean",
          "phrase": "+1 (223) 456-7890",
          "expected": "2234567890"
        },
        {
          "description": "invalid when more than 11 digits",
          "property": "clean",
          "phrase": "321234567890",
          "expected": null
        },
        {
          "description": "invalid with letters",
          "property": "clean",
          "phrase": "123-abc-7890",
          "expected": null
        },
        {
          "description": "invalid with punctuations",
          "property": "clean",
          "phrase": "123-@:!-7890",
          "expected": null
        },
        {
          "description": "invalid if area code does not start with 2-9",
          "property": "clean",
          "phrase": "(123) 456-7890",
          "expected": null
        },
        {
          "description": "invalid if exchange code does not start with 2-9",
          "property": "clean",
          "phrase": "(223) 056-7890",
          "expected": null
        }
      ]
    }
  ]
}

EOF
}
