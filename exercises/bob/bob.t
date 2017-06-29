#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
my $dir;
use lib $dir = $FindBin::Bin; # Look for the module inside the same directory as this test file.
use JSON::PP;

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
    decode_json path("$dir/../../problem-specifications/exercises/".path($dir)->basename.'/canonical-data.json')->realpath->slurp;
  }, $C_DATA, 'canonical-data';
}

done_testing; # There are no more tests after this :)

# 'INIT' is a phaser, it makes sure that the test data is available before everything else
# starts running (otherwise we'd have to shove the test data into the middle of the file!)
INIT {
$C_DATA = decode_json <<'EOF';

{
  "exercise": "bob",
  "version": "1.0.0",
  "cases": [
    {
      "description": "stating something",
      "property": "response",
      "input": "Tom-ay-to, tom-aaaah-to.",
      "expected": "Whatever."
    },
    {
      "description": "shouting",
      "property": "response",
      "input": "WATCH OUT!",
      "expected": "Whoa, chill out!"
    },
    {
      "description": "shouting gibberish",
      "property": "response",
      "input": "FCECDFCAAB",
      "expected": "Whoa, chill out!"
    },
    {
      "description": "asking a question",
      "property": "response",
      "input": "Does this cryogenic chamber make me look fat?",
      "expected": "Sure."
    },
    {
      "description": "asking a numeric question",
      "property": "response",
      "input": "You are, what, like 15?",
      "expected": "Sure."
    },
    {
      "description": "asking gibberish",
      "property": "response",
      "input": "fffbbcbeab?",
      "expected": "Sure."
    },
    {
      "description": "talking forcefully",
      "property": "response",
      "input": "Let's go make out behind the gym!",
      "expected": "Whatever."
    },
    {
      "description": "using acronyms in regular speech",
      "property": "response",
      "input": "It's OK if you don't want to go to the DMV.",
      "expected": "Whatever."
    },
    {
      "description": "forceful question",
      "property": "response",
      "input": "WHAT THE HELL WERE YOU THINKING?",
      "expected": "Whoa, chill out!"
    },
    {
      "description": "shouting numbers",
      "property": "response",
      "input": "1, 2, 3 GO!",
      "expected": "Whoa, chill out!"
    },
    {
      "description": "only numbers",
      "property": "response",
      "input": "1, 2, 3",
      "expected": "Whatever."
    },
    {
      "description": "question with only numbers",
      "property": "response",
      "input": "4?",
      "expected": "Sure."
    },
    {
      "description": "shouting with special characters",
      "property": "response",
      "input": "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!",
      "expected": "Whoa, chill out!"
    },
    {
      "description": "shouting with no exclamation mark",
      "property": "response",
      "input": "I HATE YOU",
      "expected": "Whoa, chill out!"
    },
    {
      "description": "statement containing question mark",
      "property": "response",
      "input": "Ending with ? means a question.",
      "expected": "Whatever."
    },
    {
      "description": "non-letters with question",
      "property": "response",
      "input": ":) ?",
      "expected": "Sure."
    },
    {
      "description": "prattling on",
      "property": "response",
      "input": "Wait! Hang on. Are you going to be OK?",
      "expected": "Sure."
    },
    {
      "description": "silence",
      "property": "response",
      "input": "",
      "expected": "Fine. Be that way!"
    },
    {
      "description": "prolonged silence",
      "property": "response",
      "input": "          ",
      "expected": "Fine. Be that way!"
    },
    {
      "description": "alternate silence",
      "property": "response",
      "input": "\t\t\t\t\t\t\t\t\t\t",
      "expected": "Fine. Be that way!"
    },
    {
      "description": "multiple line question",
      "property": "response",
      "input": "\nDoes this cryogenic chamber make me look fat?\nno",
      "expected": "Whatever."
    },
    {
      "description": "starting with whitespace",
      "property": "response",
      "input": "         hmmmmmmm...",
      "expected": "Whatever."
    },
    {
      "description": "ending with whitespace",
      "property": "response",
      "input": "Okay if like my  spacebar  quite a bit?   ",
      "expected": "Sure."
    },
    {
      "description": "other whitespace",
      "property": "response",
      "input": "\n\r \t",
      "expected": "Fine. Be that way!"
    },
    {
      "description": "non-question ending with whitespace",
      "property": "response",
      "input": "This is a statement ending with whitespace      ",
      "expected": "Whatever."
    }
  ]
}

EOF
}
