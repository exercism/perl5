#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use AffineCipher qw<encode decode>;

is( # begin: 2ee1d9af-1c43-416c-b41b-cefd7d4d2b2a
    encode( "yes", 5, 7 ),
    "xbt",
    "encode: encode yes",
); # end: 2ee1d9af-1c43-416c-b41b-cefd7d4d2b2a

is( # begin: 785bade9-e98b-4d4f-a5b0-087ba3d7de4b
    encode( "no", 15, 18 ),
    "fu",
    "encode: encode no",
); # end: 785bade9-e98b-4d4f-a5b0-087ba3d7de4b

is( # begin: 2854851c-48fb-40d8-9bf6-8f192ed25054
    encode( "OMG", 21, 3 ),
    "lvz",
    "encode: encode OMG",
); # end: 2854851c-48fb-40d8-9bf6-8f192ed25054

is( # begin: bc0c1244-b544-49dd-9777-13a770be1bad
    encode( "O M G", 25, 47 ),
    "hjp",
    "encode: encode O M G",
); # end: bc0c1244-b544-49dd-9777-13a770be1bad

is( # begin: 381a1a20-b74a-46ce-9277-3778625c9e27
    encode( "mindblowingly", 11, 15 ),
    "rzcwa gnxzc dgt",
    "encode: encode mindblowingly",
); # end: 381a1a20-b74a-46ce-9277-3778625c9e27

is( # begin: 6686f4e2-753b-47d4-9715-876fdc59029d
    encode( "Testing,1 2 3, testing.", 3, 4 ),
    "jqgjc rw123 jqgjc rw",
    "encode: encode numbers",
); # end: 6686f4e2-753b-47d4-9715-876fdc59029d

is( # begin: ae23d5bd-30a8-44b6-afbe-23c8c0c7faa3
    encode( "Truth is fiction.", 5, 17 ),
    "iynia fdqfb ifje",
    "encode: encode deep thought",
); # end: ae23d5bd-30a8-44b6-afbe-23c8c0c7faa3

is( # begin: c93a8a4d-426c-42ef-9610-76ded6f7ef57
    encode( "The quick brown fox jumps over the lazy dog.", 17, 33 ),
    "swxtj npvyk lruol iejdc blaxk swxmh qzglf",
    "encode: encode all the letters",
); # end: c93a8a4d-426c-42ef-9610-76ded6f7ef57

like( # begin: 0673638a-4375-40bd-871c-fb6a2c28effb
    dies( sub { encode( "This is a test.", 6, 17 ) } ),
    qr(a and m must be coprime.),
    "encode: encode with a not coprime to m",
); # end: 0673638a-4375-40bd-871c-fb6a2c28effb

is( # begin: 3f0ac7e2-ec0e-4a79-949e-95e414953438
    decode( "tytgn fjr", 3, 7 ),
    "exercism",
    "decode: decode exercism",
); # end: 3f0ac7e2-ec0e-4a79-949e-95e414953438

is( # begin: 241ee64d-5a47-4092-a5d7-7939d259e077
    decode( "qdwju nqcro muwhn odqun oppmd aunwd o", 19, 16 ),
    "anobstacleisoftenasteppingstone",
    "decode: decode a sentence",
); # end: 241ee64d-5a47-4092-a5d7-7939d259e077

is( # begin: 33fb16a1-765a-496f-907f-12e644837f5e
    decode( "odpoz ub123 odpoz ub", 25, 7 ),
    "testing123testing",
    "decode: decode numbers",
); # end: 33fb16a1-765a-496f-907f-12e644837f5e

is( # begin: 20bc9dce-c5ec-4db6-a3f1-845c776bcbf7
    decode( "swxtj npvyk lruol iejdc blaxk swxmh qzglf", 17, 33 ),
    "thequickbrownfoxjumpsoverthelazydog",
    "decode: decode all the letters",
); # end: 20bc9dce-c5ec-4db6-a3f1-845c776bcbf7

is( # begin: 623e78c0-922d-49c5-8702-227a3e8eaf81
    decode( "swxtjnpvyklruoliejdcblaxkswxmhqzglf", 17, 33 ),
    "thequickbrownfoxjumpsoverthelazydog",
    "decode: decode with no spaces in input",
); # end: 623e78c0-922d-49c5-8702-227a3e8eaf81

is( # begin: 58fd5c2a-1fd9-4563-a80a-71cff200f26f
    decode( "vszzm    cly   yd cg    qdp", 15, 16 ),
    "jollygreengiant",
    "decode: decode with too many spaces",
); # end: 58fd5c2a-1fd9-4563-a80a-71cff200f26f

like( # begin: b004626f-c186-4af9-a3f4-58f74cdb86d5
    dies( sub { decode( "Test", 13, 5 ) } ),
    qr(a and m must be coprime.),
    "decode: decode with a not coprime to m",
); # end: b004626f-c186-4af9-a3f4-58f74cdb86d5

done_testing;
