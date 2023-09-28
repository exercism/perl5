#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use BinarySearch qw<binary_search>;

is( # begin: b55c24a9-a98d-4379-a08c-2adcf8ebeee8
    binary_search( [6], 6 ),
    0,
    "finds a value in an array with one element",
); # end: b55c24a9-a98d-4379-a08c-2adcf8ebeee8

is( # begin: 73469346-b0a0-4011-89bf-989e443d503d
    binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 6 ),
    3,
    "finds a value in the middle of an array",
); # end: 73469346-b0a0-4011-89bf-989e443d503d

is( # begin: 327bc482-ab85-424e-a724-fb4658e66ddb
    binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 1 ),
    0,
    "finds a value at the beginning of an array",
); # end: 327bc482-ab85-424e-a724-fb4658e66ddb

is( # begin: f9f94b16-fe5e-472c-85ea-c513804c7d59
    binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 11 ),
    6,
    "finds a value at the end of an array",
); # end: f9f94b16-fe5e-472c-85ea-c513804c7d59

is( # begin: f0068905-26e3-4342-856d-ad153cadb338
    binary_search( [ 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634 ], 144 ),
    9,
    "finds a value in an array of odd length",
); # end: f0068905-26e3-4342-856d-ad153cadb338

is( # begin: fc316b12-c8b3-4f5e-9e89-532b3389de8c
    binary_search( [ 1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377 ], 21 ),
    5,
    "finds a value in an array of even length",
); # end: fc316b12-c8b3-4f5e-9e89-532b3389de8c

like( # begin: da7db20a-354f-49f7-a6a1-650a54998aa6
    dies( sub { binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 7 ) } ),
    qr/value not in array/,
    "identifies that a value is not included in the array",
); # end: da7db20a-354f-49f7-a6a1-650a54998aa6

like( # begin: 95d869ff-3daf-4c79-b622-6e805c675f97
    dies( sub { binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 0 ) } ),
    qr/value not in array/,
    "a value smaller than the array's smallest value is not found",
); # end: 95d869ff-3daf-4c79-b622-6e805c675f97

like( # begin: 8b24ef45-6e51-4a94-9eac-c2bf38fdb0ba
    dies( sub { binary_search( [ 1, 3, 4, 6, 8, 9, 11 ], 13 ) } ),
    qr/value not in array/,
    "a value larger than the array's largest value is not found",
); # end: 8b24ef45-6e51-4a94-9eac-c2bf38fdb0ba

like( # begin: f439a0fa-cf42-4262-8ad1-64bf41ce566a
    dies( sub { binary_search( [], 1 ) } ),
    qr/value not in array/,
    "nothing is found in an empty array",
); # end: f439a0fa-cf42-4262-8ad1-64bf41ce566a

like( # begin: 2c353967-b56d-40b8-acff-ce43115eed64
    dies( sub { binary_search( [ 1, 2 ], 0 ) } ),
    qr/value not in array/,
    "nothing is found when the left and right bounds cross",
); # end: 2c353967-b56d-40b8-acff-ce43115eed64

done_testing;
