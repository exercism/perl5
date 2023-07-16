#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PigLatin qw<translate>;

imported_ok qw<translate> or bail_out;

is(
    translate("apple"),
    "appleay",
    "ay is added to words that start with vowels: word beginning with a",
);

is(
    translate("ear"),
    "earay",
    "ay is added to words that start with vowels: word beginning with e",
);

is(
    translate("igloo"),
    "iglooay",
    "ay is added to words that start with vowels: word beginning with i",
);

is(
    translate("object"),
    "objectay",
    "ay is added to words that start with vowels: word beginning with o",
);

is(
    translate("under"),
    "underay",
    "ay is added to words that start with vowels: word beginning with u",
);

is(
    translate("equal"),
    "equalay",
    "ay is added to words that start with vowels: word beginning with a vowel and followed by a qu",
);

is(
    translate("pig"),
    "igpay",
    "first letter and ay are moved to the end of words that start with consonants: word beginning with p",
);

is(
    translate("koala"),
    "oalakay",
    "first letter and ay are moved to the end of words that start with consonants: word beginning with k",
);

is(
    translate("xenon"),
    "enonxay",
    "first letter and ay are moved to the end of words that start with consonants: word beginning with x",
);

is(
    translate("qat"),
    "atqay",
    "first letter and ay are moved to the end of words that start with consonants: word beginning with q without a following u",
);

is(
    translate("chair"),
    "airchay",
    "some letter clusters are treated like a single consonant: word beginning with ch",
);

is(
    translate("queen"),
    "eenquay",
    "some letter clusters are treated like a single consonant: word beginning with qu",
);

is(
    translate("square"),
    "aresquay",
    "some letter clusters are treated like a single consonant: word beginning with qu and a preceding consonant",
);

is(
    translate("therapy"),
    "erapythay",
    "some letter clusters are treated like a single consonant: word beginning with th",
);

is(
    translate("thrush"),
    "ushthray",
    "some letter clusters are treated like a single consonant: word beginning with thr",
);

is(
    translate("school"),
    "oolschay",
    "some letter clusters are treated like a single consonant: word beginning with sch",
);

is(
    translate("yttria"),
    "yttriaay",
    "some letter clusters are treated like a single vowel: word beginning with yt",
);

is(
    translate("xray"),
    "xrayay",
    "some letter clusters are treated like a single vowel: word beginning with xr",
);

is(
    translate("yellow"),
    "ellowyay",
    "position of y in a word determines if it is a consonant or a vowel: y is treated like a consonant at the beginning of a word",
);

is(
    translate("rhythm"),
    "ythmrhay",
    "position of y in a word determines if it is a consonant or a vowel: y is treated like a vowel at the end of a consonant cluster",
);

is(
    translate("my"),
    "ymay",
    "position of y in a word determines if it is a consonant or a vowel: y as second letter in two letter word",
);

is(
    translate("quick fast run"),
    "ickquay astfay unray",
    "phrases are translated: a whole phrase",
);

done_testing;
