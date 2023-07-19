#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5"; # Find modules in the same dir as this file.

use Bob qw<hey>;

is(
    hey("Tom-ay-to, tom-aaaah-to."),
    "Whatever.",
    "stating something",
);

is(
    hey("WATCH OUT!"),
    "Whoa, chill out!",
    "shouting",
);

is(
    hey("FCECDFCAAB"),
    "Whoa, chill out!",
    "shouting gibberish",
);

is(
    hey("Does this cryogenic chamber make me look fat?"),
    "Sure.",
    "asking a question",
);

is(
    hey("You are, what, like 15?"),
    "Sure.",
    "asking a numeric question",
);

is(
    hey("fffbbcbeab?"),
    "Sure.",
    "asking gibberish",
);

is(
    hey("Hi there!"),
    "Whatever.",
    "talking forcefully",
);

is(
    hey("It's OK if you don't want to go work for NASA."),
    "Whatever.",
    "using acronyms in regular speech",
);

is(
    hey("WHAT'S GOING ON?"),
    "Calm down, I know what I'm doing!",
    "forceful question",
);

is(
    hey("1, 2, 3 GO!"),
    "Whoa, chill out!",
    "shouting numbers",
);

is(
    hey("1, 2, 3"),
    "Whatever.",
    "no letters",
);

is(
    hey("4?"),
    "Sure.",
    "question with no letters",
);

is(
    hey("ZOMG THE %^*\@#\$(*^ ZOMBIES ARE COMING!!11!!1!"),
    "Whoa, chill out!",
    "shouting with special characters",
);

is(
    hey("I HATE THE DENTIST"),
    "Whoa, chill out!",
    "shouting with no exclamation mark",
);

is(
    hey("Ending with ? means a question."),
    "Whatever.",
    "statement containing question mark",
);

is(
    hey(":) ?"),
    "Sure.",
    "non-letters with question",
);

is(
    hey("Wait! Hang on. Are you going to be OK?"),
    "Sure.",
    "prattling on",
);

is(
    hey(""),
    "Fine. Be that way!",
    "silence",
);

is(
    hey("          "),
    "Fine. Be that way!",
    "prolonged silence",
);

is(
    hey("\t\t\t\t\t\t\t\t\t\t"),
    "Fine. Be that way!",
    "alternate silence",
);

is(
    hey("\nDoes this cryogenic chamber make me look fat?\nNo."),
    "Whatever.",
    "multiple line question",
);

is(
    hey("         hmmmmmmm..."),
    "Whatever.",
    "starting with whitespace",
);

is(
    hey("Okay if like my  spacebar  quite a bit?   "),
    "Sure.",
    "ending with whitespace",
);

is(
    hey("\n\r \t"),
    "Fine. Be that way!",
    "other whitespace",
);

is(
    hey("This is a statement ending with whitespace      "),
    "Whatever.",
    "non-question ending with whitespace",
);

done_testing;
