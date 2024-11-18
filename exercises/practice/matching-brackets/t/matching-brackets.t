#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use MatchingBrackets qw<has_matching_brackets>;

is( # begin: 81ec11da-38dd-442a-bcf9-3de7754609a5
    has_matching_brackets("[]"),
    T, # True
    "paired square brackets",
); # end: 81ec11da-38dd-442a-bcf9-3de7754609a5

is( # begin: 287f0167-ac60-4b64-8452-a0aa8f4e5238
    has_matching_brackets(""),
    T, # True
    "empty string",
); # end: 287f0167-ac60-4b64-8452-a0aa8f4e5238

is( # begin: 6c3615a3-df01-4130-a731-8ef5f5d78dac
    has_matching_brackets("[["),
    DF, # Defined but False
    "unpaired brackets",
); # end: 6c3615a3-df01-4130-a731-8ef5f5d78dac

is( # begin: 9d414171-9b98-4cac-a4e5-941039a97a77
    has_matching_brackets("}{"),
    DF, # Defined but False
    "wrong ordered brackets",
); # end: 9d414171-9b98-4cac-a4e5-941039a97a77

is( # begin: f0f97c94-a149-4736-bc61-f2c5148ffb85
    has_matching_brackets("{]"),
    DF, # Defined but False
    "wrong closing bracket",
); # end: f0f97c94-a149-4736-bc61-f2c5148ffb85

is( # begin: 754468e0-4696-4582-a30e-534d47d69756
    has_matching_brackets("{ }"),
    T, # True
    "paired with whitespace",
); # end: 754468e0-4696-4582-a30e-534d47d69756

is( # begin: ba84f6ee-8164-434a-9c3e-b02c7f8e8545
    has_matching_brackets("{[])"),
    DF, # Defined but False
    "partially paired brackets",
); # end: ba84f6ee-8164-434a-9c3e-b02c7f8e8545

is( # begin: 3c86c897-5ff3-4a2b-ad9b-47ac3a30651d
    has_matching_brackets("{[]}"),
    T, # True
    "simple nested brackets",
); # end: 3c86c897-5ff3-4a2b-ad9b-47ac3a30651d

is( # begin: 2d137f2c-a19e-4993-9830-83967a2d4726
    has_matching_brackets("{}[]"),
    T, # True
    "several paired brackets",
); # end: 2d137f2c-a19e-4993-9830-83967a2d4726

is( # begin: 2e1f7b56-c137-4c92-9781-958638885a44
    has_matching_brackets("([{}({}[])])"),
    T, # True
    "paired and nested brackets",
); # end: 2e1f7b56-c137-4c92-9781-958638885a44

is( # begin: 84f6233b-e0f7-4077-8966-8085d295c19b
    has_matching_brackets("{[)][]}"),
    DF, # Defined but False
    "unopened closing brackets",
); # end: 84f6233b-e0f7-4077-8966-8085d295c19b

is( # begin: 9b18c67d-7595-4982-b2c5-4cb949745d49
    has_matching_brackets("([{])"),
    DF, # Defined but False
    "unpaired and nested brackets",
); # end: 9b18c67d-7595-4982-b2c5-4cb949745d49

is( # begin: a0205e34-c2ac-49e6-a88a-899508d7d68e
    has_matching_brackets("[({]})"),
    DF, # Defined but False
    "paired and wrong nested brackets",
); # end: a0205e34-c2ac-49e6-a88a-899508d7d68e

is( # begin: 1d5c093f-fc84-41fb-8c2a-e052f9581602
    has_matching_brackets("[({}])"),
    DF, # Defined but False
    "paired and wrong nested brackets but innermost are correct",
); # end: 1d5c093f-fc84-41fb-8c2a-e052f9581602

is( # begin: ef47c21b-bcfd-4998-844c-7ad5daad90a8
    has_matching_brackets("{}["),
    DF, # Defined but False
    "paired and incomplete brackets",
); # end: ef47c21b-bcfd-4998-844c-7ad5daad90a8

is( # begin: a4675a40-a8be-4fc2-bc47-2a282ce6edbe
    has_matching_brackets("[]]"),
    DF, # Defined but False
    "too many closing brackets",
); # end: a4675a40-a8be-4fc2-bc47-2a282ce6edbe

is( # begin: a345a753-d889-4b7e-99ae-34ac85910d1a
    has_matching_brackets(")()"),
    DF, # Defined but False
    "early unexpected brackets",
); # end: a345a753-d889-4b7e-99ae-34ac85910d1a

is( # begin: 21f81d61-1608-465a-b850-baa44c5def83
    has_matching_brackets("{)()"),
    DF, # Defined but False
    "early mismatched brackets",
); # end: 21f81d61-1608-465a-b850-baa44c5def83

is( # begin: 99255f93-261b-4435-a352-02bdecc9bdf2
    has_matching_brackets("(((185 + 223.85) * 15) - 543)/2"),
    T, # True
    "math expression",
); # end: 99255f93-261b-4435-a352-02bdecc9bdf2

is( # begin: 8e357d79-f302-469a-8515-2561877256a1
    has_matching_brackets("\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"),
    T, # True
    "complex latex expression",
); # end: 8e357d79-f302-469a-8515-2561877256a1

done_testing;
