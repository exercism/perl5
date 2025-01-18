#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Knapsack qw<maximum_value>;

is( # begin: 3993a824-c20e-493d-b3c9-ee8a7753ee59
    maximum_value( [], 100 ),
    0,
    "no items",
); # end: 3993a824-c20e-493d-b3c9-ee8a7753ee59

is( # begin: 1d39e98c-6249-4a8b-912f-87cb12e506b0
    maximum_value( [ { value => 1, weight => 100 } ], 10 ),
    0,
    "one item, too heavy",
); # end: 1d39e98c-6249-4a8b-912f-87cb12e506b0

is( # begin: 833ea310-6323-44f2-9d27-a278740ffbd8
    maximum_value( [ { value => 5, weight => 2 }, { value => 5, weight => 2 }, { value => 5, weight => 2 }, { value => 5, weight => 2 }, { value => 21, weight => 10 } ], 10 ),
    21,
    "five items (cannot be greedy by weight)",
); # end: 833ea310-6323-44f2-9d27-a278740ffbd8

is( # begin: 277cdc52-f835-4c7d-872b-bff17bab2456
    maximum_value( [ { value => 20, weight => 2 }, { value => 20, weight => 2 }, { value => 20, weight => 2 }, { value => 20, weight => 2 }, { value => 50, weight => 10 } ], 10 ),
    80,
    "five items (cannot be greedy by value)",
); # end: 277cdc52-f835-4c7d-872b-bff17bab2456

is( # begin: 81d8e679-442b-4f7a-8a59-7278083916c9
    maximum_value( [ { value => 10, weight => 5 }, { value => 40, weight => 4 }, { value => 30, weight => 6 }, { value => 50, weight => 4 } ], 10 ),
    90,
    "example knapsack",
); # end: 81d8e679-442b-4f7a-8a59-7278083916c9

is( # begin: f23a2449-d67c-4c26-bf3e-cde020f27ecc
    maximum_value( [ { value => 350, weight => 25 }, { value => 400, weight => 35 }, { value => 450, weight => 45 }, { value => 20, weight => 5 }, { value => 70, weight => 25 }, { value => 8, weight => 3 }, { value => 5, weight => 2 }, { value => 5, weight => 2 } ], 104 ),
    900,
    "8 items",
); # end: f23a2449-d67c-4c26-bf3e-cde020f27ecc

is( # begin: 7c682ae9-c385-4241-a197-d2fa02c81a11
    maximum_value( [ { value => 135, weight => 70 }, { value => 139, weight => 73 }, { value => 149, weight => 77 }, { value => 150, weight => 80 }, { value => 156, weight => 82 }, { value => 163, weight => 87 }, { value => 173, weight => 90 }, { value => 184, weight => 94 }, { value => 192, weight => 98 }, { value => 201, weight => 106 }, { value => 210, weight => 110 }, { value => 214, weight => 113 }, { value => 221, weight => 115 }, { value => 229, weight => 118 }, { value => 240, weight => 120 } ], 750 ),
    1458,
    "15 items",
); # end: 7c682ae9-c385-4241-a197-d2fa02c81a11

done_testing;
