#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Strain       qw<keep discard>;
use experimental qw<signatures>;
use List::Util   qw<any>;

is( # begin: 26af8c32-ba6a-4eb3-aa0a-ebd8f136e003
    keep(
        [],
        sub ($x) {1},
    ),
    [],
    "keep on empty list returns empty list",
); # end: 26af8c32-ba6a-4eb3-aa0a-ebd8f136e003

is( # begin: f535cb4d-e99b-472a-bd52-9fa0ffccf454
    keep(
        [ 1, 3, 5 ],
        sub ($x) {1},
    ),
    [ 1, 3, 5 ],
    "keeps everything",
); # end: f535cb4d-e99b-472a-bd52-9fa0ffccf454

is( # begin: 950b8e8e-f628-42a8-85e2-9b30f09cde38
    keep(
        [ 1, 3, 5 ],
        sub ($x) {0},
    ),
    [],
    "keeps nothing",
); # end: 950b8e8e-f628-42a8-85e2-9b30f09cde38

is( # begin: 92694259-6e76-470c-af87-156bdf75018a
    keep(
        [ 1, 2, 3 ],
        sub ($x) { $x % 2 == 1 },
    ),
    [ 1, 3 ],
    "keeps first and last",
); # end: 92694259-6e76-470c-af87-156bdf75018a

is( # begin: 938f7867-bfc7-449e-a21b-7b00cbb56994
    keep(
        [ 1, 2, 3 ],
        sub ($x) { $x % 2 == 0 },
    ),
    [2],
    "keeps neither first nor last",
); # end: 938f7867-bfc7-449e-a21b-7b00cbb56994

is( # begin: 8908e351-4437-4d2b-a0f7-770811e48816
    keep(
        [ "apple", "zebra", "banana", "zombies", "cherimoya", "zealot" ],
        sub ($x) { substr( $x, 0, 1 ) eq 'z' },
    ),
    [ "zebra", "zombies", "zealot" ],
    "keeps strings",
); # end: 8908e351-4437-4d2b-a0f7-770811e48816

is( # begin: 2728036b-102a-4f1e-a3ef-eac6160d876a
    keep(
        [ [ 1, 2, 3 ], [ 5, 5, 5 ], [ 5, 1, 2 ], [ 2, 1, 2 ], [ 1, 5, 2 ], [ 2, 2, 1 ], [ 1, 2, 5 ] ],
        sub ($x) { any { $_ == 5 } @{$x} },
    ),
    [ [ 5, 5, 5 ], [ 5, 1, 2 ], [ 1, 5, 2 ], [ 1, 2, 5 ] ],
    "keeps lists",
); # end: 2728036b-102a-4f1e-a3ef-eac6160d876a

is( # begin: ef16beb9-8d84-451a-996a-14e80607fce6
    discard(
        [],
        sub ($x) {1},
    ),
    [],
    "discard on empty list returns empty list",
); # end: ef16beb9-8d84-451a-996a-14e80607fce6

is( # begin: 2f42f9bc-8e06-4afe-a222-051b5d8cd12a
    discard(
        [ 1, 3, 5 ],
        sub ($x) {1},
    ),
    [],
    "discards everything",
); # end: 2f42f9bc-8e06-4afe-a222-051b5d8cd12a

is( # begin: ca990fdd-08c2-4f95-aa50-e0f5e1d6802b
    discard(
        [ 1, 3, 5 ],
        sub ($x) {0},
    ),
    [ 1, 3, 5 ],
    "discards nothing",
); # end: ca990fdd-08c2-4f95-aa50-e0f5e1d6802b

is( # begin: 71595dae-d283-48ca-a52b-45fa96819d2f
    discard(
        [ 1, 2, 3 ],
        sub ($x) { $x % 2 == 1 },
    ),
    [2],
    "discards first and last",
); # end: 71595dae-d283-48ca-a52b-45fa96819d2f

is( # begin: ae141f79-f86d-4567-b407-919eaca0f3dd
    discard(
        [ 1, 2, 3 ],
        sub ($x) { $x % 2 == 0 },
    ),
    [ 1, 3 ],
    "discards neither first nor last",
); # end: ae141f79-f86d-4567-b407-919eaca0f3dd

is( # begin: daf25b36-a59f-4f29-bcfe-302eb4e43609
    discard(
        [ "apple", "zebra", "banana", "zombies", "cherimoya", "zealot" ],
        sub ($x) { substr( $x, 0, 1 ) eq 'z' },
    ),
    [ "apple", "banana", "cherimoya" ],
    "discards strings",
); # end: daf25b36-a59f-4f29-bcfe-302eb4e43609

is( # begin: a38d03f9-95ad-4459-80d1-48e937e4acaf
    discard(
        [ [ 1, 2, 3 ], [ 5, 5, 5 ], [ 5, 1, 2 ], [ 2, 1, 2 ], [ 1, 5, 2 ], [ 2, 2, 1 ], [ 1, 2, 5 ] ],
        sub ($x) { any { $_ == 5 } @{$x} },
    ),
    [ [ 1, 2, 3 ], [ 2, 1, 2 ], [ 2, 2, 1 ] ],
    "discards lists",
); # end: a38d03f9-95ad-4459-80d1-48e937e4acaf

done_testing;
