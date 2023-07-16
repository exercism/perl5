#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use SumOfMultiples qw<sum_of_multiples>;

imported_ok qw<sum_of_multiples> or bail_out;

is( # begin: 54aaab5a-ce86-4edc-8b40-d3ab2400a279
    sum_of_multiples( [ 3, 5 ], 1 ),
    0,
    "no multiples within limit",
); # end: 54aaab5a-ce86-4edc-8b40-d3ab2400a279

is( # begin: 361e4e50-c89b-4f60-95ef-5bc5c595490a
    sum_of_multiples( [ 3, 5 ], 4 ),
    3,
    "one factor has multiples within limit",
); # end: 361e4e50-c89b-4f60-95ef-5bc5c595490a

is( # begin: e644e070-040e-4ae0-9910-93c69fc3f7ce
    sum_of_multiples( [3], 7 ),
    9,
    "more than one multiple within limit",
); # end: e644e070-040e-4ae0-9910-93c69fc3f7ce

is( # begin: 607d6eb9-535c-41ce-91b5-3a61da3fa57f
    sum_of_multiples( [ 3, 5 ], 10 ),
    23,
    "more than one factor with multiples within limit",
); # end: 607d6eb9-535c-41ce-91b5-3a61da3fa57f

is( # begin: f47e8209-c0c5-4786-b07b-dc273bf86b9b
    sum_of_multiples( [ 3, 5 ], 100 ),
    2318,
    "each multiple is only counted once",
); # end: f47e8209-c0c5-4786-b07b-dc273bf86b9b

is( # begin: 28c4b267-c980-4054-93e9-07723db615ac
    sum_of_multiples( [ 3, 5 ], 1000 ),
    233168,
    "a much larger limit",
); # end: 28c4b267-c980-4054-93e9-07723db615ac

is( # begin: 09c4494d-ff2d-4e0f-8421-f5532821ee12
    sum_of_multiples( [ 7, 13, 17 ], 20 ),
    51,
    "three factors",
); # end: 09c4494d-ff2d-4e0f-8421-f5532821ee12

is( # begin: 2d0d5faa-f177-4ad6-bde9-ebb865083751
    sum_of_multiples( [ 4, 6 ], 15 ),
    30,
    "factors not relatively prime",
); # end: 2d0d5faa-f177-4ad6-bde9-ebb865083751

is( # begin: ece8f2e8-96aa-4166-bbb7-6ce71261e354
    sum_of_multiples( [ 5, 6, 8 ], 150 ),
    4419,
    "some pairs of factors relatively prime and some not",
); # end: ece8f2e8-96aa-4166-bbb7-6ce71261e354

is( # begin: 624fdade-6ffb-400e-8472-456a38c171c0
    sum_of_multiples( [ 5, 25 ], 51 ),
    275,
    "one factor is a multiple of another",
); # end: 624fdade-6ffb-400e-8472-456a38c171c0

is( # begin: 949ee7eb-db51-479c-b5cb-4a22b40ac057
    sum_of_multiples( [ 43, 47 ], 10000 ),
    2203160,
    "much larger factors",
); # end: 949ee7eb-db51-479c-b5cb-4a22b40ac057

is( # begin: 41093673-acbd-482c-ab80-d00a0cbedecd
    sum_of_multiples( [1], 100 ),
    4950,
    "all numbers are multiples of 1",
); # end: 41093673-acbd-482c-ab80-d00a0cbedecd

is( # begin: 1730453b-baaa-438e-a9c2-d754497b2a76
    sum_of_multiples( [], 10000 ),
    0,
    "no factors means an empty sum",
); # end: 1730453b-baaa-438e-a9c2-d754497b2a76

is( # begin: 214a01e9-f4bf-45bb-80f1-1dce9fbb0310
    sum_of_multiples( [0], 1 ),
    0,
    "the only multiple of 0 is 0",
); # end: 214a01e9-f4bf-45bb-80f1-1dce9fbb0310

is( # begin: c423ae21-a0cb-4ec7-aeb1-32971af5b510
    sum_of_multiples( [ 3, 0 ], 4 ),
    3,
    "the factor 0 does not affect the sum of multiples of other factors",
); # end: c423ae21-a0cb-4ec7-aeb1-32971af5b510

is( # begin: 17053ba9-112f-4ac0-aadb-0519dd836342
    sum_of_multiples( [ 2, 3, 5, 7, 11 ], 10000 ),
    39614537,
    "solutions using include-exclude must extend to cardinality greater than 3",
); # end: 17053ba9-112f-4ac0-aadb-0519dd836342

done_testing;
