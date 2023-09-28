#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use SimpleCipher ();

my $cipher;

$cipher = SimpleCipher->new; # begin: b8bdfbe1-bea3-41bb-a999-b41403f2b15d
is(
    $cipher->encode("aaaaaaaaaa"),
    substr( $cipher->key, 0, 10 ),
    "Random key cipher: Can encode",
); # end: b8bdfbe1-bea3-41bb-a999-b41403f2b15d

$cipher = SimpleCipher->new; # begin: 3dff7f36-75db-46b4-ab70-644b3f38b81c
is(
    $cipher->decode( substr( $cipher->key, 0, 10 ) ),
    "aaaaaaaaaa",
    "Random key cipher: Can decode",
); # end: 3dff7f36-75db-46b4-ab70-644b3f38b81c

$cipher = SimpleCipher->new; # begin: 8143c684-6df6-46ba-bd1f-dea8fcb5d265
is(
    $cipher->decode( $cipher->encode("abcdefghij") ),
    "abcdefghij",
    "Random key cipher: Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method",
); # end: 8143c684-6df6-46ba-bd1f-dea8fcb5d265

$cipher = SimpleCipher->new; # begin: defc0050-e87d-4840-85e4-51a1ab9dd6aa
like(
    $cipher->key,
    qr/^[a-z]+$/,
    "Random key cipher: Key is made only of lowercase letters",
); # end: defc0050-e87d-4840-85e4-51a1ab9dd6aa

$cipher = SimpleCipher->new( key => "abcdefghij" ); # begin: 565e5158-5b3b-41dd-b99d-33b9f413c39f
is(
    $cipher->encode("aaaaaaaaaa"),
    "abcdefghij",
    "Substitution cipher: Can encode",
); # end: 565e5158-5b3b-41dd-b99d-33b9f413c39f

$cipher = SimpleCipher->new( key => "abcdefghij" ); # begin: d44e4f6a-b8af-4e90-9d08-fd407e31e67b
is(
    $cipher->decode("abcdefghij"),
    "aaaaaaaaaa",
    "Substitution cipher: Can decode",
); # end: d44e4f6a-b8af-4e90-9d08-fd407e31e67b

$cipher = SimpleCipher->new( key => "abcdefghij" ); # begin: 70a16473-7339-43df-902d-93408c69e9d1
is(
    $cipher->decode( $cipher->encode("abcdefghij") ),
    "abcdefghij",
    "Substitution cipher: Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method",
); # end: 70a16473-7339-43df-902d-93408c69e9d1

$cipher = SimpleCipher->new( key => "iamapandabear" ); # begin: 69a1458b-92a6-433a-a02d-7beac3ea91f9
is(
    $cipher->encode("iamapandabear"),
    "qayaeaagaciai",
    "Substitution cipher: Can double shift encode",
); # end: 69a1458b-92a6-433a-a02d-7beac3ea91f9

$cipher = SimpleCipher->new( key => "abcdefghij" ); # begin: 21d207c1-98de-40aa-994f-86197ae230fb
is(
    $cipher->encode("zzzzzzzzzz"),
    "zabcdefghi",
    "Substitution cipher: Can wrap on encode",
); # end: 21d207c1-98de-40aa-994f-86197ae230fb

$cipher = SimpleCipher->new( key => "abcdefghij" ); # begin: a3d7a4d7-24a9-4de6-bdc4-a6614ced0cb3
is(
    $cipher->decode("zabcdefghi"),
    "zzzzzzzzzz",
    "Substitution cipher: Can wrap on decode",
); # end: a3d7a4d7-24a9-4de6-bdc4-a6614ced0cb3

$cipher = SimpleCipher->new( key => "abc" ); # begin: e31c9b8c-8eb6-45c9-a4b5-8344a36b9641
is(
    $cipher->encode("iamapandabear"),
    "iboaqcnecbfcr",
    "Substitution cipher: Can encode messages longer than the key",
); # end: e31c9b8c-8eb6-45c9-a4b5-8344a36b9641

$cipher = SimpleCipher->new( key => "abc" ); # begin: 93cfaae0-17da-4627-9a04-d6d1e1be52e3
is(
    $cipher->decode("iboaqcnecbfcr"),
    "iamapandabear",
    "Substitution cipher: Can decode messages longer than the key",
); # end: 93cfaae0-17da-4627-9a04-d6d1e1be52e3

done_testing;
