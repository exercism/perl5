#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Grains qw<grains_on_square total_grains>;

is( # begin: 9fbde8de-36b2-49de-baf2-cd42d6f28405
    grains_on_square(1),
    1,
    "returns the number of grains on the square: grains on square 1",
); # end: 9fbde8de-36b2-49de-baf2-cd42d6f28405

is( # begin: ee1f30c2-01d8-4298-b25d-c677331b5e6d
    grains_on_square(2),
    2,
    "returns the number of grains on the square: grains on square 2",
); # end: ee1f30c2-01d8-4298-b25d-c677331b5e6d

is( # begin: 10f45584-2fc3-4875-8ec6-666065d1163b
    grains_on_square(3),
    4,
    "returns the number of grains on the square: grains on square 3",
); # end: 10f45584-2fc3-4875-8ec6-666065d1163b

is( # begin: a7cbe01b-36f4-4601-b053-c5f6ae055170
    grains_on_square(4),
    8,
    "returns the number of grains on the square: grains on square 4",
); # end: a7cbe01b-36f4-4601-b053-c5f6ae055170

is( # begin: c50acc89-8535-44e4-918f-b848ad2817d4
    grains_on_square(16),
    32768,
    "returns the number of grains on the square: grains on square 16",
); # end: c50acc89-8535-44e4-918f-b848ad2817d4

is( # begin: acd81b46-c2ad-4951-b848-80d15ed5a04f
    grains_on_square(32),
    2147483648,
    "returns the number of grains on the square: grains on square 32",
); # end: acd81b46-c2ad-4951-b848-80d15ed5a04f

is( # begin: c73b470a-5efb-4d53-9ac6-c5f6487f227b
    grains_on_square(64),
    9223372036854775808,
    "returns the number of grains on the square: grains on square 64",
); # end: c73b470a-5efb-4d53-9ac6-c5f6487f227b

like( # begin: 1d47d832-3e85-4974-9466-5bd35af484e3
    dies( sub { grains_on_square(0) } ),
    qr/square must be between 1 and 64/,
    "returns the number of grains on the square: square 0 is invalid",
); # end: 1d47d832-3e85-4974-9466-5bd35af484e3

like( # begin: 61974483-eeb2-465e-be54-ca5dde366453
    dies( sub { grains_on_square(-1) } ),
    qr/square must be between 1 and 64/,
    "returns the number of grains on the square: negative square is invalid",
); # end: 61974483-eeb2-465e-be54-ca5dde366453

like( # begin: a95e4374-f32c-45a7-a10d-ffec475c012f
    dies( sub { grains_on_square(65) } ),
    qr/square must be between 1 and 64/,
    "returns the number of grains on the square: square greater than 64 is invalid",
); # end: a95e4374-f32c-45a7-a10d-ffec475c012f

is( # begin: 6eb07385-3659-4b45-a6be-9dc474222750
    total_grains(),
    18446744073709551615,
    "returns the total number of grains on the board",
); # end: 6eb07385-3659-4b45-a6be-9dc474222750

done_testing;
