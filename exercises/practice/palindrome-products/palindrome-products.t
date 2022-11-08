#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PalindromeProducts qw<smallest_palindrome largest_palindrome>;

imported_ok qw<smallest_palindrome largest_palindrome> or bail_out;

is(
    smallest_palindrome( 1, 9 ),
    { factors => [ [ 1, 1 ] ], value => 1 },
    "find the smallest palindrome from single digit factors",
);

is(
    largest_palindrome( 1, 9 ),
    { factors => [ [ 1, 9 ], [ 3, 3 ] ], value => 9 },
    "find the largest palindrome from single digit factors",
);

is(
    smallest_palindrome( 10, 99 ),
    { factors => [ [ 11, 11 ] ], value => 121 },
    "find the smallest palindrome from double digit factors",
);

is(
    largest_palindrome( 10, 99 ),
    { factors => [ [ 91, 99 ] ], value => 9009 },
    "find the largest palindrome from double digit factors",
);

is(
    smallest_palindrome( 100, 999 ),
    { factors => [ [ 101, 101 ] ], value => 10201 },
    "find the smallest palindrome from triple digit factors",
);

is(
    largest_palindrome( 100, 999 ),
    { factors => [ [ 913, 993 ] ], value => 906609 },
    "find the largest palindrome from triple digit factors",
);

is(
    smallest_palindrome( 1000, 9999 ),
    { factors => [ [ 1001, 1001 ] ], value => 1002001 },
    "find the smallest palindrome from four digit factors",
);

is(
    largest_palindrome( 1000, 9999 ),
    { factors => [ [ 9901, 9999 ] ], value => 99000099 },
    "find the largest palindrome from four digit factors",
);

is(
    smallest_palindrome( 1002, 1003 ),
    { factors => [], value => undef },
    "empty result for smallest if no palindrome in the range",
);

is(
    largest_palindrome( 15, 15 ),
    { factors => [], value => undef },
    "empty result for largest if no palindrome in the range",
);

like(
    dies( sub { smallest_palindrome( 10000, 1 ) } ),
    qr/min must be <= max/,
    "error result for smallest if min is more than max",
);

like(
    dies( sub { largest_palindrome( 2, 1 ) } ),
    qr/min must be <= max/,
    "error result for largest if min is more than max",
);

done_testing;
