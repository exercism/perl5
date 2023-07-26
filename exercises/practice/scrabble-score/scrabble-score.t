#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Scrabble qw<scrabble_score>;

is(
    scrabble_score("a"),
    1,
    "lowercase letter",
);

is(
    scrabble_score("A"),
    1,
    "uppercase letter",
);

is(
    scrabble_score("f"),
    4,
    "valuable letter",
);

is(
    scrabble_score("at"),
    2,
    "short word",
);

is(
    scrabble_score("zoo"),
    12,
    "short, valuable word",
);

is(
    scrabble_score("street"),
    6,
    "medium word",
);

is(
    scrabble_score("quirky"),
    22,
    "medium, valuable word",
);

is(
    scrabble_score("OxyphenButazone"),
    41,
    "long, mixed-case word",
);

is(
    scrabble_score("pinata"),
    8,
    "english-like word",
);

is(
    scrabble_score(""),
    0,
    "empty input",
);

is(
    scrabble_score("abcdefghijklmnopqrstuvwxyz"),
    87,
    "entire alphabet available",
);

done_testing;
