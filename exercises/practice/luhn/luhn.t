#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Luhn qw<is_luhn_valid>;

is(
    is_luhn_valid("1"),
    DF, # Defined but False
    "single digit strings can not be valid",
);

is(
    is_luhn_valid("0"),
    DF, # Defined but False
    "a single zero is invalid",
);

is(
    is_luhn_valid("059"),
    T, # True
    "a simple valid SIN that remains valid if reversed",
);

is(
    is_luhn_valid("59"),
    T, # True
    "a simple valid SIN that becomes invalid if reversed",
);

is(
    is_luhn_valid("055 444 285"),
    T, # True
    "a valid Canadian SIN",
);

is(
    is_luhn_valid("055 444 286"),
    DF, # Defined but False
    "invalid Canadian SIN",
);

is(
    is_luhn_valid("8273 1232 7352 0569"),
    DF, # Defined but False
    "invalid credit card",
);

is(
    is_luhn_valid("1 2345 6789 1234 5678 9012"),
    DF, # Defined but False
    "invalid long number with an even remainder",
);

is(
    is_luhn_valid("1 2345 6789 1234 5678 9013"),
    DF, # Defined but False
    "invalid long number with a remainder divisible by 5",
);

is(
    is_luhn_valid("095 245 88"),
    T, # True
    "valid number with an even number of digits",
);

is(
    is_luhn_valid("234 567 891 234"),
    T, # True
    "valid number with an odd number of spaces",
);

is(
    is_luhn_valid("059a"),
    DF, # Defined but False
    "valid strings with a non-digit added at the end become invalid",
);

is(
    is_luhn_valid("055-444-285"),
    DF, # Defined but False
    "valid strings with punctuation included become invalid",
);

is(
    is_luhn_valid("055# 444\$ 285"),
    DF, # Defined but False
    "valid strings with symbols included become invalid",
);

is(
    is_luhn_valid(" 0"),
    DF, # Defined but False
    "single zero with space is invalid",
);

is(
    is_luhn_valid("0000 0"),
    T, # True
    "more than a single zero is valid",
);

is(
    is_luhn_valid("091"),
    T, # True
    "input digit 9 is correctly converted to output digit 9",
);

is(
    is_luhn_valid("9999999999 9999999999 9999999999 9999999999"),
    T, # True
    "very long input is valid",
);

is(
    is_luhn_valid("109"),
    T, # True
    "valid luhn with an odd number of digits and non zero first digit",
);

is(
    is_luhn_valid("055b 444 285"),
    DF, # Defined but False
    "using ascii value for non-doubled non-digit isn't allowed",
);

is(
    is_luhn_valid(":9"),
    DF, # Defined but False
    "using ascii value for doubled non-digit isn't allowed",
);

is(
    is_luhn_valid("59%59"),
    DF, # Defined but False
    "non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed",
);

done_testing;
