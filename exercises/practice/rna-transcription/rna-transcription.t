#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use RNA qw<to_rna>;

is(
    to_rna(""),
    "",
    "Empty RNA sequence",
);

is(
    to_rna("C"),
    "G",
    "RNA complement of cytosine is guanine",
);

is(
    to_rna("G"),
    "C",
    "RNA complement of guanine is cytosine",
);

is(
    to_rna("T"),
    "A",
    "RNA complement of thymine is adenine",
);

is(
    to_rna("A"),
    "U",
    "RNA complement of adenine is uracil",
);

is(
    to_rna("ACGTGGTCTTAA"),
    "UGCACCAGAAUU",
    "RNA complement",
);

done_testing;
