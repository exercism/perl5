#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use AtbashCipher qw<encode_atbash decode_atbash>;

imported_ok qw<encode_atbash decode_atbash> or bail_out;

is(
    encode_atbash("yes"),
    "bvh",
    "encode: encode yes",
);

is(
    encode_atbash("no"),
    "ml",
    "encode: encode no",
);

is(
    encode_atbash("OMG"),
    "lnt",
    "encode: encode OMG",
);

is(
    encode_atbash("O M G"),
    "lnt",
    "encode: encode spaces",
);

is(
    encode_atbash("mindblowingly"),
    "nrmwy oldrm tob",
    "encode: encode mindblowingly",
);

is(
    encode_atbash("Testing,1 2 3, testing."),
    "gvhgr mt123 gvhgr mt",
    "encode: encode numbers",
);

is(
    encode_atbash("Truth is fiction."),
    "gifgs rhurx grlm",
    "encode: encode deep thought",
);

is(
    encode_atbash("The quick brown fox jumps over the lazy dog."),
    "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt",
    "encode: encode all the letters",
);

is(
    decode_atbash("vcvix rhn"),
    "exercism",
    "decode: decode exercism",
);

is(
    decode_atbash("zmlyh gzxov rhlug vmzhg vkkrm thglm v"),
    "anobstacleisoftenasteppingstone",
    "decode: decode a sentence",
);

is(
    decode_atbash("gvhgr mt123 gvhgr mt"),
    "testing123testing",
    "decode: decode numbers",
);

is(
    decode_atbash("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"),
    "thequickbrownfoxjumpsoverthelazydog",
    "decode: decode all the letters",
);

is(
    decode_atbash("vc vix    r hn"),
    "exercism",
    "decode: decode with too many spaces",
);

is(
    decode_atbash("zmlyhgzxovrhlugvmzhgvkkrmthglmv"),
    "anobstacleisoftenasteppingstone",
    "decode: decode with no spaces",
);

done_testing;
