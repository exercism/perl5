#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Accumulate   qw<accumulate>;
use experimental qw<signatures>;

imported_ok qw<accumulate> or bail_out;

is(
    accumulate( [], sub ($x) { $x * $x } ),
    [],
    "accumulate empty",
);

is(
    accumulate( [ 1, 2, 3 ], sub ($x) { $x * $x } ),
    [ 1, 4, 9 ],
    "accumulate squares",
);

is(
    accumulate( [ "Hello", "world" ], sub ($x) { uc $x } ),
    [ "HELLO", "WORLD" ],
    "accumulate upcases",
);

is(
    accumulate(
        [ "the", "quick", "brown", "fox", "etc" ],
        sub ($x) { scalar reverse $x }
    ),
    [ "eht", "kciuq", "nworb", "xof", "cte" ],
    "accumulate reversed strings",
);

is(
    accumulate(
        [ "a", "b", "c" ],
        sub ($x) {
            accumulate( [ 1 .. 3 ], sub ($y) { $x . $y } );
        }
    ),
    [ [ "a1", "a2", "a3" ], [ "b1", "b2", "b3" ], [ "c1", "c2", "c3" ] ],
    "accumulate recursively",
);

done_testing;
