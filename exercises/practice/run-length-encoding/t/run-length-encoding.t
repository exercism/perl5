#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use RunLengthEncoding qw<encode decode>;

is( # begin: ad53b61b-6ffc-422f-81a6-61f7df92a231
    encode(""),
    "",
    "run-length encode a string: empty string",
); # end: ad53b61b-6ffc-422f-81a6-61f7df92a231

is( # begin: 52012823-b7e6-4277-893c-5b96d42f82de
    encode("XYZ"),
    "XYZ",
    "run-length encode a string: single characters only are encoded without count",
); # end: 52012823-b7e6-4277-893c-5b96d42f82de

is( # begin: b7868492-7e3a-415f-8da3-d88f51f80409
    encode("AABBBCCCC"),
    "2A3B4C",
    "run-length encode a string: string with no single characters",
); # end: b7868492-7e3a-415f-8da3-d88f51f80409

is( # begin: 859b822b-6e9f-44d6-9c46-6091ee6ae358
    encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"),
    "12WB12W3B24WB",
    "run-length encode a string: single characters mixed with repeated characters",
); # end: 859b822b-6e9f-44d6-9c46-6091ee6ae358

is( # begin: 1b34de62-e152-47be-bc88-469746df63b3
    encode("  hsqq qww  "),
    "2 hs2q q2w2 ",
    "run-length encode a string: multiple whitespace mixed in string",
); # end: 1b34de62-e152-47be-bc88-469746df63b3

is( # begin: abf176e2-3fbd-40ad-bb2f-2dd6d4df721a
    encode("aabbbcccc"),
    "2a3b4c",
    "run-length encode a string: lowercase characters",
); # end: abf176e2-3fbd-40ad-bb2f-2dd6d4df721a

is( # begin: 7ec5c390-f03c-4acf-ac29-5f65861cdeb5
    decode(""),
    "",
    "run-length decode a string: empty string",
); # end: 7ec5c390-f03c-4acf-ac29-5f65861cdeb5

is( # begin: ad23f455-1ac2-4b0e-87d0-b85b10696098
    decode("XYZ"),
    "XYZ",
    "run-length decode a string: single characters only",
); # end: ad23f455-1ac2-4b0e-87d0-b85b10696098

is( # begin: 21e37583-5a20-4a0e-826c-3dee2c375f54
    decode("2A3B4C"),
    "AABBBCCCC",
    "run-length decode a string: string with no single characters",
); # end: 21e37583-5a20-4a0e-826c-3dee2c375f54

is( # begin: 1389ad09-c3a8-4813-9324-99363fba429c
    decode("12WB12W3B24WB"),
    "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB",
    "run-length decode a string: single characters with repeated characters",
); # end: 1389ad09-c3a8-4813-9324-99363fba429c

is( # begin: 3f8e3c51-6aca-4670-b86c-a213bf4706b0
    decode("2 hs2q q2w2 "),
    "  hsqq qww  ",
    "run-length decode a string: multiple whitespace mixed in string",
); # end: 3f8e3c51-6aca-4670-b86c-a213bf4706b0

is( # begin: 29f721de-9aad-435f-ba37-7662df4fb551
    decode("2a3b4c"),
    "aabbbcccc",
    "run-length decode a string: lowercase string",
); # end: 29f721de-9aad-435f-ba37-7662df4fb551

is( # begin: 2a762efd-8695-4e04-b0d6-9736899fbc16
    decode( encode("zzz ZZ  zZ") ),
    "zzz ZZ  zZ",
    "encode and then decode: encode followed by decode gives original string",
); # end: 2a762efd-8695-4e04-b0d6-9736899fbc16

done_testing;
