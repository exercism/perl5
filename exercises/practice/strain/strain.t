#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Strain       qw<keep discard>;
use experimental qw<signatures>;
use List::Util   qw<any>;

is(
    keep(
        [],
        sub ($x) {1},
    ),
    [],
    "keep on empty list returns empty list",
);

is(
    keep(
        [ 1, 3, 5 ],
        sub ($x) {1},
    ),
    [ 1, 3, 5 ],
    "keeps everything",
);

is(
    keep(
        [ 1, 3, 5 ],
        sub ($x) {0},
    ),
    [],
    "keeps nothing",
);

is(
    keep(
        [ 1, 2, 3 ],
        sub ($x) { $x % 2 == 1 },
    ),
    [ 1, 3 ],
    "keeps first and last",
);

is(
    keep(
        [ 1, 2, 3 ],
        sub ($x) { $x % 2 == 0 },
    ),
    [2],
    "keeps neither first nor last",
);

is(
    keep(
        [ "apple", "zebra", "banana", "zombies", "cherimoya", "zealot" ],
        sub ($x) { substr( $x, 0, 1 ) eq 'z' },
    ),
    [ "zebra", "zombies", "zealot" ],
    "keeps strings",
);

is(
    keep(
        [ [ 1, 2, 3 ], [ 5, 5, 5 ], [ 5, 1, 2 ], [ 2, 1, 2 ], [ 1, 5, 2 ], [ 2, 2, 1 ], [ 1, 2, 5 ] ],
        sub ($x) { any { $_ == 5 } @{$x} },
    ),
    [ [ 5, 5, 5 ], [ 5, 1, 2 ], [ 1, 5, 2 ], [ 1, 2, 5 ] ],
    "keeps lists",
);

is(
    discard(
        [],
        sub ($x) {1},
    ),
    [],
    "discard on empty list returns empty list",
);

is(
    discard(
        [ 1, 3, 5 ],
        sub ($x) {1},
    ),
    [],
    "discards everything",
);

is(
    discard(
        [ 1, 3, 5 ],
        sub ($x) {0},
    ),
    [ 1, 3, 5 ],
    "discards nothing",
);

is(
    discard(
        [ 1, 2, 3 ],
        sub ($x) { $x % 2 == 1 },
    ),
    [2],
    "discards first and last",
);

is(
    discard(
        [ 1, 2, 3 ],
        sub ($x) { $x % 2 == 0 },
    ),
    [ 1, 3 ],
    "discards neither first nor last",
);

is(
    discard(
        [ "apple", "zebra", "banana", "zombies", "cherimoya", "zealot" ],
        sub ($x) { substr( $x, 0, 1 ) eq 'z' },
    ),
    [ "apple", "banana", "cherimoya" ],
    "discards strings",
);

is(
    discard(
        [ [ 1, 2, 3 ], [ 5, 5, 5 ], [ 5, 1, 2 ], [ 2, 1, 2 ], [ 1, 5, 2 ], [ 2, 2, 1 ], [ 1, 2, 5 ] ],
        sub ($x) { any { $_ == 5 } @{$x} },
    ),
    [ [ 1, 2, 3 ], [ 2, 1, 2 ], [ 2, 2, 1 ] ],
    "discards lists",
);

done_testing;
