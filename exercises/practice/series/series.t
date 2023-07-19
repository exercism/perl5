#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Series qw<slices>;

is(
    slices( "1", 1 ),
    ["1"],
    "slices of one from one",
);

is(
    slices( "12", 1 ),
    [ "1", "2" ],
    "slices of one from two",
);

is(
    slices( "35", 2 ),
    ["35"],
    "slices of two",
);

is(
    slices( "9142", 2 ),
    [ "91", "14", "42" ],
    "slices of two overlap",
);

is(
    slices( "777777", 3 ),
    [ "777", "777", "777", "777" ],
    "slices can include duplicates",
);

is(
    slices( "918493904243", 5 ),
    [ "91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243" ],
    "slices of a long series",
);

like(
    dies( sub { slices "12345", 6 } ),
    qr/slice length cannot be greater than series length/,
    "slice length is too large",
);

like(
    dies( sub { slices "12345", 42 } ),
    qr/slice length cannot be greater than series length/,
    "slice length is way too large",
);

like(
    dies( sub { slices "12345", 0 } ),
    qr/slice length cannot be zero/,
    "slice length cannot be zero",
);

like(
    dies( sub { slices "123", -1 } ),
    qr/slice length cannot be negative/,
    "slice length cannot be negative",
);

like(
    dies( sub { slices "", 1 } ),
    qr/series cannot be empty/,
    "empty series is invalid",
);

done_testing;
