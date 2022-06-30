#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use NucleotideCount qw<count_nucleotides>;
plan 6;

imported_ok qw<count_nucleotides> or bail_out;

is( count_nucleotides(""), { A => 0, C => 0, G => 0, T => 0 },
    "empty strand", );

is( count_nucleotides("G"),
    { A => 0, C => 0, G => 1, T => 0 },
    "can count one nucleotide in single-character input",
);

is( count_nucleotides("GGGGGGG"),
    { A => 0, C => 0, G => 7, T => 0 },
    "strand with repeated nucleotide",
);

is( count_nucleotides(
        "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
    ),
    { A => 20, C => 12, G => 17, T => 21 },
    "strand with multiple nucleotides",
);

like(
    dies( sub { count_nucleotides "AGXXACT" } ),
    qr/Invalid nucleotide in strand/,
    "strand with invalid nucleotides",
);

