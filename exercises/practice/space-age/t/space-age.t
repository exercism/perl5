#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use SpaceAge qw<age_on_planet>;

is( # begin: 84f609af-5a91-4d68-90a3-9e32d8a5cd34
    age_on_planet( "Earth", 1000000000 ),
    31.69,
    "age on Earth",
); # end: 84f609af-5a91-4d68-90a3-9e32d8a5cd34

is( # begin: ca20c4e9-6054-458c-9312-79679ffab40b
    age_on_planet( "Mercury", 2134835688 ),
    280.88,
    "age on Mercury",
); # end: ca20c4e9-6054-458c-9312-79679ffab40b

is( # begin: 502c6529-fd1b-41d3-8fab-65e03082b024
    age_on_planet( "Venus", 189839836 ),
    9.78,
    "age on Venus",
); # end: 502c6529-fd1b-41d3-8fab-65e03082b024

is( # begin: 9ceadf5e-a0d5-4388-9d40-2c459227ceb8
    age_on_planet( "Mars", 2129871239 ),
    35.88,
    "age on Mars",
); # end: 9ceadf5e-a0d5-4388-9d40-2c459227ceb8

is( # begin: 42927dc3-fe5e-4f76-a5b5-f737fc19bcde
    age_on_planet( "Jupiter", 901876382 ),
    2.41,
    "age on Jupiter",
); # end: 42927dc3-fe5e-4f76-a5b5-f737fc19bcde

is( # begin: 8469b332-7837-4ada-b27c-00ee043ebcad
    age_on_planet( "Saturn", 2000000000 ),
    2.15,
    "age on Saturn",
); # end: 8469b332-7837-4ada-b27c-00ee043ebcad

is( # begin: 999354c1-76f8-4bb5-a672-f317b6436743
    age_on_planet( "Uranus", 1210123456 ),
    0.46,
    "age on Uranus",
); # end: 999354c1-76f8-4bb5-a672-f317b6436743

is( # begin: 80096d30-a0d4-4449-903e-a381178355d8
    age_on_planet( "Neptune", 1821023456 ),
    0.35,
    "age on Neptune",
); # end: 80096d30-a0d4-4449-903e-a381178355d8

like( # begin: 57b96e2a-1178-40b7-b34d-f3c9c34e4bf4
    dies( sub { age_on_planet "Sun", 680804807 } ),
    qr/not a planet/,
    "invalid planet causes error",
); # end: 57b96e2a-1178-40b7-b34d-f3c9c34e4bf4

done_testing;
