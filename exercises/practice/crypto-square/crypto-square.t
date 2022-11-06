#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use CryptoSquare qw<cipher>;

imported_ok qw<cipher> or bail_out;

is(
    cipher(""),
    "",
    "empty plaintext results in an empty ciphertext"
);

is(
    cipher("... --- ..."),
    "",
    "normalization results in empty plaintext"
);

is(
    cipher("A"),
    "a",
    "Lowercase"
);

is(
    cipher("  b "),
    "b",
    "Remove spaces"
);

is(
    cipher("\@1,%!"),
    1,
    "Remove punctuation"
);

is(
    cipher("This is fun!"),
    "tsf hiu isn",
    "9 character plaintext results in 3 chunks of 3 characters"
);

is(
    cipher("Chill out."),
    "clu hlt io ",
    "8 character plaintext results in 3 chunks, the last one with a trailing space"
);

is(
    cipher(
        "If man was meant to stay on the ground, god would have given us roots."
    ),
    "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ",
    "54 character plaintext results in 7 chunks, the last two with trailing spaces"
);

done_testing;
