#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use KindergartenGarden qw<plants>;

imported_ok qw<plants> or bail_out;

is(
    plants( "RC\nGG", "Alice" ),
    [ "radishes", "clover", "grass", "grass" ],
    "partial garden: garden with single student",
);

is(
    plants( "VC\nRC", "Alice" ),
    [ "violets", "clover", "radishes", "clover" ],
    "partial garden: different garden with single student",
);

is(
    plants( "VVCG\nVVRC", "Bob" ),
    [ "clover", "grass", "radishes", "clover" ],
    "partial garden: garden with two students",
);

is(
    plants( "VVCCGG\nVVCCGG", "Bob" ),
    [ "clover", "clover", "clover", "clover" ],
    "partial garden: multiple students for the same garden with three students: second student's garden",
);

is(
    plants( "VVCCGG\nVVCCGG", "Charlie" ),
    [ "grass", "grass", "grass", "grass" ],
    "partial garden: multiple students for the same garden with three students: third student's garden",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Alice" ),
    [ "violets", "radishes", "violets", "radishes" ],
    "full garden: for Alice, first student's garden",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Bob" ),
    [ "clover", "grass", "clover", "clover" ],
    "full garden: for Bob, second student's garden",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Charlie" ),
    [ "violets", "violets", "clover", "grass" ],
    "full garden: for Charlie",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "David" ),
    [ "radishes", "violets", "clover", "radishes" ],
    "full garden: for David",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Eve" ),
    [ "clover", "grass", "radishes", "grass" ],
    "full garden: for Eve",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Fred" ),
    [ "grass", "clover", "violets", "clover" ],
    "full garden: for Fred",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Ginny" ),
    [ "clover", "grass", "grass", "clover" ],
    "full garden: for Ginny",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Harriet" ),
    [ "violets", "radishes", "radishes", "violets" ],
    "full garden: for Harriet",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Ileana" ),
    [ "grass", "clover", "violets", "clover" ],
    "full garden: for Ileana",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Joseph" ),
    [ "violets", "clover", "violets", "grass" ],
    "full garden: for Joseph",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Kincaid" ),
    [ "grass", "clover", "clover", "grass" ],
    "full garden: for Kincaid, second to last student's garden",
);

is(
    plants( "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", "Larry" ),
    [ "grass", "violets", "clover", "violets" ],
    "full garden: for Larry, last student's garden",
);

done_testing;
