#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Raindrops qw<raindrop>;

is(
    raindrop(1),
    "1",
    "the sound for 1 is 1",
);

is(
    raindrop(3),
    "Pling",
    "the sound for 3 is Pling",
);

is(
    raindrop(5),
    "Plang",
    "the sound for 5 is Plang",
);

is(
    raindrop(7),
    "Plong",
    "the sound for 7 is Plong",
);

is(
    raindrop(6),
    "Pling",
    "the sound for 6 is Pling as it has a factor 3",
);

is(
    raindrop(8),
    "8",
    "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base",
);

is(
    raindrop(9),
    "Pling",
    "the sound for 9 is Pling as it has a factor 3",
);

is(
    raindrop(10),
    "Plang",
    "the sound for 10 is Plang as it has a factor 5",
);

is(
    raindrop(14),
    "Plong",
    "the sound for 14 is Plong as it has a factor of 7",
);

is(
    raindrop(15),
    "PlingPlang",
    "the sound for 15 is PlingPlang as it has factors 3 and 5",
);

is(
    raindrop(21),
    "PlingPlong",
    "the sound for 21 is PlingPlong as it has factors 3 and 7",
);

is(
    raindrop(25),
    "Plang",
    "the sound for 25 is Plang as it has a factor 5",
);

is(
    raindrop(27),
    "Pling",
    "the sound for 27 is Pling as it has a factor 3",
);

is(
    raindrop(35),
    "PlangPlong",
    "the sound for 35 is PlangPlong as it has factors 5 and 7",
);

is(
    raindrop(49),
    "Plong",
    "the sound for 49 is Plong as it has a factor 7",
);

is(
    raindrop(52),
    "52",
    "the sound for 52 is 52",
);

is(
    raindrop(105),
    "PlingPlangPlong",
    "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7",
);

is(
    raindrop(3125),
    "Plang",
    "the sound for 3125 is Plang as it has a factor 5",
);

done_testing;
