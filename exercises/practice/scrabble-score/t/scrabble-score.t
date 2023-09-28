#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Scrabble qw<scrabble_score>;

is( # begin: f46cda29-1ca5-4ef2-bd45-388a767e3db2
    scrabble_score("a"),
    1,
    "lowercase letter",
); # end: f46cda29-1ca5-4ef2-bd45-388a767e3db2

is( # begin: f7794b49-f13e-45d1-a933-4e48459b2201
    scrabble_score("A"),
    1,
    "uppercase letter",
); # end: f7794b49-f13e-45d1-a933-4e48459b2201

is( # begin: eaba9c76-f9fa-49c9-a1b0-d1ba3a5b31fa
    scrabble_score("f"),
    4,
    "valuable letter",
); # end: eaba9c76-f9fa-49c9-a1b0-d1ba3a5b31fa

is( # begin: f3c8c94e-bb48-4da2-b09f-e832e103151e
    scrabble_score("at"),
    2,
    "short word",
); # end: f3c8c94e-bb48-4da2-b09f-e832e103151e

is( # begin: 71e3d8fa-900d-4548-930e-68e7067c4615
    scrabble_score("zoo"),
    12,
    "short, valuable word",
); # end: 71e3d8fa-900d-4548-930e-68e7067c4615

is( # begin: d3088ad9-570c-4b51-8764-c75d5a430e99
    scrabble_score("street"),
    6,
    "medium word",
); # end: d3088ad9-570c-4b51-8764-c75d5a430e99

is( # begin: fa20c572-ad86-400a-8511-64512daac352
    scrabble_score("quirky"),
    22,
    "medium, valuable word",
); # end: fa20c572-ad86-400a-8511-64512daac352

is( # begin: 9336f0ba-9c2b-4fa0-bd1c-2e2d328cf967
    scrabble_score("OxyphenButazone"),
    41,
    "long, mixed-case word",
); # end: 9336f0ba-9c2b-4fa0-bd1c-2e2d328cf967

is( # begin: 1e34e2c3-e444-4ea7-b598-3c2b46fd2c10
    scrabble_score("pinata"),
    8,
    "english-like word",
); # end: 1e34e2c3-e444-4ea7-b598-3c2b46fd2c10

is( # begin: 4efe3169-b3b6-4334-8bae-ff4ef24a7e4f
    scrabble_score(""),
    0,
    "empty input",
); # end: 4efe3169-b3b6-4334-8bae-ff4ef24a7e4f

is( # begin: 3b305c1c-f260-4e15-a5b5-cb7d3ea7c3d7
    scrabble_score("abcdefghijklmnopqrstuvwxyz"),
    87,
    "entire alphabet available",
); # end: 3b305c1c-f260-4e15-a5b5-cb7d3ea7c3d7

done_testing;
