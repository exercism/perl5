#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Hamming qw<hamming_distance>;

imported_ok qw<hamming_distance> or bail_out;

is(
    hamming_distance( "", "" ),
    0,
    "empty strands",
);

is(
    hamming_distance( "A", "A" ),
    0,
    "single letter identical strands",
);

is(
    hamming_distance( "G", "T" ),
    1,
    "single letter different strands",
);

is(
    hamming_distance( "GGACTGAAATCTG", "GGACTGAAATCTG" ),
    0,
    "long identical strands",
);

is(
    hamming_distance( "GGACGGATTCTG", "AGGACGGATTCT" ),
    9,
    "long different strands",
);

like(
    dies( sub { hamming_distance( "AATG", "AAA" ) } ),
    qr/strands must be of equal length/,
    "disallow first strand longer",
);

like(
    dies( sub { hamming_distance( "ATA", "AGTG" ) } ),
    qr/strands must be of equal length/,
    "disallow second strand longer",
);

like(
    dies( sub { hamming_distance( "", "G" ) } ),
    qr/strands must be of equal length/,
    "disallow empty first strand",
);

like(
    dies( sub { hamming_distance( "G", "" ) } ),
    qr/strands must be of equal length/,
    "disallow empty second strand",
);

done_testing;
