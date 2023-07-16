#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PythagoreanTriplet qw<triplets_with_sum>;

imported_ok qw<triplets_with_sum> or bail_out;

is( # begin: a19de65d-35b8-4480-b1af-371d9541e706
    triplets_with_sum(12),
    array {
        item [ 3, 4, 5 ];
        end;
    },
    "triplets whose sum is 12",
); # end: a19de65d-35b8-4480-b1af-371d9541e706

is( # begin: 48b21332-0a3d-43b2-9a52-90b2a6e5c9f5
    triplets_with_sum(108),
    array {
        item [ 27, 36, 45 ];
        end;
    },
    "triplets whose sum is 108",
); # end: 48b21332-0a3d-43b2-9a52-90b2a6e5c9f5

is( # begin: dffc1266-418e-4daa-81af-54c3e95c3bb5
    triplets_with_sum(1000),
    array {
        item [ 200, 375, 425 ];
        end;
    },
    "triplets whose sum is 1000",
); # end: dffc1266-418e-4daa-81af-54c3e95c3bb5

is( # begin: 5f86a2d4-6383-4cce-93a5-e4489e79b186
    triplets_with_sum(1001),
    array {
        end;
    },
    "no matching triplets for 1001",
); # end: 5f86a2d4-6383-4cce-93a5-e4489e79b186

is( # begin: bf17ba80-1596-409a-bb13-343bdb3b2904
    triplets_with_sum(90),
    array {
        item [ 9,  40, 41 ];
        item [ 15, 36, 39 ];
        end;
    },
    "returns all matching triplets",
); # end: bf17ba80-1596-409a-bb13-343bdb3b2904

is( # begin: 9d8fb5d5-6c6f-42df-9f95-d3165963ac57
    triplets_with_sum(840),
    array {
        item [ 40,  399, 401 ];
        item [ 56,  390, 394 ];
        item [ 105, 360, 375 ];
        item [ 120, 350, 370 ];
        item [ 140, 336, 364 ];
        item [ 168, 315, 357 ];
        item [ 210, 280, 350 ];
        item [ 240, 252, 348 ];
        end;
    },
    "several matching triplets",
); # end: 9d8fb5d5-6c6f-42df-9f95-d3165963ac57

is( # begin: f5be5734-8aa0-4bd1-99a2-02adcc4402b4
    triplets_with_sum(30000),
    array {
        item [ 1200, 14375, 14425 ];
        item [ 1875, 14000, 14125 ];
        item [ 5000, 12000, 13000 ];
        item [ 6000, 11250, 12750 ];
        item [ 7500, 10000, 12500 ];
        end;
    },
    "triplets for large number",
); # end: f5be5734-8aa0-4bd1-99a2-02adcc4402b4

done_testing;
