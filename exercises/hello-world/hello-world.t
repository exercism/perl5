#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib $FindBin::Bin; # Look for the module inside the same directory as this test file.
use JSON::PP;

my $exercise = 'HelloWorld'; # The name of this exercise.
my $test_version = 1; # The version we will be matching against the exercise.
use Test::More tests => 3; # This is how many tests we expect to run.

use_ok $exercise or BAIL_OUT; # Check that the module can be use-d.

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
foreach ( qw(hello) ) {
  can_ok $exercise, $_;
  $subs{$_} = $exercise->can($_);
}

my $C_DATA = do { local $/; decode_json(<DATA>); };
is $subs{hello}->($_->{input}), $_->{expected}, $_->{description} foreach @{$C_DATA->{cases}};

__DATA__
{
  "exercise": "hello-world",
  "version": "1.1.0",
  "cases": [
    {
      "description": "Say Hi!",
      "property": "hello",
      "input": {},
      "expected": "Hello, World!"
    }
  ]
}
