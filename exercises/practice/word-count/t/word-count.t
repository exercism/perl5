#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use WordCount qw<count_words>;

is( # begin: 61559d5f-2cad-48fb-af53-d3973a9ee9ef
    count_words("word"),
    { word => 1 },
    "count one word",
); # end: 61559d5f-2cad-48fb-af53-d3973a9ee9ef

is( # begin: 5abd53a3-1aed-43a4-a15a-29f88c09cbbd
    count_words("one of each"),
    { each => 1, of => 1, one => 1 },
    "count one of each word",
); # end: 5abd53a3-1aed-43a4-a15a-29f88c09cbbd

is( # begin: 2a3091e5-952e-4099-9fac-8f85d9655c0e
    count_words("one fish two fish red fish blue fish"),
    { blue => 1, fish => 4, one => 1, red => 1, two => 1 },
    "multiple occurrences of a word",
); # end: 2a3091e5-952e-4099-9fac-8f85d9655c0e

is( # begin: e81877ae-d4da-4af4-931c-d923cd621ca6
    count_words("one,two,three"),
    { one => 1, three => 1, two => 1 },
    "handles cramped lists",
); # end: e81877ae-d4da-4af4-931c-d923cd621ca6

is( # begin: 7349f682-9707-47c0-a9af-be56e1e7ff30
    count_words("one,\ntwo,\nthree"),
    { one => 1, three => 1, two => 1 },
    "handles expanded lists",
); # end: 7349f682-9707-47c0-a9af-be56e1e7ff30

is( # begin: a514a0f2-8589-4279-8892-887f76a14c82
    count_words("car: carpet as java: javascript!!&\@\$%^&"),
    { as => 1, car => 1, carpet => 1, java => 1, javascript => 1 },
    "ignore punctuation",
); # end: a514a0f2-8589-4279-8892-887f76a14c82

is( # begin: d2e5cee6-d2ec-497b-bdc9-3ebe092ce55e
    count_words("testing, 1, 2 testing"),
    { 1 => 1, 2 => 1, testing => 2 },
    "include numbers",
); # end: d2e5cee6-d2ec-497b-bdc9-3ebe092ce55e

is( # begin: dac6bc6a-21ae-4954-945d-d7f716392dbf
    count_words("go Go GO Stop stop"),
    { go => 3, stop => 2 },
    "normalize case",
); # end: dac6bc6a-21ae-4954-945d-d7f716392dbf

is( # begin: 4ff6c7d7-fcfc-43ef-b8e7-34ff1837a2d3
    count_words("'First: don't laugh. Then: don't cry. You're getting it.'"),
    { cry => 1, "don't" => 2, first => 1, getting => 1, it => 1, laugh => 1, then => 1, "you're" => 1 },
    "with apostrophes",
); # end: 4ff6c7d7-fcfc-43ef-b8e7-34ff1837a2d3

is( # begin: be72af2b-8afe-4337-b151-b297202e4a7b
    count_words("Joe can't tell between 'large' and large."),
    { and => 1, between => 1, "can't" => 1, joe => 1, large => 2, tell => 1 },
    "with quotations",
); # end: be72af2b-8afe-4337-b151-b297202e4a7b

is( # begin: 8d6815fe-8a51-4a65-96f9-2fb3f6dc6ed6
    count_words("Joe can't tell between app, apple and a."),
    { a => 1, and => 1, app => 1, apple => 1, between => 1, "can't" => 1, joe => 1, tell => 1 },
    "substrings from the beginning",
); # end: 8d6815fe-8a51-4a65-96f9-2fb3f6dc6ed6

is( # begin: c5f4ef26-f3f7-4725-b314-855c04fb4c13
    count_words(" multiple   whitespaces"),
    { multiple => 1, whitespaces => 1 },
    "multiple spaces not detected as a word",
); # end: c5f4ef26-f3f7-4725-b314-855c04fb4c13

is( # begin: 50176e8a-fe8e-4f4c-b6b6-aa9cf8f20360
    count_words(",\n,one,\n ,two \n 'three'"),
    { one => 1, three => 1, two => 1 },
    "alternating word separators not detected as a word",
); # end: 50176e8a-fe8e-4f4c-b6b6-aa9cf8f20360

is( # begin: 6d00f1db-901c-4bec-9829-d20eb3044557
    count_words("can, can't, 'can't'"),
    { can => 1, "can't" => 2 },
    "quotation for word with apostrophe",
); # end: 6d00f1db-901c-4bec-9829-d20eb3044557

done_testing;
