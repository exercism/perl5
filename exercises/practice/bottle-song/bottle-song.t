#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use BottleSong qw<sing>;

imported_ok qw<sing> or bail_out;

is( [ split( /\n/, sing( 10, 1 ) // '' ) ],
    [   "Ten green bottles hanging on the wall,",
        "Ten green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be nine green bottles hanging on the wall."
    ],
    "verse: single verse: first generic verse",
);

is( [ split( /\n/, sing( 3, 1 ) // '' ) ],
    [   "Three green bottles hanging on the wall,",
        "Three green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be two green bottles hanging on the wall."
    ],
    "verse: single verse: last generic verse",
);

is( [ split( /\n/, sing( 2, 1 ) // '' ) ],
    [   "Two green bottles hanging on the wall,",
        "Two green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be one green bottle hanging on the wall."
    ],
    "verse: single verse: verse with 2 bottles",
);

is( [ split( /\n/, sing( 1, 1 ) // '' ) ],
    [   "One green bottle hanging on the wall,",
        "One green bottle hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be no green bottles hanging on the wall."
    ],
    "verse: single verse: verse with 1 bottle",
);

is( [ split( /\n/, sing( 10, 2 ) // '' ) ],
    [   "Ten green bottles hanging on the wall,",
        "Ten green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be nine green bottles hanging on the wall.",
        "",
        "Nine green bottles hanging on the wall,",
        "Nine green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be eight green bottles hanging on the wall."
    ],
    "lyrics: multiple verses: first two verses",
);

is( [ split( /\n/, sing( 3, 3 ) // '' ) ],
    [   "Three green bottles hanging on the wall,",
        "Three green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be two green bottles hanging on the wall.",
        "",
        "Two green bottles hanging on the wall,",
        "Two green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be one green bottle hanging on the wall.",
        "",
        "One green bottle hanging on the wall,",
        "One green bottle hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be no green bottles hanging on the wall."
    ],
    "lyrics: multiple verses: last three verses",
);

is( [ split( /\n/, sing( 10, 10 ) // '' ) ],
    [   "Ten green bottles hanging on the wall,",
        "Ten green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be nine green bottles hanging on the wall.",
        "",
        "Nine green bottles hanging on the wall,",
        "Nine green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be eight green bottles hanging on the wall.",
        "",
        "Eight green bottles hanging on the wall,",
        "Eight green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be seven green bottles hanging on the wall.",
        "",
        "Seven green bottles hanging on the wall,",
        "Seven green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be six green bottles hanging on the wall.",
        "",
        "Six green bottles hanging on the wall,",
        "Six green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be five green bottles hanging on the wall.",
        "",
        "Five green bottles hanging on the wall,",
        "Five green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be four green bottles hanging on the wall.",
        "",
        "Four green bottles hanging on the wall,",
        "Four green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be three green bottles hanging on the wall.",
        "",
        "Three green bottles hanging on the wall,",
        "Three green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be two green bottles hanging on the wall.",
        "",
        "Two green bottles hanging on the wall,",
        "Two green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be one green bottle hanging on the wall.",
        "",
        "One green bottle hanging on the wall,",
        "One green bottle hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be no green bottles hanging on the wall."
    ],
    "lyrics: multiple verses: all verses",
);

done_testing;
