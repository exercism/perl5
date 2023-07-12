#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PythagoreanTriplet qw<triplets_with_sum>;

imported_ok qw<triplets_with_sum> or bail_out;

is(
    triplets_with_sum(12),
    [ [ 3, 4, 5 ] ],
    "triplets whose sum is 12",
);

is(
    triplets_with_sum(108),
    [ [ 27, 36, 45 ] ],
    "triplets whose sum is 108",
);

is(
    triplets_with_sum(1000),
    [ [ 200, 375, 425 ] ],
    "triplets whose sum is 1000",
);

is(
    triplets_with_sum(1001),
    [],
    "no matching triplets for 1001",
);

is(
    triplets_with_sum(90),
    [ [ 9, 40, 41 ], [ 15, 36, 39 ] ],
    "returns all matching triplets",
);

is(
    triplets_with_sum(840),
    [   [ 40,  399, 401 ],
        [ 56,  390, 394 ],
        [ 105, 360, 375 ],
        [ 120, 350, 370 ],
        [ 140, 336, 364 ],
        [ 168, 315, 357 ],
        [ 210, 280, 350 ],
        [ 240, 252, 348 ]
    ],
    "several matching triplets",
);

is(
    triplets_with_sum(30000),
    [   [ 1200, 14375, 14425 ],
        [ 1875, 14000, 14125 ],
        [ 5000, 12000, 13000 ],
        [ 6000, 11250, 12750 ],
        [ 7500, 10000, 12500 ]
    ],
    "triplets for large number",
);

done_testing;
