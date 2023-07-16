#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use WordCount qw<count_words>;

imported_ok qw<count_words> or bail_out;

is(
    count_words("word"),
    { word => 1 },
    "count one word",
);

is(
    count_words("one of each"),
    { each => 1, of => 1, one => 1 },
    "count one of each word",
);

is(
    count_words("one fish two fish red fish blue fish"),
    { blue => 1, fish => 4, one => 1, red => 1, two => 1 },
    "multiple occurrences of a word",
);

is(
    count_words("one,two,three"),
    { one => 1, three => 1, two => 1 },
    "handles cramped lists",
);

is(
    count_words("one,\ntwo,\nthree"),
    { one => 1, three => 1, two => 1 },
    "handles expanded lists",
);

is(
    count_words("car: carpet as java: javascript!!&\@\$%^&"),
    { as => 1, car => 1, carpet => 1, java => 1, javascript => 1 },
    "ignore punctuation",
);

is(
    count_words("testing, 1, 2 testing"),
    { 1 => 1, 2 => 1, testing => 2 },
    "include numbers",
);

is(
    count_words("go Go GO Stop stop"),
    { go => 3, stop => 2 },
    "normalize case",
);

is(
    count_words("'First: don't laugh. Then: don't cry. You're getting it.'"),
    {   cry      => 1,
        "don't"  => 2,
        first    => 1,
        getting  => 1,
        it       => 1,
        laugh    => 1,
        then     => 1,
        "you're" => 1
    },
    "with apostrophes",
);

is(
    count_words("Joe can't tell between 'large' and large."),
    { and => 1, between => 1, "can't" => 1, joe => 1, large => 2, tell => 1 },
    "with quotations",
);

is(
    count_words("Joe can't tell between app, apple and a."),
    {   a       => 1,
        and     => 1,
        app     => 1,
        apple   => 1,
        between => 1,
        "can't" => 1,
        joe     => 1,
        tell    => 1
    },
    "substrings from the beginning",
);

is(
    count_words(" multiple   whitespaces"),
    { multiple => 1, whitespaces => 1 },
    "multiple spaces not detected as a word",
);

is(
    count_words(",\n,one,\n ,two \n 'three'"),
    { one => 1, three => 1, two => 1 },
    "alternating word separators not detected as a word",
);

is(
    count_words("can, can't, 'can't'"),
    { can => 1, "can't" => 2 },
    "quotation for word with apostrophe",
);

done_testing;
