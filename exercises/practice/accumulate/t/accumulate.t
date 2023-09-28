#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Accumulate   qw<accumulate>;
use experimental qw<signatures>;

is( # begin: 64d97c14-36dd-44a8-9621-2cecebd6ed23
    accumulate( [], sub ($x) { $x * $x } ),
    [],
    "accumulate empty",
); # end: 64d97c14-36dd-44a8-9621-2cecebd6ed23

is( # begin: 00008ed2-4651-4929-8c08-8b4dbd70872e
    accumulate( [ 1, 2, 3 ], sub ($x) { $x * $x } ),
    [ 1, 4, 9 ],
    "accumulate squares",
); # end: 00008ed2-4651-4929-8c08-8b4dbd70872e

is( # begin: 551016da-4396-4cae-b0ec-4c3a1a264125
    accumulate( [ "Hello", "world" ], sub ($x) { uc $x } ),
    [ "HELLO", "WORLD" ],
    "accumulate upcases",
); # end: 551016da-4396-4cae-b0ec-4c3a1a264125

is( # begin: cdf95597-b6ec-4eac-a838-3480d13d0d05
    accumulate( [ "the", "quick", "brown", "fox", "etc" ], sub ($x) { scalar reverse $x } ),
    [ "eht", "kciuq", "nworb", "xof", "cte" ],
    "accumulate reversed strings",
); # end: cdf95597-b6ec-4eac-a838-3480d13d0d05

is( # begin: 0b357334-4cad-49e1-a741-425202edfc7c
    accumulate( [ "a", "b", "c" ], sub ($x) {
            accumulate( [ 1 .. 3 ], sub ($y) { $x . $y } );
    } ),
    [ [ "a1", "a2", "a3" ], [ "b1", "b2", "b3" ], [ "c1", "c2", "c3" ] ],
    "accumulate recursively",
); # end: 0b357334-4cad-49e1-a741-425202edfc7c

done_testing;
