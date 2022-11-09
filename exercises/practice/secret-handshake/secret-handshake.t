#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use SecretHandshake qw<handshake>;

imported_ok qw<handshake> or bail_out;

is(
    handshake(1),
    ["wink"],
    "wink for 1",
);

is(
    handshake(2),
    ["double blink"],
    "double blink for 10",
);

is(
    handshake(4),
    ["close your eyes"],
    "close your eyes for 100",
);

is(
    handshake(8),
    ["jump"],
    "jump for 1000",
);

is(
    handshake(3),
    [ "wink", "double blink" ],
    "combine two actions",
);

is(
    handshake(19),
    [ "double blink", "wink" ],
    "reverse two actions",
);

is(
    handshake(24),
    ["jump"],
    "reversing one action gives the same action",
);

is(
    handshake(16),
    [],
    "reversing no actions still gives no actions",
);

is(
    handshake(15),
    [ "wink", "double blink", "close your eyes", "jump" ],
    "all possible actions",
);

is(
    handshake(31),
    [ "jump", "close your eyes", "double blink", "wink" ],
    "reverse all possible actions",
);

is(
    handshake(0),
    [],
    "do nothing for zero",
);

done_testing;
