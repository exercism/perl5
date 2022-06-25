#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";    # Find modules in the same dir as this file.

use Bob qw<hey>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 26;                                 # This is how many tests we expect to run.

imported_ok qw<hey> or bail_out;

for (@test_cases) {
    is hey( $_->{input}{heyBob} ), $_->{expected}, $_->{description};
}

__DATA__
[
  {
    "description": "stating something",
    "expected": "Whatever.",
    "input": {
      "heyBob": "Tom-ay-to, tom-aaaah-to."
    },
    "property": "response"
  },
  {
    "description": "shouting",
    "expected": "Whoa, chill out!",
    "input": {
      "heyBob": "WATCH OUT!"
    },
    "property": "response"
  },
  {
    "description": "shouting gibberish",
    "expected": "Whoa, chill out!",
    "input": {
      "heyBob": "FCECDFCAAB"
    },
    "property": "response"
  },
  {
    "description": "asking a question",
    "expected": "Sure.",
    "input": {
      "heyBob": "Does this cryogenic chamber make me look fat?"
    },
    "property": "response"
  },
  {
    "description": "asking a numeric question",
    "expected": "Sure.",
    "input": {
      "heyBob": "You are, what, like 15?"
    },
    "property": "response"
  },
  {
    "description": "asking gibberish",
    "expected": "Sure.",
    "input": {
      "heyBob": "fffbbcbeab?"
    },
    "property": "response"
  },
  {
    "description": "talking forcefully",
    "expected": "Whatever.",
    "input": {
      "heyBob": "Hi there!"
    },
    "property": "response"
  },
  {
    "description": "using acronyms in regular speech",
    "expected": "Whatever.",
    "input": {
      "heyBob": "It's OK if you don't want to go work for NASA."
    },
    "property": "response"
  },
  {
    "description": "forceful question",
    "expected": "Calm down, I know what I'm doing!",
    "input": {
      "heyBob": "WHAT'S GOING ON?"
    },
    "property": "response"
  },
  {
    "description": "shouting numbers",
    "expected": "Whoa, chill out!",
    "input": {
      "heyBob": "1, 2, 3 GO!"
    },
    "property": "response"
  },
  {
    "description": "no letters",
    "expected": "Whatever.",
    "input": {
      "heyBob": "1, 2, 3"
    },
    "property": "response"
  },
  {
    "description": "question with no letters",
    "expected": "Sure.",
    "input": {
      "heyBob": "4?"
    },
    "property": "response"
  },
  {
    "description": "shouting with special characters",
    "expected": "Whoa, chill out!",
    "input": {
      "heyBob": "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"
    },
    "property": "response"
  },
  {
    "description": "shouting with no exclamation mark",
    "expected": "Whoa, chill out!",
    "input": {
      "heyBob": "I HATE THE DENTIST"
    },
    "property": "response"
  },
  {
    "description": "statement containing question mark",
    "expected": "Whatever.",
    "input": {
      "heyBob": "Ending with ? means a question."
    },
    "property": "response"
  },
  {
    "description": "non-letters with question",
    "expected": "Sure.",
    "input": {
      "heyBob": ":) ?"
    },
    "property": "response"
  },
  {
    "description": "prattling on",
    "expected": "Sure.",
    "input": {
      "heyBob": "Wait! Hang on. Are you going to be OK?"
    },
    "property": "response"
  },
  {
    "description": "silence",
    "expected": "Fine. Be that way!",
    "input": {
      "heyBob": ""
    },
    "property": "response"
  },
  {
    "description": "prolonged silence",
    "expected": "Fine. Be that way!",
    "input": {
      "heyBob": "          "
    },
    "property": "response"
  },
  {
    "description": "alternate silence",
    "expected": "Fine. Be that way!",
    "input": {
      "heyBob": "\t\t\t\t\t\t\t\t\t\t"
    },
    "property": "response"
  },
  {
    "description": "multiple line question",
    "expected": "Whatever.",
    "input": {
      "heyBob": "\nDoes this cryogenic chamber make me look fat?\nNo."
    },
    "property": "response"
  },
  {
    "description": "starting with whitespace",
    "expected": "Whatever.",
    "input": {
      "heyBob": "         hmmmmmmm..."
    },
    "property": "response"
  },
  {
    "description": "ending with whitespace",
    "expected": "Sure.",
    "input": {
      "heyBob": "Okay if like my  spacebar  quite a bit?   "
    },
    "property": "response"
  },
  {
    "description": "other whitespace",
    "expected": "Fine. Be that way!",
    "input": {
      "heyBob": "\n\r \t"
    },
    "property": "response"
  },
  {
    "description": "non-question ending with whitespace",
    "expected": "Whatever.",
    "input": {
      "heyBob": "This is a statement ending with whitespace      "
    },
    "property": "response"
  }
]
