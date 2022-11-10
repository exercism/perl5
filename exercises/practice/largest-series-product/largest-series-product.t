#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use LargestSeriesProduct qw<largest_product>;

imported_ok qw<largest_product> or bail_out;

is(
    largest_product( "29", 2 ),
    18,
    "finds the largest product if span equals length",
);

is(
    largest_product( "0123456789", 2 ),
    72,
    "can find the largest product of 2 with numbers in order",
);

is(
    largest_product( "576802143", 2 ),
    48,
    "can find the largest product of 2",
);

is(
    largest_product( "0123456789", 3 ),
    504,
    "can find the largest product of 3 with numbers in order",
);

is(
    largest_product( "1027839564", 3 ),
    270,
    "can find the largest product of 3",
);

is(
    largest_product( "0123456789", 5 ),
    15120,
    "can find the largest product of 5 with numbers in order",
);

is(
    largest_product(
        "73167176531330624919225119674426574742355349194934", 6
    ),
    23520,
    "can get the largest product of a big number",
);

is(
    largest_product( "0000", 2 ),
    0,
    "reports zero if the only digits are zero",
);

is(
    largest_product( "99099", 3 ),
    0,
    "reports zero if all spans include zero",
);

like(
    dies( sub { largest_product( "123", 4 ) } ),
    qr/span must be smaller than string length/,
    "rejects span longer than string length",
);

is(
    largest_product( "", 0 ),
    1,
    "reports 1 for empty string and empty product (0 span)",
);

is(
    largest_product( "123", 0 ),
    1,
    "reports 1 for nonempty string and empty product (0 span)",
);

like(
    dies( sub { largest_product( "", 1 ) } ),
    qr/span must be smaller than string length/,
    "rejects empty string and nonzero span",
);

like(
    dies( sub { largest_product( "1234a5", 2 ) } ),
    qr/digits input must only contain digits/,
    "rejects invalid character in digits",
);

like(
    dies( sub { largest_product( "12345", -1 ) } ),
    qr/span must not be negative/,
    "rejects negative span",
);

done_testing;
