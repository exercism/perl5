#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Raindrops qw<raindrop>;

is( # begin: 1575d549-e502-46d4-a8e1-6b7bec6123d8
    raindrop(1),
    "1",
    "the sound for 1 is 1",
); # end: 1575d549-e502-46d4-a8e1-6b7bec6123d8

is( # begin: 1f51a9f9-4895-4539-b182-d7b0a5ab2913
    raindrop(3),
    "Pling",
    "the sound for 3 is Pling",
); # end: 1f51a9f9-4895-4539-b182-d7b0a5ab2913

is( # begin: 2d9bfae5-2b21-4bcd-9629-c8c0e388f3e0
    raindrop(5),
    "Plang",
    "the sound for 5 is Plang",
); # end: 2d9bfae5-2b21-4bcd-9629-c8c0e388f3e0

is( # begin: d7e60daa-32ef-4c23-b688-2abff46c4806
    raindrop(7),
    "Plong",
    "the sound for 7 is Plong",
); # end: d7e60daa-32ef-4c23-b688-2abff46c4806

is( # begin: 6bb4947b-a724-430c-923f-f0dc3d62e56a
    raindrop(6),
    "Pling",
    "the sound for 6 is Pling as it has a factor 3",
); # end: 6bb4947b-a724-430c-923f-f0dc3d62e56a

is( # begin: ce51e0e8-d9d4-446d-9949-96eac4458c2d
    raindrop(8),
    "8",
    "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base",
); # end: ce51e0e8-d9d4-446d-9949-96eac4458c2d

is( # begin: 0dd66175-e3e2-47fc-8750-d01739856671
    raindrop(9),
    "Pling",
    "the sound for 9 is Pling as it has a factor 3",
); # end: 0dd66175-e3e2-47fc-8750-d01739856671

is( # begin: 022c44d3-2182-4471-95d7-c575af225c96
    raindrop(10),
    "Plang",
    "the sound for 10 is Plang as it has a factor 5",
); # end: 022c44d3-2182-4471-95d7-c575af225c96

is( # begin: 37ab74db-fed3-40ff-b7b9-04acdfea8edf
    raindrop(14),
    "Plong",
    "the sound for 14 is Plong as it has a factor of 7",
); # end: 37ab74db-fed3-40ff-b7b9-04acdfea8edf

is( # begin: 31f92999-6afb-40ee-9aa4-6d15e3334d0f
    raindrop(15),
    "PlingPlang",
    "the sound for 15 is PlingPlang as it has factors 3 and 5",
); # end: 31f92999-6afb-40ee-9aa4-6d15e3334d0f

is( # begin: ff9bb95d-6361-4602-be2c-653fe5239b54
    raindrop(21),
    "PlingPlong",
    "the sound for 21 is PlingPlong as it has factors 3 and 7",
); # end: ff9bb95d-6361-4602-be2c-653fe5239b54

is( # begin: d2e75317-b72e-40ab-8a64-6734a21dece1
    raindrop(25),
    "Plang",
    "the sound for 25 is Plang as it has a factor 5",
); # end: d2e75317-b72e-40ab-8a64-6734a21dece1

is( # begin: a09c4c58-c662-4e32-97fe-f1501ef7125c
    raindrop(27),
    "Pling",
    "the sound for 27 is Pling as it has a factor 3",
); # end: a09c4c58-c662-4e32-97fe-f1501ef7125c

is( # begin: bdf061de-8564-4899-a843-14b48b722789
    raindrop(35),
    "PlangPlong",
    "the sound for 35 is PlangPlong as it has factors 5 and 7",
); # end: bdf061de-8564-4899-a843-14b48b722789

is( # begin: c4680bee-69ba-439d-99b5-70c5fd1a7a83
    raindrop(49),
    "Plong",
    "the sound for 49 is Plong as it has a factor 7",
); # end: c4680bee-69ba-439d-99b5-70c5fd1a7a83

is( # begin: 17f2bc9a-b65a-4d23-8ccd-266e8c271444
    raindrop(52),
    "52",
    "the sound for 52 is 52",
); # end: 17f2bc9a-b65a-4d23-8ccd-266e8c271444

is( # begin: e46677ed-ff1a-419f-a740-5c713d2830e4
    raindrop(105),
    "PlingPlangPlong",
    "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7",
); # end: e46677ed-ff1a-419f-a740-5c713d2830e4

is( # begin: 13c6837a-0fcd-4b86-a0eb-20572f7deb0b
    raindrop(3125),
    "Plang",
    "the sound for 3125 is Plang as it has a factor 5",
); # end: 13c6837a-0fcd-4b86-a0eb-20572f7deb0b

done_testing;
