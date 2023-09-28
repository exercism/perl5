#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Hamming qw<hamming_distance>;

is( # begin: f6dcb64f-03b0-4b60-81b1-3c9dbf47e887
    hamming_distance( "", "" ),
    0,
    "empty strands",
); # end: f6dcb64f-03b0-4b60-81b1-3c9dbf47e887

is( # begin: 54681314-eee2-439a-9db0-b0636c656156
    hamming_distance( "A", "A" ),
    0,
    "single letter identical strands",
); # end: 54681314-eee2-439a-9db0-b0636c656156

is( # begin: 294479a3-a4c8-478f-8d63-6209815a827b
    hamming_distance( "G", "T" ),
    1,
    "single letter different strands",
); # end: 294479a3-a4c8-478f-8d63-6209815a827b

is( # begin: 9aed5f34-5693-4344-9b31-40c692fb5592
    hamming_distance( "GGACTGAAATCTG", "GGACTGAAATCTG" ),
    0,
    "long identical strands",
); # end: 9aed5f34-5693-4344-9b31-40c692fb5592

is( # begin: cd2273a5-c576-46c8-a52b-dee251c3e6e5
    hamming_distance( "GGACGGATTCTG", "AGGACGGATTCT" ),
    9,
    "long different strands",
); # end: cd2273a5-c576-46c8-a52b-dee251c3e6e5

like( # begin: b9228bb1-465f-4141-b40f-1f99812de5a8
    dies( sub { hamming_distance( "AATG", "AAA" ) } ),
    qr/strands must be of equal length/,
    "disallow first strand longer",
); # end: b9228bb1-465f-4141-b40f-1f99812de5a8

like( # begin: dab38838-26bb-4fff-acbe-3b0a9bfeba2d
    dies( sub { hamming_distance( "ATA", "AGTG" ) } ),
    qr/strands must be of equal length/,
    "disallow second strand longer",
); # end: dab38838-26bb-4fff-acbe-3b0a9bfeba2d

like( # begin: b764d47c-83ff-4de2-ab10-6cfe4b15c0f3
    dies( sub { hamming_distance( "", "G" ) } ),
    qr/strands must be of equal length/,
    "disallow empty first strand",
); # end: b764d47c-83ff-4de2-ab10-6cfe4b15c0f3

like( # begin: 9ab9262f-3521-4191-81f5-0ed184a5aa89
    dies( sub { hamming_distance( "G", "" ) } ),
    qr/strands must be of equal length/,
    "disallow empty second strand",
); # end: 9ab9262f-3521-4191-81f5-0ed184a5aa89

done_testing;
