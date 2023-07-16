#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use BottleSong qw<sing>;

imported_ok qw<sing> or bail_out;

is(    # begin: d4ccf8fc-01dc-48c0-a201-4fbeb30f2d03
    [ split( /\n/, sing( 10, 1 ) // '' ) ],
    [   "Ten green bottles hanging on the wall,",
        "Ten green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be nine green bottles hanging on the wall."
    ],
    "verse: single verse: first generic verse",
);     # end: d4ccf8fc-01dc-48c0-a201-4fbeb30f2d03

is(    # begin: 0f0aded3-472a-4c64-b842-18d4f1f5f030
    [ split( /\n/, sing( 3, 1 ) // '' ) ],
    [   "Three green bottles hanging on the wall,",
        "Three green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be two green bottles hanging on the wall."
    ],
    "verse: single verse: last generic verse",
);     # end: 0f0aded3-472a-4c64-b842-18d4f1f5f030

is(    # begin: f61f3c97-131f-459e-b40a-7428f3ed99d9
    [ split( /\n/, sing( 2, 1 ) // '' ) ],
    [   "Two green bottles hanging on the wall,",
        "Two green bottles hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be one green bottle hanging on the wall."
    ],
    "verse: single verse: verse with 2 bottles",
);     # end: f61f3c97-131f-459e-b40a-7428f3ed99d9

is(    # begin: 05eadba9-5dbd-401e-a7e8-d17cc9baa8e0
    [ split( /\n/, sing( 1, 1 ) // '' ) ],
    [   "One green bottle hanging on the wall,",
        "One green bottle hanging on the wall,",
        "And if one green bottle should accidentally fall,",
        "There'll be no green bottles hanging on the wall."
    ],
    "verse: single verse: verse with 1 bottle",
);     # end: 05eadba9-5dbd-401e-a7e8-d17cc9baa8e0

is(    # begin: a4a28170-83d6-4dc1-bd8b-319b6abb6a80
    [ split( /\n/, sing( 10, 2 ) // '' ) ],
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
);    # end: a4a28170-83d6-4dc1-bd8b-319b6abb6a80

is(   # begin: 3185d438-c5ac-4ce6-bcd3-02c9ff1ed8db
    [ split( /\n/, sing( 3, 3 ) // '' ) ],
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
);    # end: 3185d438-c5ac-4ce6-bcd3-02c9ff1ed8db

is(   # begin: 28c1584a-0e51-4b65-9ae2-fbc0bf4bbb28
    [ split( /\n/, sing( 10, 10 ) // '' ) ],
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
);    # end: 28c1584a-0e51-4b65-9ae2-fbc0bf4bbb28

done_testing;
