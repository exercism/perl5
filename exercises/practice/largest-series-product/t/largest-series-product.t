#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use LargestSeriesProduct qw<largest_product>;

is( # begin: 7c82f8b7-e347-48ee-8a22-f672323324d4
    largest_product( "29", 2 ),
    18,
    "finds the largest product if span equals length",
); # end: 7c82f8b7-e347-48ee-8a22-f672323324d4

is( # begin: 88523f65-21ba-4458-a76a-b4aaf6e4cb5e
    largest_product( "0123456789", 2 ),
    72,
    "can find the largest product of 2 with numbers in order",
); # end: 88523f65-21ba-4458-a76a-b4aaf6e4cb5e

is( # begin: f1376b48-1157-419d-92c2-1d7e36a70b8a
    largest_product( "576802143", 2 ),
    48,
    "can find the largest product of 2",
); # end: f1376b48-1157-419d-92c2-1d7e36a70b8a

is( # begin: 46356a67-7e02-489e-8fea-321c2fa7b4a4
    largest_product( "0123456789", 3 ),
    504,
    "can find the largest product of 3 with numbers in order",
); # end: 46356a67-7e02-489e-8fea-321c2fa7b4a4

is( # begin: a2dcb54b-2b8f-4993-92dd-5ce56dece64a
    largest_product( "1027839564", 3 ),
    270,
    "can find the largest product of 3",
); # end: a2dcb54b-2b8f-4993-92dd-5ce56dece64a

is( # begin: 673210a3-33cd-4708-940b-c482d7a88f9d
    largest_product( "0123456789", 5 ),
    15120,
    "can find the largest product of 5 with numbers in order",
); # end: 673210a3-33cd-4708-940b-c482d7a88f9d

is( # begin: 02acd5a6-3bbf-46df-8282-8b313a80a7c9
    largest_product( "73167176531330624919225119674426574742355349194934", 6 ),
    23520,
    "can get the largest product of a big number",
); # end: 02acd5a6-3bbf-46df-8282-8b313a80a7c9

is( # begin: 76dcc407-21e9-424c-a98e-609f269622b5
    largest_product( "0000", 2 ),
    0,
    "reports zero if the only digits are zero",
); # end: 76dcc407-21e9-424c-a98e-609f269622b5

is( # begin: 6ef0df9f-52d4-4a5d-b210-f6fae5f20e19
    largest_product( "99099", 3 ),
    0,
    "reports zero if all spans include zero",
); # end: 6ef0df9f-52d4-4a5d-b210-f6fae5f20e19

like( # begin: 5d81aaf7-4f67-4125-bf33-11493cc7eab7
    dies( sub { largest_product( "123", 4 ) } ),
    qr/span must be smaller than string length/,
    "rejects span longer than string length",
); # end: 5d81aaf7-4f67-4125-bf33-11493cc7eab7

like( # begin: 6d96c691-4374-4404-80ee-2ea8f3613dd4
    dies( sub { largest_product( "", 1 ) } ),
    qr/span must be smaller than string length/,
    "rejects empty string and nonzero span",
); # end: 6d96c691-4374-4404-80ee-2ea8f3613dd4

like( # begin: 7a38f2d6-3c35-45f6-8d6f-12e6e32d4d74
    dies( sub { largest_product( "1234a5", 2 ) } ),
    qr/digits input must only contain digits/,
    "rejects invalid character in digits",
); # end: 7a38f2d6-3c35-45f6-8d6f-12e6e32d4d74

like( # begin: c859f34a-9bfe-4897-9c2f-6d7f8598e7f0
    dies( sub { largest_product( "12345", -1 ) } ),
    qr/span must not be negative/,
    "rejects negative span",
); # end: c859f34a-9bfe-4897-9c2f-6d7f8598e7f0

done_testing;
