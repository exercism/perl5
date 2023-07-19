#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use SpaceAge qw<age_on_planet>;

is(
    age_on_planet( "Earth", 1000000000 ),
    31.69,
    "age on Earth",
);

is(
    age_on_planet( "Mercury", 2134835688 ),
    280.88,
    "age on Mercury",
);

is(
    age_on_planet( "Venus", 189839836 ),
    9.78,
    "age on Venus",
);

is(
    age_on_planet( "Mars", 2129871239 ),
    35.88,
    "age on Mars",
);

is(
    age_on_planet( "Jupiter", 901876382 ),
    2.41,
    "age on Jupiter",
);

is(
    age_on_planet( "Saturn", 2000000000 ),
    2.15,
    "age on Saturn",
);

is(
    age_on_planet( "Uranus", 1210123456 ),
    0.46,
    "age on Uranus",
);

is(
    age_on_planet( "Neptune", 1821023456 ),
    0.35,
    "age on Neptune",
);

like(
    dies( sub { age_on_planet "Sun", 680804807 } ),
    qr/not a planet/,
    "invalid planet causes error",
);

done_testing;
