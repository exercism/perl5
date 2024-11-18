#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use RotationalCipher qw<caesar_cipher>;

is( # begin: 74e58a38-e484-43f1-9466-877a7515e10f
    caesar_cipher( "a", 0 ),
    "a",
    "rotate a by 0, same output as input"
); # end: 74e58a38-e484-43f1-9466-877a7515e10f

is( # begin: 7ee352c6-e6b0-4930-b903-d09943ecb8f5
    caesar_cipher( "a", 1 ),
    "b",
    "rotate a by 1"
); # end: 7ee352c6-e6b0-4930-b903-d09943ecb8f5

is( # begin: edf0a733-4231-4594-a5ee-46a4009ad764
    caesar_cipher( "a", 26 ),
    "a",
    "rotate a by 26, same output as input"
); # end: edf0a733-4231-4594-a5ee-46a4009ad764

is( # begin: e3e82cb9-2a5b-403f-9931-e43213879300
    caesar_cipher( "m", 13 ),
    "z",
    "rotate m by 13"
); # end: e3e82cb9-2a5b-403f-9931-e43213879300

is( # begin: 19f9eb78-e2ad-4da4-8fe3-9291d47c1709
    caesar_cipher( "n", 13 ),
    "a",
    "rotate n by 13 with wrap around alphabet"
); # end: 19f9eb78-e2ad-4da4-8fe3-9291d47c1709

is( # begin: a116aef4-225b-4da9-884f-e8023ca6408a
    caesar_cipher( "OMG", 5 ),
    "TRL",
    "rotate capital letters"
); # end: a116aef4-225b-4da9-884f-e8023ca6408a

is( # begin: 71b541bb-819c-4dc6-a9c3-132ef9bb737b
    caesar_cipher( "O M G", 5 ),
    "T R L",
    "rotate spaces"
); # end: 71b541bb-819c-4dc6-a9c3-132ef9bb737b

is( # begin: ef32601d-e9ef-4b29-b2b5-8971392282e6
    caesar_cipher( "Testing 1 2 3 testing", 4 ),
    "Xiwxmrk 1 2 3 xiwxmrk",
    "rotate numbers"
); # end: ef32601d-e9ef-4b29-b2b5-8971392282e6

is( # begin: 32dd74f6-db2b-41a6-b02c-82eb4f93e549
    caesar_cipher( "Let's eat, Grandma!", 21 ),
    "Gzo'n zvo, Bmviyhv!",
    "rotate punctuation"
); # end: 32dd74f6-db2b-41a6-b02c-82eb4f93e549

is( # begin: 9fb93fe6-42b0-46e6-9ec1-0bf0a062d8c9
    caesar_cipher( "The quick brown fox jumps over the lazy dog.", 13 ),
    "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.",
    "rotate all letters"
); # end: 9fb93fe6-42b0-46e6-9ec1-0bf0a062d8c9

done_testing;
