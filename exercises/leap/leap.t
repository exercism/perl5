#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
my $dir;
use lib $dir = $FindBin::Bin; # Look for the module inside the same directory as this test file.
use JSON::PP;

my $exercise = 'Leap'; # The name of this exercise.
my $test_version = 2; # The version we will be matching against the exercise.
my $module = $ENV{EXERCISM} ? 'Example' : $exercise; # $ENV{EXERCISM} is for tests not directly for the exercise, don't worry about these :)
use Test::More tests => 7; # This is how many tests we expect to run.

use_ok $module or BAIL_OUT; # Check that the module can be use-d.

# If the exercise is updated, we want to make sure other people testing
# your code don't think you've made a mistake if things have changed!
my $exercise_version = $exercise->VERSION // 0;
if ($exercise_version != $test_version) {
  warn "\nExercise version mismatch. Further tests may fail!"
    . "\n$exercise is v$exercise_version. "
    . "Test is v$test_version.\n";
  BAIL_OUT if $ENV{EXERCISM};
}

my %subs;
foreach ( qw(is_leap) ) {
  can_ok $exercise, $_;
  $subs{$_} = $exercise->can($_);
}

my $C_DATA;
is $subs{is_leap}->($_->{input}), $_->{expected}, $_->{description} foreach @{$C_DATA->{cases}};

# Ignore this for your exercise! Tells Exercism folks when exercise cases become out of date.
SKIP: {
  skip '', 1 unless $ENV{EXERCISM};
  is_deeply eval q{
    use Path::Tiny;
    decode_json path("$dir/../../problem-specifications/exercises/".path($dir)->basename.'/canonical-data.json')->realpath->slurp;
  }, $C_DATA, 'canonical-data';
}

done_testing; # There are no more tests after this :)

# 'INIT' is a phaser, it makes sure that the test data is available before everything else
# starts running (otherwise we'd have to shove the test data into the middle of the file!)
INIT {
$C_DATA = decode_json <<'EOF';

{
  "exercise": "leap",
  "version": "1.0.0",
  "cases": [
    {
      "description": "year not divisible by 4: common year",
      "property": "leapYear",
      "input": 2015,
      "expected": false
    },
    {
      "description": "year divisible by 4, not divisible by 100: leap year",
      "property": "leapYear",
      "input": 2016,
      "expected": true
    },
    {
      "description": "year divisible by 100, not divisible by 400: common year",
      "property": "leapYear",
      "input": 2100,
      "expected": false
    },
    {
      "description": "year divisible by 400: leap year",
      "property": "leapYear",
      "input": 2000,
      "expected": true
    }
  ]
}

EOF
}
