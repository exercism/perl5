#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use SimpleCipher ();

can_ok 'SimpleCipher', qw<key encode decode> or bail_out;

my $cipher;

$cipher = SimpleCipher->new;
is(
    $cipher->encode("aaaaaaaaaa"),
    substr( $cipher->key, 0, 10 ),
    "Random key cipher: Can encode",
);

$cipher = SimpleCipher->new;
is(
    $cipher->decode( substr( $cipher->key, 0, 10 ) ),
    "aaaaaaaaaa",
    "Random key cipher: Can decode",
);

$cipher = SimpleCipher->new;
is(
    $cipher->decode( $cipher->encode("abcdefghij") ),
    "abcdefghij",
    "Random key cipher: Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method",
);

$cipher = SimpleCipher->new;
like(
    $cipher->key,
    qr/^[a-z]+$/,
    "Random key cipher: Key is made only of lowercase letters",
);

$cipher = SimpleCipher->new( key => "abcdefghij" );
is(
    $cipher->encode("aaaaaaaaaa"),
    "abcdefghij",
    "Substitution cipher: Can encode",
);

$cipher = SimpleCipher->new( key => "abcdefghij" );
is(
    $cipher->decode("abcdefghij"),
    "aaaaaaaaaa",
    "Substitution cipher: Can decode",
);

$cipher = SimpleCipher->new( key => "abcdefghij" );
is(
    $cipher->decode( $cipher->encode("abcdefghij") ),
    "abcdefghij",
    "Substitution cipher: Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method",
);

$cipher = SimpleCipher->new( key => "iamapandabear" );
is(
    $cipher->encode("iamapandabear"),
    "qayaeaagaciai",
    "Substitution cipher: Can double shift encode",
);

$cipher = SimpleCipher->new( key => "abcdefghij" );
is(
    $cipher->encode("zzzzzzzzzz"),
    "zabcdefghi",
    "Substitution cipher: Can wrap on encode",
);

$cipher = SimpleCipher->new( key => "abcdefghij" );
is(
    $cipher->decode("zabcdefghi"),
    "zzzzzzzzzz",
    "Substitution cipher: Can wrap on decode",
);

$cipher = SimpleCipher->new( key => "abc" );
is(
    $cipher->encode("iamapandabear"),
    "iboaqcnecbfcr",
    "Substitution cipher: Can encode messages longer than the key",
);

$cipher = SimpleCipher->new( key => "abc" );
is(
    $cipher->decode("iboaqcnecbfcr"),
    "iamapandabear",
    "Substitution cipher: Can decode messages longer than the key",
);

done_testing;
