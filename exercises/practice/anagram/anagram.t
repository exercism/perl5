#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Anagram qw<match_anagrams>;

imported_ok qw<match_anagrams> or bail_out;

is(
    match_anagrams( "diaper", [ "hello", "world", "zombies", "pants" ] ),
    bag { end; },
    "no matches",
);

is(
    match_anagrams( "solemn", [ "lemons", "cherry", "melons" ] ),
    bag { item "lemons"; item "melons"; end; },
    "detects two anagrams",
);

is(
    match_anagrams( "good", [ "dog", "goody" ] ),
    bag { end; },
    "does not detect anagram subsets",
);

is(
    match_anagrams( "listen", [ "enlists", "google", "inlets", "banana" ] ),
    bag { item "inlets"; end; },
    "detects anagram",
);

is(
    match_anagrams(
        "allergy",
        [ "gallery", "ballerina", "regally", "clergy", "largely", "leading" ]
    ),
    bag { item "gallery"; item "regally"; item "largely"; end; },
    "detects three anagrams",
);

is(
    match_anagrams( "nose", [ "Eons", "ONES" ] ),
    bag { item "Eons"; item "ONES"; end; },
    "detects multiple anagrams with different case",
);

is(
    match_anagrams( "mass", ["last"] ),
    bag { end; },
    "does not detect non-anagrams with identical checksum",
);

is(
    match_anagrams(
        "Orchestra", [ "cashregister", "Carthorse", "radishes" ]
    ),
    bag { item "Carthorse"; end; },
    "detects anagrams case-insensitively",
);

is(
    match_anagrams(
        "Orchestra", [ "cashregister", "carthorse", "radishes" ]
    ),
    bag { item "carthorse"; end; },
    "detects anagrams using case-insensitive subject",
);

is(
    match_anagrams(
        "orchestra", [ "cashregister", "Carthorse", "radishes" ]
    ),
    bag { item "Carthorse"; end; },
    "detects anagrams using case-insensitive possible matches",
);

is(
    match_anagrams( "go", ["go Go GO"] ),
    bag { end; },
    "does not detect an anagram if the original word is repeated",
);

is(
    match_anagrams( "tapper", ["patter"] ),
    bag { end; },
    "anagrams must use all letters exactly once",
);

is(
    match_anagrams( "BANANA", ["BANANA"] ),
    bag { end; },
    "words are not anagrams of themselves",
);

is(
    match_anagrams( "BANANA", ["Banana"] ),
    bag { end; },
    "words are not anagrams of themselves even if letter case is partially different",
);

is(
    match_anagrams( "BANANA", ["banana"] ),
    bag { end; },
    "words are not anagrams of themselves even if letter case is completely different",
);

is(
    match_anagrams( "LISTEN", [ "LISTEN", "Silent" ] ),
    bag { item "Silent"; end; },
    "words other than themselves can be anagrams",
);

done_testing;
