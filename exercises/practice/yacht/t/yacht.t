#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Yacht qw<score>;
use Yacht::Category;

is( # begin: 3060e4a5-4063-4deb-a380-a630b43a84b6
    score( [ 5, 5, 5, 5, 5 ], $Yacht::Category::YACHT ),
    50,
    "Yacht",
); # end: 3060e4a5-4063-4deb-a380-a630b43a84b6

is( # begin: 15026df2-f567-482f-b4d5-5297d57769d9
    score( [ 1, 3, 3, 2, 5 ], $Yacht::Category::YACHT ),
    0,
    "Not Yacht",
); # end: 15026df2-f567-482f-b4d5-5297d57769d9

is( # begin: 36b6af0c-ca06-4666-97de-5d31213957a4
    score( [ 1, 1, 1, 3, 5 ], $Yacht::Category::ONES ),
    3,
    "Ones",
); # end: 36b6af0c-ca06-4666-97de-5d31213957a4

is( # begin: 023a07c8-6c6e-44d0-bc17-efc5e1b8205a
    score( [ 3, 1, 1, 5, 1 ], $Yacht::Category::ONES ),
    3,
    "Ones, out of order",
); # end: 023a07c8-6c6e-44d0-bc17-efc5e1b8205a

is( # begin: 7189afac-cccd-4a74-8182-1cb1f374e496
    score( [ 4, 3, 6, 5, 5 ], $Yacht::Category::ONES ),
    0,
    "No ones",
); # end: 7189afac-cccd-4a74-8182-1cb1f374e496

is( # begin: 793c4292-dd14-49c4-9707-6d9c56cee725
    score( [ 2, 3, 4, 5, 6 ], $Yacht::Category::TWOS ),
    2,
    "Twos",
); # end: 793c4292-dd14-49c4-9707-6d9c56cee725

is( # begin: dc41bceb-d0c5-4634-a734-c01b4233a0c6
    score( [ 1, 4, 1, 4, 1 ], $Yacht::Category::FOURS ),
    8,
    "Fours",
); # end: dc41bceb-d0c5-4634-a734-c01b4233a0c6

is( # begin: f6125417-5c8a-4bca-bc5b-b4b76d0d28c8
    score( [ 3, 3, 3, 3, 3 ], $Yacht::Category::THREES ),
    15,
    "Yacht counted as threes",
); # end: f6125417-5c8a-4bca-bc5b-b4b76d0d28c8

is( # begin: 464fc809-96ed-46e4-acb8-d44e302e9726
    score( [ 3, 3, 3, 3, 3 ], $Yacht::Category::FIVES ),
    0,
    "Yacht of 3s counted as fives",
); # end: 464fc809-96ed-46e4-acb8-d44e302e9726

is( # begin: d054227f-3a71-4565-a684-5c7e621ec1e9
    score( [ 1, 5, 3, 5, 3 ], $Yacht::Category::FIVES ),
    10,
    "Fives",
); # end: d054227f-3a71-4565-a684-5c7e621ec1e9

is( # begin: e8a036e0-9d21-443a-8b5f-e15a9e19a761
    score( [ 2, 3, 4, 5, 6 ], $Yacht::Category::SIXES ),
    6,
    "Sixes",
); # end: e8a036e0-9d21-443a-8b5f-e15a9e19a761

is( # begin: 51cb26db-6b24-49af-a9ff-12f53b252eea
    score( [ 2, 2, 4, 4, 4 ], $Yacht::Category::FULL_HOUSE ),
    16,
    "Full house two small, three big",
); # end: 51cb26db-6b24-49af-a9ff-12f53b252eea

is( # begin: 1822ca9d-f235-4447-b430-2e8cfc448f0c
    score( [ 5, 3, 3, 5, 3 ], $Yacht::Category::FULL_HOUSE ),
    19,
    "Full house three small, two big",
); # end: 1822ca9d-f235-4447-b430-2e8cfc448f0c

is( # begin: b208a3fc-db2e-4363-a936-9e9a71e69c07
    score( [ 2, 2, 4, 4, 5 ], $Yacht::Category::FULL_HOUSE ),
    0,
    "Two pair is not a full house",
); # end: b208a3fc-db2e-4363-a936-9e9a71e69c07

is( # begin: b90209c3-5956-445b-8a0b-0ac8b906b1c2
    score( [ 1, 4, 4, 4, 4 ], $Yacht::Category::FULL_HOUSE ),
    0,
    "Four of a kind is not a full house",
); # end: b90209c3-5956-445b-8a0b-0ac8b906b1c2

