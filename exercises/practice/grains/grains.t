#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Grains qw<grains_on_square total_grains>;

imported_ok qw<grains_on_square total_grains> or bail_out;

is(
    grains_on_square(1),
    1,
    "returns the number of grains on the square: grains on square 1",
);

is(
    grains_on_square(2),
    2,
    "returns the number of grains on the square: grains on square 2",
);

is(
    grains_on_square(3),
    4,
    "returns the number of grains on the square: grains on square 3",
);

is(
    grains_on_square(4),
    8,
    "returns the number of grains on the square: grains on square 4",
);

is(
    grains_on_square(16),
    32768,
    "returns the number of grains on the square: grains on square 16",
);

is(
    grains_on_square(32),
    2147483648,
    "returns the number of grains on the square: grains on square 32",
);

is(
    grains_on_square(64),
    9223372036854775808,
    "returns the number of grains on the square: grains on square 64",
);

like(
    dies( sub { grains_on_square(0) } ),
    qr/square must be between 1 and 64/,
    "returns the number of grains on the square: square 0 raises an exception",
);

like(
    dies( sub { grains_on_square(-1) } ),
    qr/square must be between 1 and 64/,
    "returns the number of grains on the square: negative square raises an exception",
);

like(
    dies( sub { grains_on_square(65) } ),
    qr/square must be between 1 and 64/,
    "returns the number of grains on the square: square greater than 64 raises an exception",
);

is(
    total_grains(),
    18446744073709551615,
    "returns the total number of grains on the board",
);

done_testing;
