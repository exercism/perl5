#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use RomanNumerals qw<to_roman>;

is( # begin: 19828a3a-fbf7-4661-8ddd-cbaeee0e2178
    to_roman(1),
    "I",
    "1 is I",
); # end: 19828a3a-fbf7-4661-8ddd-cbaeee0e2178

is( # begin: f088f064-2d35-4476-9a41-f576da3f7b03
    to_roman(2),
    "II",
    "2 is II",
); # end: f088f064-2d35-4476-9a41-f576da3f7b03

is( # begin: b374a79c-3bea-43e6-8db8-1286f79c7106
    to_roman(3),
    "III",
    "3 is III",
); # end: b374a79c-3bea-43e6-8db8-1286f79c7106

is( # begin: 05a0a1d4-a140-4db1-82e8-fcc21fdb49bb
    to_roman(4),
    "IV",
    "4 is IV",
); # end: 05a0a1d4-a140-4db1-82e8-fcc21fdb49bb

is( # begin: 57c0f9ad-5024-46ab-975d-de18c430b290
    to_roman(5),
    "V",
    "5 is V",
); # end: 57c0f9ad-5024-46ab-975d-de18c430b290

is( # begin: 20a2b47f-e57f-4797-a541-0b3825d7f249
    to_roman(6),
    "VI",
    "6 is VI",
); # end: 20a2b47f-e57f-4797-a541-0b3825d7f249

is( # begin: ff3fb08c-4917-4aab-9f4e-d663491d083d
    to_roman(9),
    "IX",
    "9 is IX",
); # end: ff3fb08c-4917-4aab-9f4e-d663491d083d

is( # begin: 6d1d82d5-bf3e-48af-9139-87d7165ed509
    to_roman(16),
    "XVI",
    "16 is XVI",
); # end: 6d1d82d5-bf3e-48af-9139-87d7165ed509

is( # begin: 2bda64ca-7d28-4c56-b08d-16ce65716cf6
    to_roman(27),
    "XXVII",
    "27 is XXVII",
); # end: 2bda64ca-7d28-4c56-b08d-16ce65716cf6

is( # begin: a1f812ef-84da-4e02-b4f0-89c907d0962c
    to_roman(48),
    "XLVIII",
    "48 is XLVIII",
); # end: a1f812ef-84da-4e02-b4f0-89c907d0962c

is( # begin: 607ead62-23d6-4c11-a396-ef821e2e5f75
    to_roman(49),
    "XLIX",
    "49 is XLIX",
); # end: 607ead62-23d6-4c11-a396-ef821e2e5f75

is( # begin: d5b283d4-455d-4e68-aacf-add6c4b51915
    to_roman(59),
    "LIX",
    "59 is LIX",
); # end: d5b283d4-455d-4e68-aacf-add6c4b51915

is( # begin: 4465ffd5-34dc-44f3-ada5-56f5007b6dad
    to_roman(66),
    "LXVI",
    "66 is LXVI",
); # end: 4465ffd5-34dc-44f3-ada5-56f5007b6dad

is( # begin: 46b46e5b-24da-4180-bfe2-2ef30b39d0d0
    to_roman(93),
    "XCIII",
    "93 is XCIII",
); # end: 46b46e5b-24da-4180-bfe2-2ef30b39d0d0

is( # begin: 30494be1-9afb-4f84-9d71-db9df18b55e3
    to_roman(141),
    "CXLI",
    "141 is CXLI",
); # end: 30494be1-9afb-4f84-9d71-db9df18b55e3

is( # begin: 267f0207-3c55-459a-b81d-67cec7a46ed9
    to_roman(163),
    "CLXIII",
    "163 is CLXIII",
); # end: 267f0207-3c55-459a-b81d-67cec7a46ed9

is( # begin: 902ad132-0b4d-40e3-8597-ba5ed611dd8d
    to_roman(166),
    "CLXVI",
    "166 is CLXVI",
); # end: 902ad132-0b4d-40e3-8597-ba5ed611dd8d

is( # begin: cdb06885-4485-4d71-8bfb-c9d0f496b404
    to_roman(402),
    "CDII",
    "402 is CDII",
); # end: cdb06885-4485-4d71-8bfb-c9d0f496b404

is( # begin: 6b71841d-13b2-46b4-ba97-dec28133ea80
    to_roman(575),
    "DLXXV",
    "575 is DLXXV",
); # end: 6b71841d-13b2-46b4-ba97-dec28133ea80

is( # begin: dacb84b9-ea1c-4a61-acbb-ce6b36674906
    to_roman(666),
    "DCLXVI",
    "666 is DCLXVI",
); # end: dacb84b9-ea1c-4a61-acbb-ce6b36674906

is( # begin: 432de891-7fd6-4748-a7f6-156082eeca2f
    to_roman(911),
    "CMXI",
    "911 is CMXI",
); # end: 432de891-7fd6-4748-a7f6-156082eeca2f

is( # begin: e6de6d24-f668-41c0-88d7-889c0254d173
    to_roman(1024),
    "MXXIV",
    "1024 is MXXIV",
); # end: e6de6d24-f668-41c0-88d7-889c0254d173

is( # begin: efbe1d6a-9f98-4eb5-82bc-72753e3ac328
    to_roman(1666),
    "MDCLXVI",
    "1666 is MDCLXVI",
); # end: efbe1d6a-9f98-4eb5-82bc-72753e3ac328

is( # begin: bb550038-d4eb-4be2-a9ce-f21961ac3bc6
    to_roman(3000),
    "MMM",
    "3000 is MMM",
); # end: bb550038-d4eb-4be2-a9ce-f21961ac3bc6

is( # begin: 3bc4b41c-c2e6-49d9-9142-420691504336
    to_roman(3001),
    "MMMI",
    "3001 is MMMI",
); # end: 3bc4b41c-c2e6-49d9-9142-420691504336

is( # begin: 4e18e96b-5fbb-43df-a91b-9cb511fe0856
    to_roman(3999),
    "MMMCMXCIX",
    "3999 is MMMCMXCIX",
); # end: 4e18e96b-5fbb-43df-a91b-9cb511fe0856

done_testing;
