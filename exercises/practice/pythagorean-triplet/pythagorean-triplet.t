#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PythagoreanTriplet qw<triplets_with_sum>;

is(
    triplets_with_sum(12),
    array {
        item [ 3, 4, 5 ];
        end;
    },
    "triplets whose sum is 12",
);

is(
    triplets_with_sum(108),
    array {
        item [ 27, 36, 45 ];
        end;
    },
    "triplets whose sum is 108",
);

is(
    triplets_with_sum(1000),
    array {
        item [ 200, 375, 425 ];
        end;
    },
    "triplets whose sum is 1000",
);

is(
    triplets_with_sum(1001),
    array {
        end;
    },
    "no matching triplets for 1001",
);

is(
    triplets_with_sum(90),
    array {
        item [ 9,  40, 41 ];
        item [ 15, 36, 39 ];
        end;
    },
    "returns all matching triplets",
);

is(
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
);

is(
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
);

done_testing;
