#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use SecretHandshake qw<handshake>;

is( # begin: b8496fbd-6778-468c-8054-648d03c4bb23
    handshake(1),
    ["wink"],
    "wink for 1",
); # end: b8496fbd-6778-468c-8054-648d03c4bb23

is( # begin: 83ec6c58-81a9-4fd1-bfaf-0160514fc0e3
    handshake(2),
    ["double blink"],
    "double blink for 10",
); # end: 83ec6c58-81a9-4fd1-bfaf-0160514fc0e3

is( # begin: 0e20e466-3519-4134-8082-5639d85fef71
    handshake(4),
    ["close your eyes"],
    "close your eyes for 100",
); # end: 0e20e466-3519-4134-8082-5639d85fef71

is( # begin: b339ddbb-88b7-4b7d-9b19-4134030d9ac0
    handshake(8),
    ["jump"],
    "jump for 1000",
); # end: b339ddbb-88b7-4b7d-9b19-4134030d9ac0

is( # begin: 40499fb4-e60c-43d7-8b98-0de3ca44e0eb
    handshake(3),
    [ "wink", "double blink" ],
    "combine two actions",
); # end: 40499fb4-e60c-43d7-8b98-0de3ca44e0eb

is( # begin: 9730cdd5-ef27-494b-afd3-5c91ad6c3d9d
    handshake(19),
    [ "double blink", "wink" ],
    "reverse two actions",
); # end: 9730cdd5-ef27-494b-afd3-5c91ad6c3d9d

is( # begin: 0b828205-51ca-45cd-90d5-f2506013f25f
    handshake(24),
    ["jump"],
    "reversing one action gives the same action",
); # end: 0b828205-51ca-45cd-90d5-f2506013f25f

is( # begin: 9949e2ac-6c9c-4330-b685-2089ab28b05f
    handshake(16),
    [],
    "reversing no actions still gives no actions",
); # end: 9949e2ac-6c9c-4330-b685-2089ab28b05f

is( # begin: 23fdca98-676b-4848-970d-cfed7be39f81
    handshake(15),
    [ "wink", "double blink", "close your eyes", "jump" ],
    "all possible actions",
); # end: 23fdca98-676b-4848-970d-cfed7be39f81

is( # begin: ae8fe006-d910-4d6f-be00-54b7c3799e79
    handshake(31),
    [ "jump", "close your eyes", "double blink", "wink" ],
    "reverse all possible actions",
); # end: ae8fe006-d910-4d6f-be00-54b7c3799e79

is( # begin: 3d36da37-b31f-4cdb-a396-d93a2ee1c4a5
    handshake(0),
    [],
    "do nothing for zero",
); # end: 3d36da37-b31f-4cdb-a396-d93a2ee1c4a5

done_testing;
