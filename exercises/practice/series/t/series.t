#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Series qw<slices>;

is( # begin: 7ae7a46a-d992-4c2a-9c15-a112d125ebad
    slices( "1", 1 ),
    ["1"],
    "slices of one from one",
); # end: 7ae7a46a-d992-4c2a-9c15-a112d125ebad

is( # begin: 3143b71d-f6a5-4221-aeae-619f906244d2
    slices( "12", 1 ),
    [ "1", "2" ],
    "slices of one from two",
); # end: 3143b71d-f6a5-4221-aeae-619f906244d2

is( # begin: dbb68ff5-76c5-4ccd-895a-93dbec6d5805
    slices( "35", 2 ),
    ["35"],
    "slices of two",
); # end: dbb68ff5-76c5-4ccd-895a-93dbec6d5805

is( # begin: 19bbea47-c987-4e11-a7d1-e103442adf86
    slices( "9142", 2 ),
    [ "91", "14", "42" ],
    "slices of two overlap",
); # end: 19bbea47-c987-4e11-a7d1-e103442adf86

is( # begin: 8e17148d-ba0a-4007-a07f-d7f87015d84c
    slices( "777777", 3 ),
    [ "777", "777", "777", "777" ],
    "slices can include duplicates",
); # end: 8e17148d-ba0a-4007-a07f-d7f87015d84c

is( # begin: bd5b085e-f612-4f81-97a8-6314258278b0
    slices( "918493904243", 5 ),
    [ "91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243" ],
    "slices of a long series",
); # end: bd5b085e-f612-4f81-97a8-6314258278b0

like( # begin: 6d235d85-46cf-4fae-9955-14b6efef27cd
    dies( sub { slices "12345", 6 } ),
    qr/slice length cannot be greater than series length/,
    "slice length is too large",
); # end: 6d235d85-46cf-4fae-9955-14b6efef27cd

like( # begin: d7957455-346d-4e47-8e4b-87ed1564c6d7
    dies( sub { slices "12345", 42 } ),
    qr/slice length cannot be greater than series length/,
    "slice length is way too large",
); # end: d7957455-346d-4e47-8e4b-87ed1564c6d7

like( # begin: d34004ad-8765-4c09-8ba1-ada8ce776806
    dies( sub { slices "12345", 0 } ),
    qr/slice length cannot be zero/,
    "slice length cannot be zero",
); # end: d34004ad-8765-4c09-8ba1-ada8ce776806

like( # begin: 10ab822d-8410-470a-a85d-23fbeb549e54
    dies( sub { slices "123", -1 } ),
    qr/slice length cannot be negative/,
    "slice length cannot be negative",
); # end: 10ab822d-8410-470a-a85d-23fbeb549e54

like( # begin: c7ed0812-0e4b-4bf3-99c4-28cbbfc246a2
    dies( sub { slices "", 1 } ),
    qr/series cannot be empty/,
    "empty series is invalid",
); # end: c7ed0812-0e4b-4bf3-99c4-28cbbfc246a2

done_testing;
