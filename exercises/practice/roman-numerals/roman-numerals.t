#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use RomanNumerals qw<to_roman>;

imported_ok qw<to_roman> or bail_out;

is(
    to_roman(1),
    "I",
    "1 is I",
);

is(
    to_roman(2),
    "II",
    "2 is II",
);

is(
    to_roman(3),
    "III",
    "3 is III",
);

is(
    to_roman(4),
    "IV",
    "4 is IV",
);

is(
    to_roman(5),
    "V",
    "5 is V",
);

is(
    to_roman(6),
    "VI",
    "6 is VI",
);

is(
    to_roman(9),
    "IX",
    "9 is IX",
);

is(
    to_roman(16),
    "XVI",
    "16 is XVI",
);

is(
    to_roman(27),
    "XXVII",
    "27 is XXVII",
);

is(
    to_roman(48),
    "XLVIII",
    "48 is XLVIII",
);

is(
    to_roman(49),
    "XLIX",
    "49 is XLIX",
);

is(
    to_roman(59),
    "LIX",
    "59 is LIX",
);

is(
    to_roman(66),
    "LXVI",
    "66 is LXVI",
);

is(
    to_roman(93),
    "XCIII",
    "93 is XCIII",
);

is(
    to_roman(141),
    "CXLI",
    "141 is CXLI",
);

is(
    to_roman(163),
    "CLXIII",
    "163 is CLXIII",
);

is(
    to_roman(166),
    "CLXVI",
    "166 is CLXVI",
);

is(
    to_roman(402),
    "CDII",
    "402 is CDII",
);

is(
    to_roman(575),
    "DLXXV",
    "575 is DLXXV",
);

is(
    to_roman(666),
    "DCLXVI",
    "666 is DCLXVI",
);

is(
    to_roman(911),
    "CMXI",
    "911 is CMXI",
);

is(
    to_roman(1024),
    "MXXIV",
    "1024 is MXXIV",
);

is(
    to_roman(1666),
    "MDCLXVI",
    "1666 is MDCLXVI",
);

is(
    to_roman(3000),
    "MMM",
    "3000 is MMM",
);

is(
    to_roman(3001),
    "MMMI",
    "3001 is MMMI",
);

is(
    to_roman(3999),
    "MMMCMXCIX",
    "3999 is MMMCMXCIX",
);

done_testing;