is( # begin: 32a3f4ee-9142-4edf-ba70-6c0f96eb4b0c
    score( [ 2, 2, 2, 2, 2 ], $Yacht::Category::FULL_HOUSE ),
    0,
    "Yacht is not a full house",
); # end: 32a3f4ee-9142-4edf-ba70-6c0f96eb4b0c

is( # begin: b286084d-0568-4460-844a-ba79d71d79c6
    score( [ 6, 6, 4, 6, 6 ], $Yacht::Category::FOUR_OF_A_KIND ),
    24,
    "Four of a Kind",
); # end: b286084d-0568-4460-844a-ba79d71d79c6

is( # begin: f25c0c90-5397-4732-9779-b1e9b5f612ca
    score( [ 3, 3, 3, 3, 3 ], $Yacht::Category::FOUR_OF_A_KIND ),
    12,
    "Yacht can be scored as Four of a Kind",
); # end: f25c0c90-5397-4732-9779-b1e9b5f612ca

is( # begin: 9f8ef4f0-72bb-401a-a871-cbad39c9cb08
    score( [ 3, 3, 3, 5, 5 ], $Yacht::Category::FOUR_OF_A_KIND ),
    0,
    "Full house is not Four of a Kind",
); # end: 9f8ef4f0-72bb-401a-a871-cbad39c9cb08

is( # begin: b4743c82-1eb8-4a65-98f7-33ad126905cd
    score( [ 3, 5, 4, 1, 2 ], $Yacht::Category::LITTLE_STRAIGHT ),
    30,
    "Little Straight",
); # end: b4743c82-1eb8-4a65-98f7-33ad126905cd

is( # begin: 7ac08422-41bf-459c-8187-a38a12d080bc
    score( [ 1, 2, 3, 4, 5 ], $Yacht::Category::BIG_STRAIGHT ),
    0,
    "Little Straight as Big Straight",
); # end: 7ac08422-41bf-459c-8187-a38a12d080bc

is( # begin: 97bde8f7-9058-43ea-9de7-0bc3ed6d3002
    score( [ 1, 1, 2, 3, 4 ], $Yacht::Category::LITTLE_STRAIGHT ),
    0,
    "Four in order but not a little straight",
); # end: 97bde8f7-9058-43ea-9de7-0bc3ed6d3002

is( # begin: cef35ff9-9c5e-4fd2-ae95-6e4af5e95a99
    score( [ 1, 2, 3, 4, 6 ], $Yacht::Category::LITTLE_STRAIGHT ),
    0,
    "No pairs but not a little straight",
); # end: cef35ff9-9c5e-4fd2-ae95-6e4af5e95a99

is( # begin: fd785ad2-c060-4e45-81c6-ea2bbb781b9d
    score( [ 1, 1, 3, 4, 5 ], $Yacht::Category::LITTLE_STRAIGHT ),
    0,
    "Minimum is 1, maximum is 5, but not a little straight",
); # end: fd785ad2-c060-4e45-81c6-ea2bbb781b9d

is( # begin: 35bd74a6-5cf6-431a-97a3-4f713663f467
    score( [ 4, 6, 2, 5, 3 ], $Yacht::Category::BIG_STRAIGHT ),
    30,
    "Big Straight",
); # end: 35bd74a6-5cf6-431a-97a3-4f713663f467

is( # begin: 87c67e1e-3e87-4f3a-a9b1-62927822b250
    score( [ 6, 5, 4, 3, 2 ], $Yacht::Category::LITTLE_STRAIGHT ),
    0,
    "Big Straight as little straight",
); # end: 87c67e1e-3e87-4f3a-a9b1-62927822b250

is( # begin: c1fa0a3a-40ba-4153-a42d-32bc34d2521e
    score( [ 6, 5, 4, 3, 1 ], $Yacht::Category::BIG_STRAIGHT ),
    0,
    "No pairs but not a big straight",
); # end: c1fa0a3a-40ba-4153-a42d-32bc34d2521e

is( # begin: 207e7300-5d10-43e5-afdd-213e3ac8827d
    score( [ 3, 3, 5, 6, 6 ], $Yacht::Category::CHOICE ),
    23,
    "Choice",
); # end: 207e7300-5d10-43e5-afdd-213e3ac8827d

is( # begin: b524c0cf-32d2-4b40-8fb3-be3500f3f135
    score( [ 2, 2, 2, 2, 2 ], $Yacht::Category::CHOICE ),
    10,
    "Yacht as choice",
); # end: b524c0cf-32d2-4b40-8fb3-be3500f3f135

done_testing;
