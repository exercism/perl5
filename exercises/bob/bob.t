#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir; # Look for the module inside the same directory as this test file.

my $exercise = 'Bob'; # The name of this exercise.
my $test_version = 2; # The version we will be matching against the exercise.
my $module = $ENV{EXERCISM} ? 'Example' : $exercise; # $ENV{EXERCISM} is for tests not directly for the exercise, don't worry about these :)
use Test::More tests => 28; # This is how many tests we expect to run.

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
foreach ( qw(hey) ) {
  can_ok $exercise, $_;
  $subs{$_} = $exercise->can($_);
}

my $C_DATA;
is $subs{hey}->($_->{input}), $_->{expected}, $_->{description} foreach @{$C_DATA->{cases}};

# Ignore this for your exercise! Tells Exercism folks when exercise cases become out of date.
SKIP: {
  skip '', 1 unless $ENV{EXERCISM};
  is_deeply eval q{
    use Path::Tiny;
    use JSON::PP 'decode_json';
    decode_json path("$dir/../../problem-specifications/exercises/".path($dir)->basename.'/canonical-data.json')->realpath->slurp;
  }, $C_DATA, 'canonical-data';
}

done_testing; # There are no more tests after this :)

# 'INIT' is a phaser, it makes sure that the test data is available before everything else
# starts running (otherwise we'd have to shove the test data into the middle of the file!)
INIT { $C_DATA = {
  cases    => [
                {
                  description => "stating something",
                  expected    => "Whatever.",
                  input       => "Tom-ay-to, tom-aaaah-to.",
                  property    => "response",
                },
                {
                  description => "shouting",
                  expected    => "Whoa, chill out!",
                  input       => "WATCH OUT!",
                  property    => "response",
                },
                {
                  description => "shouting gibberish",
                  expected    => "Whoa, chill out!",
                  input       => "FCECDFCAAB",
                  property    => "response",
                },
                {
                  description => "asking a question",
                  expected    => "Sure.",
                  input       => "Does this cryogenic chamber make me look fat?",
                  property    => "response",
                },
                {
                  description => "asking a numeric question",
                  expected    => "Sure.",
                  input       => "You are, what, like 15?",
                  property    => "response",
                },
                {
                  description => "asking gibberish",
                  expected    => "Sure.",
                  input       => "fffbbcbeab?",
                  property    => "response",
                },
                {
                  description => "talking forcefully",
                  expected    => "Whatever.",
                  input       => "Let's go make out behind the gym!",
                  property    => "response",
                },
                {
                  description => "using acronyms in regular speech",
                  expected    => "Whatever.",
                  input       => "It's OK if you don't want to go to the DMV.",
                  property    => "response",
                },
                {
                  description => "forceful question",
                  expected    => "Whoa, chill out!",
                  input       => "WHAT THE HELL WERE YOU THINKING?",
                  property    => "response",
                },
                {
                  description => "shouting numbers",
                  expected    => "Whoa, chill out!",
                  input       => "1, 2, 3 GO!",
                  property    => "response",
                },
                {
                  description => "only numbers",
                  expected    => "Whatever.",
                  input       => "1, 2, 3",
                  property    => "response",
                },
                {
                  description => "question with only numbers",
                  expected    => "Sure.",
                  input       => "4?",
                  property    => "response",
                },
                {
                  description => "shouting with special characters",
                  expected    => "Whoa, chill out!",
                  input       => "ZOMG THE %^*\@#\$(*^ ZOMBIES ARE COMING!!11!!1!",
                  property    => "response",
                },
                {
                  description => "shouting with no exclamation mark",
                  expected    => "Whoa, chill out!",
                  input       => "I HATE YOU",
                  property    => "response",
                },
                {
                  description => "statement containing question mark",
                  expected    => "Whatever.",
                  input       => "Ending with ? means a question.",
                  property    => "response",
                },
                {
                  description => "non-letters with question",
                  expected    => "Sure.",
                  input       => ":) ?",
                  property    => "response",
                },
                {
                  description => "prattling on",
                  expected    => "Sure.",
                  input       => "Wait! Hang on. Are you going to be OK?",
                  property    => "response",
                },
                {
                  description => "silence",
                  expected    => "Fine. Be that way!",
                  input       => "",
                  property    => "response",
                },
                {
                  description => "prolonged silence",
                  expected    => "Fine. Be that way!",
                  input       => "          ",
                  property    => "response",
                },
                {
                  description => "alternate silence",
                  expected    => "Fine. Be that way!",
                  input       => "\t\t\t\t\t\t\t\t\t\t",
                  property    => "response",
                },
                {
                  description => "multiple line question",
                  expected    => "Whatever.",
                  input       => "\nDoes this cryogenic chamber make me look fat?\nno",
                  property    => "response",
                },
                {
                  description => "starting with whitespace",
                  expected    => "Whatever.",
                  input       => "         hmmmmmmm...",
                  property    => "response",
                },
                {
                  description => "ending with whitespace",
                  expected    => "Sure.",
                  input       => "Okay if like my  spacebar  quite a bit?   ",
                  property    => "response",
                },
                {
                  description => "other whitespace",
                  expected    => "Fine. Be that way!",
                  input       => "\n\r \t",
                  property    => "response",
                },
                {
                  description => "non-question ending with whitespace",
                  expected    => "Whatever.",
                  input       => "This is a statement ending with whitespace      ",
                  property    => "response",
                },
              ],
  exercise => "bob",
  version  => "1.0.0",
} }
