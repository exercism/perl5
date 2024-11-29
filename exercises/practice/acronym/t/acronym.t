#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Acronym qw<abbreviate>;

is( # begin: 1e22cceb-c5e4-4562-9afe-aef07ad1eaf4
    abbreviate("Portable Network Graphics"),
    "PNG",
    "basic",
); # end: 1e22cceb-c5e4-4562-9afe-aef07ad1eaf4

is( # begin: 79ae3889-a5c0-4b01-baf0-232d31180c08
    abbreviate("Ruby on Rails"),
    "ROR",
    "lowercase words",
); # end: 79ae3889-a5c0-4b01-baf0-232d31180c08

is( # begin: ec7000a7-3931-4a17-890e-33ca2073a548
    abbreviate("First In, First Out"),
    "FIFO",
    "punctuation",
); # end: ec7000a7-3931-4a17-890e-33ca2073a548

is( # begin: 32dd261c-0c92-469a-9c5c-b192e94a63b0
    abbreviate("GNU Image Manipulation Program"),
    "GIMP",
    "all caps word",
); # end: 32dd261c-0c92-469a-9c5c-b192e94a63b0

is( # begin: ae2ac9fa-a606-4d05-8244-3bcc4659c1d4
    abbreviate("Complementary metal-oxide semiconductor"),
    "CMOS",
    "punctuation without whitespace",
); # end: ae2ac9fa-a606-4d05-8244-3bcc4659c1d4

is( # begin: 0e4b1e7c-1a6d-48fb-81a7-bf65eb9e69f9
    abbreviate("Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"),
    "ROTFLSHTMDCOALM",
    "very long abbreviation",
); # end: 0e4b1e7c-1a6d-48fb-81a7-bf65eb9e69f9

is( # begin: 6a078f49-c68d-4b7b-89af-33a1a98c28cc
    abbreviate("Something - I made up from thin air"),
    "SIMUFTA",
    "consecutive delimiters",
); # end: 6a078f49-c68d-4b7b-89af-33a1a98c28cc

is( # begin: 5118b4b1-4572-434c-8d57-5b762e57973e
    abbreviate("Halley's Comet"),
    "HC",
    "apostrophes",
); # end: 5118b4b1-4572-434c-8d57-5b762e57973e

is( # begin: adc12eab-ec2d-414f-b48c-66a4fc06cdef
    abbreviate("The Road _Not_ Taken"),
    "TRNT",
    "underscore emphasis",
); # end: adc12eab-ec2d-414f-b48c-66a4fc06cdef

done_testing;
