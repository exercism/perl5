#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Say qw<say_number>;

is(
    say_number(0),
    "zero",
    "zero",
);

is(
    say_number(1),
    "one",
    "one",
);

is(
    say_number(14),
    "fourteen",
    "fourteen",
);

is(
    say_number(20),
    "twenty",
    "twenty",
);

is(
    say_number(22),
    "twenty-two",
    "twenty-two",
);

is(
    say_number(30),
    "thirty",
    "thirty",
);

is(
    say_number(99),
    "ninety-nine",
    "ninety-nine",
);

is(
    say_number(100),
    "one hundred",
    "one hundred",
);

is(
    say_number(123),
    "one hundred twenty-three",
    "one hundred twenty-three",
);

is(
    say_number(200),
    "two hundred",
    "two hundred",
);

is(
    say_number(999),
    "nine hundred ninety-nine",
    "nine hundred ninety-nine",
);

is(
    say_number(1000),
    "one thousand",
    "one thousand",
);

is(
    say_number(1234),
    "one thousand two hundred thirty-four",
    "one thousand two hundred thirty-four",
);

is(
    say_number(1000000),
    "one million",
    "one million",
);

is(
    say_number(1002345),
    "one million two thousand three hundred forty-five",
    "one million two thousand three hundred forty-five",
);

is(
    say_number(1000000000),
    "one billion",
    "one billion",
);

is(
    say_number(987654321123),
    "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three",
    "a big number",
);

like(
    dies( sub { say_number - 1 } ),
    qr/input out of range/,
    "numbers below zero are out of range",
);

like(
    dies( sub { say_number 1000000000000 } ),
    qr/input out of range/,
    "numbers above 999,999,999,999 are out of range",
);

done_testing;
