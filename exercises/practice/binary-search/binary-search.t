#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use BinarySearch qw<binary_search>;

imported_ok qw<binary_search> or bail_out;

is(
    binary_search( [6], 6 ),
    0,
    "finds a value in an array with one element",
);

is(
    binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 6 ),
    3,
    "finds a value in the middle of an array",
);

is(
    binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 1 ),
    0,
    "finds a value at the beginning of an array",
);

is(
    binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 11 ),
    6,
    "finds a value at the end of an array",
);

is(
    binary_search(
        [ 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634 ], 144
    ),
    9,
    "finds a value in an array of odd length",
);

is(
    binary_search( [ 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377 ], 21 ),
    5,
    "finds a value in an array of even length",
);

like(
    dies( sub { binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 7 ) } ),
    qr/value not in array/,
    "identifies that a value is not included in the array",
);

like(
    dies( sub { binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 0 ) } ),
    qr/value not in array/,
    "a value smaller than the array's smallest value is not found",
);

like(
    dies( sub { binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 13 ) } ),
    qr/value not in array/,
    "a value larger than the array's largest value is not found",
);

like(
    dies( sub { binary_search( [], 1 ) } ),
    qr/value not in array/,
    "nothing is found in an empty array",
);

like(
    dies( sub { binary_search( [ 1, 2 ], 0 ) } ),
    qr/value not in array/,
    "nothing is found when the left and right bounds cross",
);

done_testing;
