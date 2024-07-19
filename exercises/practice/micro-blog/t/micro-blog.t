#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use MicroBlog qw<truncate_post>;

is( # begin: b927b57f-7c98-42fd-8f33-fae091dc1efc
    truncate_post("Hi"),
    'Hi',
    'English language short',
); # end: b927b57f-7c98-42fd-8f33-fae091dc1efc

is( # begin: a3fcdc5b-0ed4-4f49-80f5-b1a293eac2a0
    truncate_post("Hello there"),
    'Hello',
    'English language long',
); # end: a3fcdc5b-0ed4-4f49-80f5-b1a293eac2a0

is( # begin: 01910864-8e15-4007-9c7c-ac956c686e60
    truncate_post("br\xC3\xBChe"),
    'brühe',
    'German language short (broth)',
); # end: 01910864-8e15-4007-9c7c-ac956c686e60

is( # begin: f263e488-aefb-478f-a671-b6ba99722543
    truncate_post("B\xC3\xA4rteppich"),
    'Bärte',
    'German language long (bear carpet → beards)',
); # end: f263e488-aefb-478f-a671-b6ba99722543

is( # begin: 0916e8f1-41d7-4402-a110-b08aa000342c
    truncate_post("\xD0\x94\xD0\xBE\xD0\xB1\xD1\x8A\xD1\x80"),
    'Добър',
    'Bulgarian language short (good)',
); # end: 0916e8f1-41d7-4402-a110-b08aa000342c

is( # begin: bed6b89c-03df-4154-98e6-a61a74f61b7d
    truncate_post("\xCF\x85\xCE\xB3\xCE\xB5\xCE\xB9\xCE\xAC"),
    'υγειά',
    'Greek language short (health)',
); # end: bed6b89c-03df-4154-98e6-a61a74f61b7d

is( # begin: 485a6a70-2edb-424d-b999-5529dbc8e002
    truncate_post("a=\xCF\x80r\xC2\xB2"),
    'a=πr²',
    'Maths short',
); # end: 485a6a70-2edb-424d-b999-5529dbc8e002

is( # begin: 8b4b7b51-8f48-4fbe-964e-6e4e6438be28
    truncate_post("\xE2\x88\x85\xE2\x8A\x8A\xE2\x84\x95\xE2\x8A\x8A\xE2\x84\xA4\xE2\x8A\x8A\xE2\x84\x9A\xE2\x8A\x8A\xE2\x84\x9D\xE2\x8A\x8A\xE2\x84\x82"),
    '∅⊊ℕ⊊ℤ',
    'Maths long',
); # end: 8b4b7b51-8f48-4fbe-964e-6e4e6438be28

is( # begin: 71f4a192-0566-4402-a512-fe12878be523
    truncate_post("Fly \xF0\x9F\x9B\xAB"),
    'Fly 🛫',
    'English and emoji short',
); # end: 71f4a192-0566-4402-a512-fe12878be523

is( # begin: 6f0f71f3-9806-4759-a844-fa182f7bc203
    truncate_post("\xF0\x9F\x92\x87"),
    '💇',
    'Emoji short',
); # end: 6f0f71f3-9806-4759-a844-fa182f7bc203

is( # begin: ce71fb92-5214-46d0-a7f8-d5ba56b4cc6e
    truncate_post("\xE2\x9D\x84\xF0\x9F\x8C\xA1\xF0\x9F\xA4\xA7\xF0\x9F\xA4\x92\xF0\x9F\x8F\xA5\xF0\x9F\x95\xB0\xF0\x9F\x98\x80"),
    '❄🌡🤧🤒🏥',
    'Emoji long',
); # end: ce71fb92-5214-46d0-a7f8-d5ba56b4cc6e

is( # begin: 5dee98d2-d56e-468a-a1f2-121c3f7c5a0b
    truncate_post("\xF0\x9F\x83\x8E\xF0\x9F\x82\xB8\xF0\x9F\x83\x85\xF0\x9F\x83\x8B\xF0\x9F\x83\x8D\xF0\x9F\x83\x81\xF0\x9F\x83\x8A"),
    '🃎🂸🃅🃋🃍',
    'Royal Flush?',
); # end: 5dee98d2-d56e-468a-a1f2-121c3f7c5a0b

done_testing;
