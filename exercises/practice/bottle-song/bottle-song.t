#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use BottleSong qw<sing>;

imported_ok qw<sing> or bail_out;

is(
    [ split( /\n/, sing( 10, 1 ) // '' ) ],
    array {
        item "Ten green bottles hanging on the wall,";
        item "Ten green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be nine green bottles hanging on the wall.";
        end;
    },
    "verse: single verse: first generic verse",
);

is(
    [ split( /\n/, sing( 3, 1 ) // '' ) ],
    array {
        item "Three green bottles hanging on the wall,";
        item "Three green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be two green bottles hanging on the wall.";
        end;
    },
    "verse: single verse: last generic verse",
);

is(
    [ split( /\n/, sing( 2, 1 ) // '' ) ],
    array {
        item "Two green bottles hanging on the wall,";
        item "Two green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be one green bottle hanging on the wall.";
        end;
    },
    "verse: single verse: verse with 2 bottles",
);

is(
    [ split( /\n/, sing( 1, 1 ) // '' ) ],
    array {
        item "One green bottle hanging on the wall,";
        item "One green bottle hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be no green bottles hanging on the wall.";
        end;
    },
    "verse: single verse: verse with 1 bottle",
);

is(
    [ split( /\n/, sing( 10, 2 ) // '' ) ],
    array {
        item "Ten green bottles hanging on the wall,";
        item "Ten green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be nine green bottles hanging on the wall.";
        item "";
        item "Nine green bottles hanging on the wall,";
        item "Nine green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be eight green bottles hanging on the wall.";
        end;
    },
    "lyrics: multiple verses: first two verses",
);

is(
    [ split( /\n/, sing( 3, 3 ) // '' ) ],
    array {
        item "Three green bottles hanging on the wall,";
        item "Three green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be two green bottles hanging on the wall.";
        item "";
        item "Two green bottles hanging on the wall,";
        item "Two green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be one green bottle hanging on the wall.";
        item "";
        item "One green bottle hanging on the wall,";
        item "One green bottle hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be no green bottles hanging on the wall.";
        end;
    },
    "lyrics: multiple verses: last three verses",
);

is(
    [ split( /\n/, sing( 10, 10 ) // '' ) ],
    array {
        item "Ten green bottles hanging on the wall,";
        item "Ten green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be nine green bottles hanging on the wall.";
        item "";
        item "Nine green bottles hanging on the wall,";
        item "Nine green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be eight green bottles hanging on the wall.";
        item "";
        item "Eight green bottles hanging on the wall,";
        item "Eight green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be seven green bottles hanging on the wall.";
        item "";
        item "Seven green bottles hanging on the wall,";
        item "Seven green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be six green bottles hanging on the wall.";
        item "";
        item "Six green bottles hanging on the wall,";
        item "Six green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be five green bottles hanging on the wall.";
        item "";
        item "Five green bottles hanging on the wall,";
        item "Five green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be four green bottles hanging on the wall.";
        item "";
        item "Four green bottles hanging on the wall,";
        item "Four green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be three green bottles hanging on the wall.";
        item "";
        item "Three green bottles hanging on the wall,";
        item "Three green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be two green bottles hanging on the wall.";
        item "";
        item "Two green bottles hanging on the wall,";
        item "Two green bottles hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be one green bottle hanging on the wall.";
        item "";
        item "One green bottle hanging on the wall,";
        item "One green bottle hanging on the wall,";
        item "And if one green bottle should accidentally fall,";
        item "There'll be no green bottles hanging on the wall.";
        end;
    },
    "lyrics: multiple verses: all verses",
);

done_testing;
