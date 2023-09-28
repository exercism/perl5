#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use CryptoSquare qw<cipher>;

is( # begin: 407c3837-9aa7-4111-ab63-ec54b58e8e9f
    cipher(""),
    "",
    "empty plaintext results in an empty ciphertext"
); # end: 407c3837-9aa7-4111-ab63-ec54b58e8e9f

is( # begin: aad04a25-b8bb-4304-888b-581bea8e0040
    cipher("... --- ..."),
    "",
    "normalization results in empty plaintext"
); # end: aad04a25-b8bb-4304-888b-581bea8e0040

is( # begin: 64131d65-6fd9-4f58-bdd8-4a2370fb481d
    cipher("A"),
    "a",
    "Lowercase"
); # end: 64131d65-6fd9-4f58-bdd8-4a2370fb481d

is( # begin: 63a4b0ed-1e3c-41ea-a999-f6f26ba447d6
    cipher("  b "),
    "b",
    "Remove spaces"
); # end: 63a4b0ed-1e3c-41ea-a999-f6f26ba447d6

is( # begin: 1b5348a1-7893-44c1-8197-42d48d18756c
    cipher("\@1,%!"),
    1,
    "Remove punctuation"
); # end: 1b5348a1-7893-44c1-8197-42d48d18756c

is( # begin: 8574a1d3-4a08-4cec-a7c7-de93a164f41a
    cipher("This is fun!"),
    "tsf hiu isn",
    "9 character plaintext results in 3 chunks of 3 characters"
); # end: 8574a1d3-4a08-4cec-a7c7-de93a164f41a

is( # begin: a65d3fa1-9e09-43f9-bcec-7a672aec3eae
    cipher("Chill out."),
    "clu hlt io ",
    "8 character plaintext results in 3 chunks, the last one with a trailing space"
); # end: a65d3fa1-9e09-43f9-bcec-7a672aec3eae

is( # begin: fbcb0c6d-4c39-4a31-83f6-c473baa6af80
    cipher("If man was meant to stay on the ground, god would have given us roots."),
    "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ",
    "54 character plaintext results in 7 chunks, the last two with trailing spaces"
); # end: fbcb0c6d-4c39-4a31-83f6-c473baa6af80

done_testing;
