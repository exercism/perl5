#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use TwoBucket qw<measure>;

is( # begin: a6f2b4ba-065f-4dca-b6f0-e3eee51cb661
    measure( 3, 5, 1, "one" ),
    { goalBucket => "one", moves => 4, otherBucket => 5 },
    "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket one"
); # end: a6f2b4ba-065f-4dca-b6f0-e3eee51cb661

is( # begin: 6c4ea451-9678-4926-b9b3-68364e066d40
    measure( 3, 5, 1, "two" ),
    { goalBucket => "two", moves => 8, otherBucket => 3 },
    "Measure using bucket one of size 3 and bucket two of size 5 - start with bucket two"
); # end: 6c4ea451-9678-4926-b9b3-68364e066d40

is( # begin: 3389f45e-6a56-46d5-9607-75aa930502ff
    measure( 7, 11, 2, "one" ),
    { goalBucket => "one", moves => 14, otherBucket => 11 },
    "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket one"
); # end: 3389f45e-6a56-46d5-9607-75aa930502ff

is( # begin: fe0ff9a0-3ea5-4bf7-b17d-6d4243961aa1
    measure( 7, 11, 2, "two" ),
    { goalBucket => "two", moves => 18, otherBucket => 7 },
    "Measure using bucket one of size 7 and bucket two of size 11 - start with bucket two"
); # end: fe0ff9a0-3ea5-4bf7-b17d-6d4243961aa1

is( # begin: 0ee1f57e-da84-44f7-ac91-38b878691602
    measure( 1, 3, 3, "two" ),
    { goalBucket => "two", moves => 1, otherBucket => 0 },
    "Measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two"
); # end: 0ee1f57e-da84-44f7-ac91-38b878691602

is( # begin: eb329c63-5540-4735-b30b-97f7f4df0f84
    measure( 2, 3, 3, "one" ),
    { goalBucket => "two", moves => 2, otherBucket => 2 },
    "Measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two"
); # end: eb329c63-5540-4735-b30b-97f7f4df0f84

like( # begin: 449be72d-b10a-4f4b-a959-ca741e333b72
    dies { measure( 6, 15, 5, "one" ) },
    qr/impossible/,
    "Not possible to reach the goal"
); # end: 449be72d-b10a-4f4b-a959-ca741e333b72

is( # begin: aac38b7a-77f4-4d62-9b91-8846d533b054
    measure( 6, 15, 9, "one" ),
    { goalBucket => "two", moves => 10, otherBucket => 0 },
    "With the same buckets but a different goal, then it is possible"
); # end: aac38b7a-77f4-4d62-9b91-8846d533b054

like( # begin: 74633132-0ccf-49de-8450-af4ab2e3b299
    dies { measure( 5, 7, 8, "one" ) },
    qr/impossible/,
    "Goal larger than both buckets is impossible"
); # end: 74633132-0ccf-49de-8450-af4ab2e3b299

done_testing;
