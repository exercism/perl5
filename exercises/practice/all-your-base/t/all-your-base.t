#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use AllYourBase qw<rebase>;

is( # begin: 5ce422f9-7a4b-4f44-ad29-49c67cb32d2c
    rebase( [1], 2, 10 ),
    [1],
    "single bit one to decimal",
); # end: 5ce422f9-7a4b-4f44-ad29-49c67cb32d2c

is( # begin: 0cc3fea8-bb79-46ac-a2ab-5a2c93051033
    rebase( [ 1, 0, 1 ], 2, 10 ),
    [5],
    "binary to single decimal",
); # end: 0cc3fea8-bb79-46ac-a2ab-5a2c93051033

is( # begin: f12db0f9-0d3d-42c2-b3ba-e38cb375a2b8
    rebase( [5], 10, 2 ),
    [ 1, 0, 1 ],
    "single decimal to binary",
); # end: f12db0f9-0d3d-42c2-b3ba-e38cb375a2b8

is( # begin: 2c45cf54-6da3-4748-9733-5a3c765d925b
    rebase( [ 1, 0, 1, 0, 1, 0 ], 2, 10 ),
    [ 4, 2 ],
    "binary to multiple decimal",
); # end: 2c45cf54-6da3-4748-9733-5a3c765d925b

is( # begin: 65ddb8b4-8899-4fcc-8618-181b2cf0002d
    rebase( [ 4, 2 ], 10, 2 ),
    [ 1, 0, 1, 0, 1, 0 ],
    "decimal to binary",
); # end: 65ddb8b4-8899-4fcc-8618-181b2cf0002d

is( # begin: 8d418419-02a7-4824-8b7a-352d33c6987e
    rebase( [ 1, 1, 2, 0 ], 3, 16 ),
    [ 2, 10 ],
    "trinary to hexadecimal",
); # end: 8d418419-02a7-4824-8b7a-352d33c6987e

is( # begin: d3901c80-8190-41b9-bd86-38d988efa956
    rebase( [ 2, 10 ], 16, 3 ),
    [ 1, 1, 2, 0 ],
    "hexadecimal to trinary",
); # end: d3901c80-8190-41b9-bd86-38d988efa956

is( # begin: 5d42f85e-21ad-41bd-b9be-a3e8e4258bbf
    rebase( [ 3, 46, 60 ], 97, 73 ),
    [ 6, 10, 45 ],
    "15-bit integer",
); # end: 5d42f85e-21ad-41bd-b9be-a3e8e4258bbf

is( # begin: d68788f7-66dd-43f8-a543-f15b6d233f83
    rebase( [], 2, 10 ),
    [0],
    "empty list",
); # end: d68788f7-66dd-43f8-a543-f15b6d233f83

is( # begin: 5e27e8da-5862-4c5f-b2a9-26c0382b6be7
    rebase( [0], 10, 2 ),
    [0],
    "single zero",
); # end: 5e27e8da-5862-4c5f-b2a9-26c0382b6be7

is( # begin: 2e1c2573-77e4-4b9c-8517-6c56c5bcfdf2
    rebase( [ 0, 0, 0 ], 10, 2 ),
    [0],
    "multiple zeros",
); # end: 2e1c2573-77e4-4b9c-8517-6c56c5bcfdf2

is( # begin: 3530cd9f-8d6d-43f5-bc6e-b30b1db9629b
    rebase( [ 0, 6, 0 ], 7, 10 ),
    [ 4, 2 ],
    "leading zeros",
); # end: 3530cd9f-8d6d-43f5-bc6e-b30b1db9629b

like( # begin: a6b476a1-1901-4f2a-92c4-4d91917ae023
    dies( sub { rebase( [0], 1, 10 ) } ),
    qr/input base must be >= 2/,
    "input base is one",
); # end: a6b476a1-1901-4f2a-92c4-4d91917ae023

like( # begin: e21a693a-7a69-450b-b393-27415c26a016
    dies( sub { rebase( [], 0, 10 ) } ),
    qr/input base must be >= 2/,
    "input base is zero",
); # end: e21a693a-7a69-450b-b393-27415c26a016

like( # begin: 54a23be5-d99e-41cc-88e0-a650ffe5fcc2
    dies( sub { rebase( [1], -2, 10 ) } ),
    qr/input base must be >= 2/,
    "input base is negative",
); # end: 54a23be5-d99e-41cc-88e0-a650ffe5fcc2

like( # begin: 9eccf60c-dcc9-407b-95d8-c37b8be56bb6
    dies( sub { rebase( [ 1, -1, 1, 0, 1, 0 ], 2, 10 ) } ),
    qr/all digits must satisfy 0 <= d < input base/,
    "negative digit",
); # end: 9eccf60c-dcc9-407b-95d8-c37b8be56bb6

like( # begin: 232fa4a5-e761-4939-ba0c-ed046cd0676a
    dies( sub { rebase( [ 1, 2, 1, 0, 1, 0 ], 2, 10 ) } ),
    qr/all digits must satisfy 0 <= d < input base/,
    "invalid positive digit",
); # end: 232fa4a5-e761-4939-ba0c-ed046cd0676a

like( # begin: 14238f95-45da-41dc-95ce-18f860b30ad3
    dies( sub { rebase( [ 1, 0, 1, 0, 1, 0 ], 2, 1 ) } ),
    qr/output base must be >= 2/,
    "output base is one",
); # end: 14238f95-45da-41dc-95ce-18f860b30ad3

like( # begin: 73dac367-da5c-4a37-95fe-c87fad0a4047
    dies( sub { rebase( [7], 10, 0 ) } ),
    qr/output base must be >= 2/,
    "output base is zero",
); # end: 73dac367-da5c-4a37-95fe-c87fad0a4047

like( # begin: 13f81f42-ff53-4e24-89d9-37603a48ebd9
    dies( sub { rebase( [1], 2, -7 ) } ),
    qr/output base must be >= 2/,
    "output base is negative",
); # end: 13f81f42-ff53-4e24-89d9-37603a48ebd9

like( # begin: 0e6c895d-8a5d-4868-a345-309d094cfe8d
    dies( sub { rebase( [1], -2, -7 ) } ),
    qr/input base must be >= 2/,
    "both bases are negative",
); # end: 0e6c895d-8a5d-4868-a345-309d094cfe8d

done_testing;
