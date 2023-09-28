#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use KindergartenGarden qw<plants>;

is( # begin: 1fc316ed-17ab-4fba-88ef-3ae78296b692
    plants( "RC\nGG", "Alice" ),
    [ "radishes", "clover", "grass", "grass" ],
    "partial garden: garden with single student",
); # end: 1fc316ed-17ab-4fba-88ef-3ae78296b692

is( # begin: acd19dc1-2200-4317-bc2a-08f021276b40
    plants( "VC\nRC", "Alice" ),
    [ "violets", "clover", "radishes", "clover" ],
    "partial garden: different garden with single student",
); # end: acd19dc1-2200-4317-bc2a-08f021276b40

is( # begin: c376fcc8-349c-446c-94b0-903947315757
    plants( "VVCG\nVVRC", "Bob" ),
    [ "clover", "grass", "radishes", "clover" ],
    "partial garden: garden with two students",
); # end: c376fcc8-349c-446c-94b0-903947315757

is( # begin: 2d620f45-9617-4924-9d27-751c80d17db9
    plants( "VVCCGG\nVVCCGG", "Bob" ),
    [ "clover", "clover", "clover", "clover" ],
    "partial garden: multiple students for the same garden with three students: second student's garden",
); # end: 2d620f45-9617-4924-9d27-751c80d17db9

is( # begin: 57712331-4896-4364-89f8-576421d69c44
    plants( "VVCCGG\nVVCCGG", "Charlie" ),
    [ "grass", "grass", "grass", "grass" ],
    "partial garden: multiple students for the same garden with three students: third student's garden",
); # end: 57712331-4896-4364-89f8-576421d69c44

is( # begin: 149b4290-58e1-40f2-8ae4-8b87c46e765b
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Alice" ),
    [ "violets", "radishes", "violets", "radishes" ],
    "full garden: for Alice, first student's garden",
); # end: 149b4290-58e1-40f2-8ae4-8b87c46e765b

is( # begin: ba25dbbc-10bd-4a37-b18e-f89ecd098a5e
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Bob" ),
    [ "clover", "grass", "clover", "clover" ],
    "full garden: for Bob, second student's garden",
); # end: ba25dbbc-10bd-4a37-b18e-f89ecd098a5e

is( # begin: 566b621b-f18e-4c5f-873e-be30544b838c
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Charlie" ),
    [ "violets", "violets", "clover", "grass" ],
    "full garden: for Charlie",
); # end: 566b621b-f18e-4c5f-873e-be30544b838c

is( # begin: 3ad3df57-dd98-46fc-9269-1877abf612aa
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "David" ),
    [ "radishes", "violets", "clover", "radishes" ],
    "full garden: for David",
); # end: 3ad3df57-dd98-46fc-9269-1877abf612aa

is( # begin: 0f0a55d1-9710-46ed-a0eb-399ba8c72db2
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Eve" ),
    [ "clover", "grass", "radishes", "grass" ],
    "full garden: for Eve",
); # end: 0f0a55d1-9710-46ed-a0eb-399ba8c72db2

is( # begin: a7e80c90-b140-4ea1-aee3-f4625365c9a4
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Fred" ),
    [ "grass", "clover", "violets", "clover" ],
    "full garden: for Fred",
); # end: a7e80c90-b140-4ea1-aee3-f4625365c9a4

is( # begin: 9d94b273-2933-471b-86e8-dba68694c615
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Ginny" ),
    [ "clover", "grass", "grass", "clover" ],
    "full garden: for Ginny",
); # end: 9d94b273-2933-471b-86e8-dba68694c615

is( # begin: f55bc6c2-ade8-4844-87c4-87196f1b7258
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Harriet" ),
    [ "violets", "radishes", "radishes", "violets" ],
    "full garden: for Harriet",
); # end: f55bc6c2-ade8-4844-87c4-87196f1b7258

is( # begin: 759070a3-1bb1-4dd4-be2c-7cce1d7679ae
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Ileana" ),
    [ "grass", "clover", "violets", "clover" ],
    "full garden: for Ileana",
); # end: 759070a3-1bb1-4dd4-be2c-7cce1d7679ae

is( # begin: 78578123-2755-4d4a-9c7d-e985b8dda1c6
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Joseph" ),
    [ "violets", "clover", "violets", "grass" ],
    "full garden: for Joseph",
); # end: 78578123-2755-4d4a-9c7d-e985b8dda1c6

is( # begin: 6bb66df7-f433-41ab-aec2-3ead6e99f65b
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Kincaid" ),
    [ "grass", "clover", "clover", "grass" ],
    "full garden: for Kincaid, second to last student's garden",
); # end: 6bb66df7-f433-41ab-aec2-3ead6e99f65b

is( # begin: d7edec11-6488-418a-94e6-ed509e0fa7eb
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Larry" ),
    [ "grass", "violets", "clover", "violets" ],
    "full garden: for Larry, last student's garden",
); # end: d7edec11-6488-418a-94e6-ed509e0fa7eb

done_testing;
