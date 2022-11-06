#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use AllYourBase qw<rebase>;

imported_ok qw<rebase> or bail_out;

is(
    rebase( [1], 2, 10 ),
    [1],
    "single bit one to decimal",
);

is(
    rebase( [ 1, 0, 1 ], 2, 10 ),
    [5],
    "binary to single decimal",
);

is(
    rebase( [5], 10, 2 ),
    [ 1, 0, 1 ],
    "single decimal to binary",
);

is(
    rebase( [ 1, 0, 1, 0, 1, 0 ], 2, 10 ),
    [ 4, 2 ],
    "binary to multiple decimal",
);

is(
    rebase( [ 4, 2 ], 10, 2 ),
    [ 1, 0, 1, 0, 1, 0 ],
    "decimal to binary",
);

is(
    rebase( [ 1, 1, 2, 0 ], 3, 16 ),
    [ 2, 10 ],
    "trinary to hexadecimal",
);

is(
    rebase( [ 2, 10 ], 16, 3 ),
    [ 1, 1, 2, 0 ],
    "hexadecimal to trinary",
);

is(
    rebase( [ 3, 46, 60 ], 97, 73 ),
    [ 6, 10, 45 ],
    "15-bit integer",
);

is(
    rebase( [], 2, 10 ),
    [0],
    "empty list",
);

is(
    rebase( [0], 10, 2 ),
    [0],
    "single zero",
);

is(
    rebase( [ 0, 0, 0 ], 10, 2 ),
    [0],
    "multiple zeros",
);

is(
    rebase( [ 0, 6, 0 ], 7, 10 ),
    [ 4, 2 ],
    "leading zeros",
);

like(
    dies( sub { rebase( [0], 1, 10 ) } ),
    qr/input base must be >= 2/,
    "input base is one",
);

like(
    dies( sub { rebase( [], 0, 10 ) } ),
    qr/input base must be >= 2/,
    "input base is zero",
);

like(
    dies( sub { rebase( [1], -2, 10 ) } ),
    qr/input base must be >= 2/,
    "input base is negative",
);

like(
    dies( sub { rebase( [ 1, -1, 1, 0, 1, 0 ], 2, 10 ) } ),
    qr/all digits must satisfy 0 <= d < input base/,
    "negative digit",
);

like(
    dies( sub { rebase( [ 1, 2, 1, 0, 1, 0 ], 2, 10 ) } ),
    qr/all digits must satisfy 0 <= d < input base/,
    "invalid positive digit",
);

like(
    dies( sub { rebase( [ 1, 0, 1, 0, 1, 0 ], 2, 1 ) } ),
    qr/output base must be >= 2/,
    "output base is one",
);

like(
    dies( sub { rebase( [7], 10, 0 ) } ),
    qr/output base must be >= 2/,
    "output base is zero",
);

like(
    dies( sub { rebase( [1], 2, -7 ) } ),
    qr/output base must be >= 2/,
    "output base is negative",
);

like(
    dies( sub { rebase( [1], -2, -7 ) } ),
    qr/input base must be >= 2/,
    "both bases are negative",
);

done_testing;
