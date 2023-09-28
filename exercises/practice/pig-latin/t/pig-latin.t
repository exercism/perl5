#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use PigLatin qw<translate>;

is( # begin: 11567f84-e8c6-4918-aedb-435f0b73db57
    translate("apple"),
    "appleay",
    "ay is added to words that start with vowels: word beginning with a",
); # end: 11567f84-e8c6-4918-aedb-435f0b73db57

is( # begin: f623f581-bc59-4f45-9032-90c3ca9d2d90
    translate("ear"),
    "earay",
    "ay is added to words that start with vowels: word beginning with e",
); # end: f623f581-bc59-4f45-9032-90c3ca9d2d90

is( # begin: 7dcb08b3-23a6-4e8a-b9aa-d4e859450d58
    translate("igloo"),
    "iglooay",
    "ay is added to words that start with vowels: word beginning with i",
); # end: 7dcb08b3-23a6-4e8a-b9aa-d4e859450d58

is( # begin: 0e5c3bff-266d-41c8-909f-364e4d16e09c
    translate("object"),
    "objectay",
    "ay is added to words that start with vowels: word beginning with o",
); # end: 0e5c3bff-266d-41c8-909f-364e4d16e09c

is( # begin: 614ba363-ca3c-4e96-ab09-c7320799723c
    translate("under"),
    "underay",
    "ay is added to words that start with vowels: word beginning with u",
); # end: 614ba363-ca3c-4e96-ab09-c7320799723c

is( # begin: bf2538c6-69eb-4fa7-a494-5a3fec911326
    translate("equal"),
    "equalay",
    "ay is added to words that start with vowels: word beginning with a vowel and followed by a qu",
); # end: bf2538c6-69eb-4fa7-a494-5a3fec911326

is( # begin: e5be8a01-2d8a-45eb-abb4-3fcc9582a303
    translate("pig"),
    "igpay",
    "first letter and ay are moved to the end of words that start with consonants: word beginning with p",
); # end: e5be8a01-2d8a-45eb-abb4-3fcc9582a303

is( # begin: d36d1e13-a7ed-464d-a282-8820cb2261ce
    translate("koala"),
    "oalakay",
    "first letter and ay are moved to the end of words that start with consonants: word beginning with k",
); # end: d36d1e13-a7ed-464d-a282-8820cb2261ce

is( # begin: d838b56f-0a89-4c90-b326-f16ff4e1dddc
    translate("xenon"),
    "enonxay",
    "first letter and ay are moved to the end of words that start with consonants: word beginning with x",
); # end: d838b56f-0a89-4c90-b326-f16ff4e1dddc

is( # begin: bce94a7a-a94e-4e2b-80f4-b2bb02e40f71
    translate("qat"),
    "atqay",
    "first letter and ay are moved to the end of words that start with consonants: word beginning with q without a following u",
); # end: bce94a7a-a94e-4e2b-80f4-b2bb02e40f71

is( # begin: c01e049a-e3e2-451c-bf8e-e2abb7e438b8
    translate("chair"),
    "airchay",
    "some letter clusters are treated like a single consonant: word beginning with ch",
); # end: c01e049a-e3e2-451c-bf8e-e2abb7e438b8

is( # begin: 9ba1669e-c43f-4b93-837a-cfc731fd1425
    translate("queen"),
    "eenquay",
    "some letter clusters are treated like a single consonant: word beginning with qu",
); # end: 9ba1669e-c43f-4b93-837a-cfc731fd1425

is( # begin: 92e82277-d5e4-43d7-8dd3-3a3b316c41f7
    translate("square"),
    "aresquay",
    "some letter clusters are treated like a single consonant: word beginning with qu and a preceding consonant",
); # end: 92e82277-d5e4-43d7-8dd3-3a3b316c41f7

is( # begin: 79ae4248-3499-4d5b-af46-5cb05fa073ac
    translate("therapy"),
    "erapythay",
    "some letter clusters are treated like a single consonant: word beginning with th",
); # end: 79ae4248-3499-4d5b-af46-5cb05fa073ac

is( # begin: e0b3ae65-f508-4de3-8999-19c2f8e243e1
    translate("thrush"),
    "ushthray",
    "some letter clusters are treated like a single consonant: word beginning with thr",
); # end: e0b3ae65-f508-4de3-8999-19c2f8e243e1

is( # begin: 20bc19f9-5a35-4341-9d69-1627d6ee6b43
    translate("school"),
    "oolschay",
    "some letter clusters are treated like a single consonant: word beginning with sch",
); # end: 20bc19f9-5a35-4341-9d69-1627d6ee6b43

is( # begin: 54b796cb-613d-4509-8c82-8fbf8fc0af9e
    translate("yttria"),
    "yttriaay",
    "some letter clusters are treated like a single vowel: word beginning with yt",
); # end: 54b796cb-613d-4509-8c82-8fbf8fc0af9e

is( # begin: 8c37c5e1-872e-4630-ba6e-d20a959b67f6
    translate("xray"),
    "xrayay",
    "some letter clusters are treated like a single vowel: word beginning with xr",
); # end: 8c37c5e1-872e-4630-ba6e-d20a959b67f6

is( # begin: a4a36d33-96f3-422c-a233-d4021460ff00
    translate("yellow"),
    "ellowyay",
    "position of y in a word determines if it is a consonant or a vowel: y is treated like a consonant at the beginning of a word",
); # end: a4a36d33-96f3-422c-a233-d4021460ff00

is( # begin: adc90017-1a12-4100-b595-e346105042c7
    translate("rhythm"),
    "ythmrhay",
    "position of y in a word determines if it is a consonant or a vowel: y is treated like a vowel at the end of a consonant cluster",
); # end: adc90017-1a12-4100-b595-e346105042c7

is( # begin: 29b4ca3d-efe5-4a95-9a54-8467f2e5e59a
    translate("my"),
    "ymay",
    "position of y in a word determines if it is a consonant or a vowel: y as second letter in two letter word",
); # end: 29b4ca3d-efe5-4a95-9a54-8467f2e5e59a

is( # begin: 44616581-5ce3-4a81-82d0-40c7ab13d2cf
    translate("quick fast run"),
    "ickquay astfay unray",
    "phrases are translated: a whole phrase",
); # end: 44616581-5ce3-4a81-82d0-40c7ab13d2cf

done_testing;
