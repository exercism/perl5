#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PalindromeProducts qw<smallest_palindrome largest_palindrome>;

imported_ok qw<smallest_palindrome largest_palindrome> or bail_out;

is(    # begin: 5cff78fe-cf02-459d-85c2-ce584679f887
    smallest_palindrome( 1, 9 ),
    { factors => [ [ 1, 1 ] ], value => 1 },
    "find the smallest palindrome from single digit factors",
);     # end: 5cff78fe-cf02-459d-85c2-ce584679f887

is(    # begin: 0853f82c-5fc4-44ae-be38-fadb2cced92d
    largest_palindrome( 1, 9 ),
    { factors => [ [ 1, 9 ], [ 3, 3 ] ], value => 9 },
    "find the largest palindrome from single digit factors",
);     # end: 0853f82c-5fc4-44ae-be38-fadb2cced92d

is(    # begin: 66c3b496-bdec-4103-9129-3fcb5a9063e1
    smallest_palindrome( 10, 99 ),
    { factors => [ [ 11, 11 ] ], value => 121 },
    "find the smallest palindrome from double digit factors",
);     # end: 66c3b496-bdec-4103-9129-3fcb5a9063e1

is(    # begin: a10682ae-530a-4e56-b89d-69664feafe53
    largest_palindrome( 10, 99 ),
    { factors => [ [ 91, 99 ] ], value => 9009 },
    "find the largest palindrome from double digit factors",
);     # end: a10682ae-530a-4e56-b89d-69664feafe53

is(    # begin: cecb5a35-46d1-4666-9719-fa2c3af7499d
    smallest_palindrome( 100, 999 ),
    { factors => [ [ 101, 101 ] ], value => 10201 },
    "find the smallest palindrome from triple digit factors",
);     # end: cecb5a35-46d1-4666-9719-fa2c3af7499d

is(    # begin: edab43e1-c35f-4ea3-8c55-2f31dddd92e5
    largest_palindrome( 100, 999 ),
    { factors => [ [ 913, 993 ] ], value => 906609 },
    "find the largest palindrome from triple digit factors",
);     # end: edab43e1-c35f-4ea3-8c55-2f31dddd92e5

is(    # begin: 4f802b5a-9d74-4026-a70f-b53ff9234e4e
    smallest_palindrome( 1000, 9999 ),
    { factors => [ [ 1001, 1001 ] ], value => 1002001 },
    "find the smallest palindrome from four digit factors",
);     # end: 4f802b5a-9d74-4026-a70f-b53ff9234e4e

is(    # begin: 787525e0-a5f9-40f3-8cb2-23b52cf5d0be
    largest_palindrome( 1000, 9999 ),
    { factors => [ [ 9901, 9999 ] ], value => 99000099 },
    "find the largest palindrome from four digit factors",
);     # end: 787525e0-a5f9-40f3-8cb2-23b52cf5d0be

is(    # begin: 58fb1d63-fddb-4409-ab84-a7a8e58d9ea0
    smallest_palindrome( 1002, 1003 ),
    { factors => [], value => undef },
    "empty result for smallest if no palindrome in the range",
);     # end: 58fb1d63-fddb-4409-ab84-a7a8e58d9ea0

is(    # begin: 9de9e9da-f1d9-49a5-8bfc-3d322efbdd02
    largest_palindrome( 15, 15 ),
    { factors => [], value => undef },
    "empty result for largest if no palindrome in the range",
);     # end: 9de9e9da-f1d9-49a5-8bfc-3d322efbdd02

like(  # begin: 12e73aac-d7ee-4877-b8aa-2aa3dcdb9f8a
    dies( sub { smallest_palindrome( 10000, 1 ) } ),
    qr/min must be <= max/,
    "error result for smallest if min is more than max",
);     # end: 12e73aac-d7ee-4877-b8aa-2aa3dcdb9f8a

like(  # begin: eeeb5bff-3f47-4b1e-892f-05829277bd74
    dies( sub { largest_palindrome( 2, 1 ) } ),
    qr/min must be <= max/,
    "error result for largest if min is more than max",
);     # end: eeeb5bff-3f47-4b1e-892f-05829277bd74

done_testing;
