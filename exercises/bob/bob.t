#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 26; # This is how many tests we expect to run.
use JSON::PP;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5"; # Look for modules inside the same directory as this test file.
use Bob qw(hey);

can_ok 'Bob', 'import' or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
is hey($_->{input}{heyBob}), $_->{expected}, $_->{description} foreach @{$C_DATA->{cases}};

__DATA__
{
  "exercise": "bob",
  "version": "1.3.0",
  "cases": [
    {
      "description": "stating something",
      "property": "response",
      "input": {
        "heyBob": "Tom-ay-to, tom-aaaah-to."
      },
      "expected": "Whatever."
    },
    {
      "description": "shouting",
      "property": "response",
      "input": {
        "heyBob": "WATCH OUT!"
      },
      "expected": "Whoa, chill out!"
    },
    {
      "description": "shouting gibberish",
      "property": "response",
      "input": {
        "heyBob": "FCECDFCAAB"
      },
      "expected": "Whoa, chill out!"
    },
    {
      "description": "asking a question",
      "property": "response",
      "input": {
        "heyBob": "Does this cryogenic chamber make me look fat?"
      },
      "expected": "Sure."
    },
    {
      "description": "asking a numeric question",
      "property": "response",
      "input": {
        "heyBob": "You are, what, like 15?"
      },
      "expected": "Sure."
    },
    {
      "description": "asking gibberish",
      "property": "response",
      "input": {
        "heyBob": "fffbbcbeab?"
      },
      "expected": "Sure."
    },
    {
      "description": "talking forcefully",
      "property": "response",
      "input": {
        "heyBob": "Let's go make out behind the gym!"
      },
      "expected": "Whatever."
    },
    {
      "description": "using acronyms in regular speech",
      "property": "response",
      "input": {
        "heyBob": "It's OK if you don't want to go to the DMV."
      },
      "expected": "Whatever."
    },
    {
      "description": "forceful question",
      "property": "response",
      "input": {
        "heyBob": "WHAT THE HELL WERE YOU THINKING?"
      },
      "expected": "Calm down, I know what I'm doing!"
    },
    {
      "description": "shouting numbers",
      "property": "response",
      "input": {
        "heyBob": "1, 2, 3 GO!"
      },
      "expected": "Whoa, chill out!"
    },
    {
      "description": "no letters",
      "property": "response",
      "input": {
        "heyBob": "1, 2, 3"
      },
      "expected": "Whatever."
    },
    {
      "description": "question with no letters",
      "property": "response",
      "input": {
        "heyBob": "4?"
      },
      "expected": "Sure."
    },
    {
      "description": "shouting with special characters",
      "property": "response",
      "input": {
        "heyBob": "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"
      },
      "expected": "Whoa, chill out!"
    },
    {
      "description": "shouting with no exclamation mark",
      "property": "response",
      "input": {
        "heyBob": "I HATE THE DMV"
      },
      "expected": "Whoa, chill out!"
    },
    {
      "description": "statement containing question mark",
      "property": "response",
      "input": {
        "heyBob": "Ending with ? means a question."
      },
      "expected": "Whatever."
    },
    {
      "description": "non-letters with question",
      "property": "response",
      "input": {
        "heyBob": ":) ?"
      },
      "expected": "Sure."
    },
    {
      "description": "prattling on",
      "property": "response",
      "input": {
        "heyBob": "Wait! Hang on. Are you going to be OK?"
      },
      "expected": "Sure."
    },
    {
      "description": "silence",
      "property": "response",
      "input": {
        "heyBob": ""
      },
      "expected": "Fine. Be that way!"
    },
    {
      "description": "prolonged silence",
      "property": "response",
      "input": {
        "heyBob": "          "
      },
      "expected": "Fine. Be that way!"
    },
    {
      "description": "alternate silence",
      "property": "response",
      "input": {
        "heyBob": "\t\t\t\t\t\t\t\t\t\t"
      },
      "expected": "Fine. Be that way!"
    },
    {
      "description": "multiple line question",
      "property": "response",
      "input": {
        "heyBob": "\nDoes this cryogenic chamber make me look fat?\nno"
      },
      "expected": "Whatever."
    },
    {
      "description": "starting with whitespace",
      "property": "response",
      "input": {
        "heyBob": "         hmmmmmmm..."
      },
      "expected": "Whatever."
    },
    {
      "description": "ending with whitespace",
      "property": "response",
      "input": {
        "heyBob": "Okay if like my  spacebar  quite a bit?   "
      },
      "expected": "Sure."
    },
    {
      "description": "other whitespace",
      "property": "response",
      "input": {
        "heyBob": "\n\r \t"
      },
      "expected": "Fine. Be that way!"
    },
    {
      "description": "non-question ending with whitespace",
      "property": "response",
      "input": {
        "heyBob": "This is a statement ending with whitespace      "
      },
      "expected": "Whatever."
    }
  ]
}
