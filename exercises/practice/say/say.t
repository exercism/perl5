#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Say qw<say_number>;

imported_ok qw<say_number> or bail_out;

is(    # begin: 5d22a120-ba0c-428c-bd25-8682235d83e8
    say_number(0),
    "zero",
    "zero",
);     # end: 5d22a120-ba0c-428c-bd25-8682235d83e8

is(    # begin: 9b5eed77-dbf6-439d-b920-3f7eb58928f6
    say_number(1),
    "one",
    "one",
);     # end: 9b5eed77-dbf6-439d-b920-3f7eb58928f6

is(    # begin: 7c499be1-612e-4096-a5e1-43b2f719406d
    say_number(14),
    "fourteen",
    "fourteen",
);     # end: 7c499be1-612e-4096-a5e1-43b2f719406d

is(    # begin: f541dd8e-f070-4329-92b4-b7ce2fcf06b4
    say_number(20),
    "twenty",
    "twenty",
);     # end: f541dd8e-f070-4329-92b4-b7ce2fcf06b4

is(    # begin: d78601eb-4a84-4bfa-bf0e-665aeb8abe94
    say_number(22),
    "twenty-two",
    "twenty-two",
);     # end: d78601eb-4a84-4bfa-bf0e-665aeb8abe94

is(    # begin: f010d4ca-12c9-44e9-803a-27789841adb1
    say_number(30),
    "thirty",
    "thirty",
);     # end: f010d4ca-12c9-44e9-803a-27789841adb1

is(    # begin: 738ce12d-ee5c-4dfb-ad26-534753a98327
    say_number(99),
    "ninety-nine",
    "ninety-nine",
);     # end: 738ce12d-ee5c-4dfb-ad26-534753a98327

is(    # begin: e417d452-129e-4056-bd5b-6eb1df334dce
    say_number(100),
    "one hundred",
    "one hundred",
);     # end: e417d452-129e-4056-bd5b-6eb1df334dce

is(    # begin: d6924f30-80ba-4597-acf6-ea3f16269da8
    say_number(123),
    "one hundred twenty-three",
    "one hundred twenty-three",
);     # end: d6924f30-80ba-4597-acf6-ea3f16269da8

is(    # begin: 2f061132-54bc-4fd4-b5df-0a3b778959b9
    say_number(200),
    "two hundred",
    "two hundred",
);     # end: 2f061132-54bc-4fd4-b5df-0a3b778959b9

is(    # begin: feed6627-5387-4d38-9692-87c0dbc55c33
    say_number(999),
    "nine hundred ninety-nine",
    "nine hundred ninety-nine",
);     # end: feed6627-5387-4d38-9692-87c0dbc55c33

is(    # begin: 3d83da89-a372-46d3-b10d-de0c792432b3
    say_number(1000),
    "one thousand",
    "one thousand",
);     # end: 3d83da89-a372-46d3-b10d-de0c792432b3

is(    # begin: 865af898-1d5b-495f-8ff0-2f06d3c73709
    say_number(1234),
    "one thousand two hundred thirty-four",
    "one thousand two hundred thirty-four",
);     # end: 865af898-1d5b-495f-8ff0-2f06d3c73709

is(    # begin: b6a3f442-266e-47a3-835d-7f8a35f6cf7f
    say_number(1000000),
    "one million",
    "one million",
);     # end: b6a3f442-266e-47a3-835d-7f8a35f6cf7f

is(    # begin: 2cea9303-e77e-4212-b8ff-c39f1978fc70
    say_number(1002345),
    "one million two thousand three hundred forty-five",
    "one million two thousand three hundred forty-five",
);     # end: 2cea9303-e77e-4212-b8ff-c39f1978fc70

is(    # begin: 3e240eeb-f564-4b80-9421-db123f66a38f
    say_number(1000000000),
    "one billion",
    "one billion",
);     # end: 3e240eeb-f564-4b80-9421-db123f66a38f

is(    # begin: 9a43fed1-c875-4710-8286-5065d73b8a9e
    say_number(987654321123),
    "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three",
    "a big number",
);     # end: 9a43fed1-c875-4710-8286-5065d73b8a9e

like(  # begin: 49a6a17b-084e-423e-994d-a87c0ecc05ef
    dies( sub { say_number - 1 } ),
    qr/input out of range/,
    "numbers below zero are out of range",
);     # end: 49a6a17b-084e-423e-994d-a87c0ecc05ef

like(  # begin: 4d6492eb-5853-4d16-9d34-b0f61b261fd9
    dies( sub { say_number 1000000000000 } ),
    qr/input out of range/,
    "numbers above 999,999,999,999 are out of range",
);     # end: 4d6492eb-5853-4d16-9d34-b0f61b261fd9

done_testing;
