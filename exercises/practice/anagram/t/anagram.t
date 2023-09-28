#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Anagram qw<match_anagrams>;

is( # begin: dd40c4d2-3c8b-44e5-992a-f42b393ec373
    match_anagrams( "diaper", [ "hello", "world", "zombies", "pants" ] ),
    bag {
        end;
    },
    "no matches",
); # end: dd40c4d2-3c8b-44e5-992a-f42b393ec373

is( # begin: 03eb9bbe-8906-4ea0-84fa-ffe711b52c8b
    match_anagrams( "solemn", [ "lemons", "cherry", "melons" ] ),
    bag {
        item "lemons";
        item "melons";
        end;
    },
    "detects two anagrams",
); # end: 03eb9bbe-8906-4ea0-84fa-ffe711b52c8b

is( # begin: a27558ee-9ba0-4552-96b1-ecf665b06556
    match_anagrams( "good", [ "dog", "goody" ] ),
    bag {
        end;
    },
    "does not detect anagram subsets",
); # end: a27558ee-9ba0-4552-96b1-ecf665b06556

is( # begin: 64cd4584-fc15-4781-b633-3d814c4941a4
    match_anagrams( "listen", [ "enlists", "google", "inlets", "banana" ] ),
    bag {
        item "inlets";
        end;
    },
    "detects anagram",
); # end: 64cd4584-fc15-4781-b633-3d814c4941a4

is( # begin: 99c91beb-838f-4ccd-b123-935139917283
    match_anagrams( "allergy", [ "gallery", "ballerina", "regally", "clergy", "largely", "leading" ] ),
    bag {
        item "gallery";
        item "regally";
        item "largely";
        end;
    },
    "detects three anagrams",
); # end: 99c91beb-838f-4ccd-b123-935139917283

is( # begin: 78487770-e258-4e1f-a646-8ece10950d90
    match_anagrams( "nose", [ "Eons", "ONES" ] ),
    bag {
        item "Eons";
        item "ONES";
        end;
    },
    "detects multiple anagrams with different case",
); # end: 78487770-e258-4e1f-a646-8ece10950d90

is( # begin: 1d0ab8aa-362f-49b7-9902-3d0c668d557b
    match_anagrams( "mass", ["last"] ),
    bag {
        end;
    },
    "does not detect non-anagrams with identical checksum",
); # end: 1d0ab8aa-362f-49b7-9902-3d0c668d557b

is( # begin: 9e632c0b-c0b1-4804-8cc1-e295dea6d8a8
    match_anagrams( "Orchestra", [ "cashregister", "Carthorse", "radishes" ] ),
    bag {
        item "Carthorse";
        end;
    },
    "detects anagrams case-insensitively",
); # end: 9e632c0b-c0b1-4804-8cc1-e295dea6d8a8

is( # begin: b248e49f-0905-48d2-9c8d-bd02d8c3e392
    match_anagrams( "Orchestra", [ "cashregister", "carthorse", "radishes" ] ),
    bag {
        item "carthorse";
        end;
    },
    "detects anagrams using case-insensitive subject",
); # end: b248e49f-0905-48d2-9c8d-bd02d8c3e392

is( # begin: f367325c-78ec-411c-be76-e79047f4bd54
    match_anagrams( "orchestra", [ "cashregister", "Carthorse", "radishes" ] ),
    bag {
        item "Carthorse";
        end;
    },
    "detects anagrams using case-insensitive possible matches",
); # end: f367325c-78ec-411c-be76-e79047f4bd54

is( # begin: 7cc195ad-e3c7-44ee-9fd2-d3c344806a2c
    match_anagrams( "go", ["go Go GO"] ),
    bag {
        end;
    },
    "does not detect an anagram if the original word is repeated",
); # end: 7cc195ad-e3c7-44ee-9fd2-d3c344806a2c

is( # begin: 9878a1c9-d6ea-4235-ae51-3ea2befd6842
    match_anagrams( "tapper", ["patter"] ),
    bag {
        end;
    },
    "anagrams must use all letters exactly once",
); # end: 9878a1c9-d6ea-4235-ae51-3ea2befd6842

is( # begin: 68934ed0-010b-4ef9-857a-20c9012d1ebf
    match_anagrams( "BANANA", ["BANANA"] ),
    bag {
        end;
    },
    "words are not anagrams of themselves",
); # end: 68934ed0-010b-4ef9-857a-20c9012d1ebf

is( # begin: 589384f3-4c8a-4e7d-9edc-51c3e5f0c90e
    match_anagrams( "BANANA", ["Banana"] ),
    bag {
        end;
    },
    "words are not anagrams of themselves even if letter case is partially different",
); # end: 589384f3-4c8a-4e7d-9edc-51c3e5f0c90e

is( # begin: ba53e423-7e02-41ee-9ae2-71f91e6d18e6
    match_anagrams( "BANANA", ["banana"] ),
    bag {
        end;
    },
    "words are not anagrams of themselves even if letter case is completely different",
); # end: ba53e423-7e02-41ee-9ae2-71f91e6d18e6

is( # begin: 33d3f67e-fbb9-49d3-a90e-0beb00861da7
    match_anagrams( "LISTEN", [ "LISTEN", "Silent" ] ),
    bag {
        item "Silent";
        end;
    },
    "words other than themselves can be anagrams",
); # end: 33d3f67e-fbb9-49d3-a90e-0beb00861da7

done_testing;
