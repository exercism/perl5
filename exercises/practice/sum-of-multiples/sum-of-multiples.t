#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use SumOfMultiples qw<sum_of_multiples>;

is(
    sum_of_multiples( [ 3, 5 ], 1 ),
    0,
    "no multiples within limit",
);

is(
    sum_of_multiples( [ 3, 5 ], 4 ),
    3,
    "one factor has multiples within limit",
);

is(
    sum_of_multiples( [3], 7 ),
    9,
    "more than one multiple within limit",
);

is(
    sum_of_multiples( [ 3, 5 ], 10 ),
    23,
    "more than one factor with multiples within limit",
);

is(
    sum_of_multiples( [ 3, 5 ], 100 ),
    2318,
    "each multiple is only counted once",
);

is(
    sum_of_multiples( [ 3, 5 ], 1000 ),
    233168,
    "a much larger limit",
);

is(
    sum_of_multiples( [ 7, 13, 17 ], 20 ),
    51,
    "three factors",
);

is(
    sum_of_multiples( [ 4, 6 ], 15 ),
    30,
    "factors not relatively prime",
);

is(
    sum_of_multiples( [ 5, 6, 8 ], 150 ),
    4419,
    "some pairs of factors relatively prime and some not",
);

is(
    sum_of_multiples( [ 5, 25 ], 51 ),
    275,
    "one factor is a multiple of another",
);

is(
    sum_of_multiples( [ 43, 47 ], 10000 ),
    2203160,
    "much larger factors",
);

is(
    sum_of_multiples( [1], 100 ),
    4950,
    "all numbers are multiples of 1",
);

is(
    sum_of_multiples( [], 10000 ),
    0,
    "no factors means an empty sum",
);

is(
    sum_of_multiples( [0], 1 ),
    0,
    "the only multiple of 0 is 0",
);

is(
    sum_of_multiples( [ 3, 0 ], 4 ),
    3,
    "the factor 0 does not affect the sum of multiples of other factors",
);

is(
    sum_of_multiples( [ 2, 3, 5, 7, 11 ], 10000 ),
    39614537,
    "solutions using include-exclude must extend to cardinality greater than 3",
);

done_testing;
