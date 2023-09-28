#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use RNA qw<to_rna>;

is( # begin: b4631f82-c98c-4a2f-90b3-c5c2b6c6f661
    to_rna(""),
    "",
    "Empty RNA sequence",
); # end: b4631f82-c98c-4a2f-90b3-c5c2b6c6f661

is( # begin: a9558a3c-318c-4240-9256-5d5ed47005a6
    to_rna("C"),
    "G",
    "RNA complement of cytosine is guanine",
); # end: a9558a3c-318c-4240-9256-5d5ed47005a6

is( # begin: 6eedbb5c-12cb-4c8b-9f51-f8320b4dc2e7
    to_rna("G"),
    "C",
    "RNA complement of guanine is cytosine",
); # end: 6eedbb5c-12cb-4c8b-9f51-f8320b4dc2e7

is( # begin: 870bd3ec-8487-471d-8d9a-a25046488d3e
    to_rna("T"),
    "A",
    "RNA complement of thymine is adenine",
); # end: 870bd3ec-8487-471d-8d9a-a25046488d3e

is( # begin: aade8964-02e1-4073-872f-42d3ffd74c5f
    to_rna("A"),
    "U",
    "RNA complement of adenine is uracil",
); # end: aade8964-02e1-4073-872f-42d3ffd74c5f

is( # begin: 79ed2757-f018-4f47-a1d7-34a559392dbf
    to_rna("ACGTGGTCTTAA"),
    "UGCACCAGAAUU",
    "RNA complement",
); # end: 79ed2757-f018-4f47-a1d7-34a559392dbf

done_testing;
