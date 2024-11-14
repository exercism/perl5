#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Pangram qw<is_pangram>;

is( # begin: 64f61791-508e-4f5c-83ab-05de042b0149
    is_pangram(""),
    DF, # Defined but False
    "empty sentence"
); # end: 64f61791-508e-4f5c-83ab-05de042b0149

is( # begin: 74858f80-4a4d-478b-8a5e-c6477e4e4e84
    is_pangram("abcdefghijklmnopqrstuvwxyz"),
    T, # True
    "perfect lower case"
); # end: 74858f80-4a4d-478b-8a5e-c6477e4e4e84

is( # begin: 61288860-35ca-4abe-ba08-f5df76ecbdcd
    is_pangram("the quick brown fox jumps over the lazy dog"),
    T, # True
    "only lower case"
); # end: 61288860-35ca-4abe-ba08-f5df76ecbdcd

is( # begin: 6564267d-8ac5-4d29-baf2-e7d2e304a743
    is_pangram("a quick movement of the enemy will jeopardize five gunboats"),
    DF, # Defined but False
    "missing the letter 'x'"
); # end: 6564267d-8ac5-4d29-baf2-e7d2e304a743

is( # begin: c79af1be-d715-4cdb-a5f2-b2fa3e7e0de0
    is_pangram("five boxing wizards jump quickly at it"),
    DF, # Defined but False
    "missing the letter 'h'"
); # end: c79af1be-d715-4cdb-a5f2-b2fa3e7e0de0

is( # begin: d835ec38-bc8f-48e4-9e36-eb232427b1df
    is_pangram("the_quick_brown_fox_jumps_over_the_lazy_dog"),
    T, # True
    "with underscores"
); # end: d835ec38-bc8f-48e4-9e36-eb232427b1df

is( # begin: 8cc1e080-a178-4494-b4b3-06982c9be2a8
    is_pangram("the 1 quick brown fox jumps over the 2 lazy dogs"),
    T, # True
    "with numbers"
); # end: 8cc1e080-a178-4494-b4b3-06982c9be2a8

is( # begin: bed96b1c-ff95-45b8-9731-fdbdcb6ede9a
    is_pangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"),
    DF, # Defined but False
    "missing letters replaced by numbers"
); # end: bed96b1c-ff95-45b8-9731-fdbdcb6ede9a

is( # begin: 938bd5d8-ade5-40e2-a2d9-55a338a01030
    is_pangram("\"Five quacking Zephyrs jolt my wax bed.\""),
    T, # True
    "mixed case and punctuation"
); # end: 938bd5d8-ade5-40e2-a2d9-55a338a01030

is( # begin: 7138e389-83e4-4c6e-8413-1e40a0076951
    is_pangram("abcdefghijklm ABCDEFGHIJKLM"),
    DF, # Defined but False
    "a-m and A-M are 26 different characters but not a pangram"
); # end: 7138e389-83e4-4c6e-8413-1e40a0076951

done_testing;
