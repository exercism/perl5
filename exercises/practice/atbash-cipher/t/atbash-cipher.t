#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use AtbashCipher qw<encode_atbash decode_atbash>;

is( # begin: 2f47ebe1-eab9-4d6b-b3c6-627562a31c77
    encode_atbash("yes"),
    "bvh",
    "encode: encode yes",
); # end: 2f47ebe1-eab9-4d6b-b3c6-627562a31c77

is( # begin: b4ffe781-ea81-4b74-b268-cc58ba21c739
    encode_atbash("no"),
    "ml",
    "encode: encode no",
); # end: b4ffe781-ea81-4b74-b268-cc58ba21c739

is( # begin: 10e48927-24ab-4c4d-9d3f-3067724ace00
    encode_atbash("OMG"),
    "lnt",
    "encode: encode OMG",
); # end: 10e48927-24ab-4c4d-9d3f-3067724ace00

is( # begin: d59b8bc3-509a-4a9a-834c-6f501b98750b
    encode_atbash("O M G"),
    "lnt",
    "encode: encode spaces",
); # end: d59b8bc3-509a-4a9a-834c-6f501b98750b

is( # begin: 31d44b11-81b7-4a94-8b43-4af6a2449429
    encode_atbash("mindblowingly"),
    "nrmwy oldrm tob",
    "encode: encode mindblowingly",
); # end: 31d44b11-81b7-4a94-8b43-4af6a2449429

is( # begin: d503361a-1433-48c0-aae0-d41b5baa33ff
    encode_atbash("Testing,1 2 3, testing."),
    "gvhgr mt123 gvhgr mt",
    "encode: encode numbers",
); # end: d503361a-1433-48c0-aae0-d41b5baa33ff

is( # begin: 79c8a2d5-0772-42d4-b41b-531d0b5da926
    encode_atbash("Truth is fiction."),
    "gifgs rhurx grlm",
    "encode: encode deep thought",
); # end: 79c8a2d5-0772-42d4-b41b-531d0b5da926

is( # begin: 9ca13d23-d32a-4967-a1fd-6100b8742bab
    encode_atbash("The quick brown fox jumps over the lazy dog."),
    "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt",
    "encode: encode all the letters",
); # end: 9ca13d23-d32a-4967-a1fd-6100b8742bab

is( # begin: bb50e087-7fdf-48e7-9223-284fe7e69851
    decode_atbash("vcvix rhn"),
    "exercism",
    "decode: decode exercism",
); # end: bb50e087-7fdf-48e7-9223-284fe7e69851

is( # begin: ac021097-cd5d-4717-8907-b0814b9e292c
    decode_atbash("zmlyh gzxov rhlug vmzhg vkkrm thglm v"),
    "anobstacleisoftenasteppingstone",
    "decode: decode a sentence",
); # end: ac021097-cd5d-4717-8907-b0814b9e292c

is( # begin: 18729de3-de74-49b8-b68c-025eaf77f851
    decode_atbash("gvhgr mt123 gvhgr mt"),
    "testing123testing",
    "decode: decode numbers",
); # end: 18729de3-de74-49b8-b68c-025eaf77f851

is( # begin: 0f30325f-f53b-415d-ad3e-a7a4f63de034
    decode_atbash("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"),
    "thequickbrownfoxjumpsoverthelazydog",
    "decode: decode all the letters",
); # end: 0f30325f-f53b-415d-ad3e-a7a4f63de034

is( # begin: 39640287-30c6-4c8c-9bac-9d613d1a5674
    decode_atbash("vc vix    r hn"),
    "exercism",
    "decode: decode with too many spaces",
); # end: 39640287-30c6-4c8c-9bac-9d613d1a5674

is( # begin: b34edf13-34c0-49b5-aa21-0768928000d5
    decode_atbash("zmlyhgzxovrhlugvmzhgvkkrmthglmv"),
    "anobstacleisoftenasteppingstone",
    "decode: decode with no spaces",
); # end: b34edf13-34c0-49b5-aa21-0768928000d5

done_testing;
