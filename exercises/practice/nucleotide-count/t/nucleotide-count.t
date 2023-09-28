#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use NucleotideCount qw<count_nucleotides>;

is( # begin: 3e5c30a8-87e2-4845-a815-a49671ade970
    count_nucleotides(""),
    { A => 0, C => 0, G => 0, T => 0 },
    "empty strand",
); # end: 3e5c30a8-87e2-4845-a815-a49671ade970

is( # begin: a0ea42a6-06d9-4ac6-828c-7ccaccf98fec
    count_nucleotides("G"),
    { A => 0, C => 0, G => 1, T => 0 },
    "can count one nucleotide in single-character input",
); # end: a0ea42a6-06d9-4ac6-828c-7ccaccf98fec

is( # begin: eca0d565-ed8c-43e7-9033-6cefbf5115b5
    count_nucleotides("GGGGGGG"),
    { A => 0, C => 0, G => 7, T => 0 },
    "strand with repeated nucleotide",
); # end: eca0d565-ed8c-43e7-9033-6cefbf5115b5

is( # begin: 40a45eac-c83f-4740-901a-20b22d15a39f
    count_nucleotides("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"),
    { A => 20, C => 12, G => 17, T => 21 },
    "strand with multiple nucleotides",
); # end: 40a45eac-c83f-4740-901a-20b22d15a39f

like( # begin: b4c47851-ee9e-4b0a-be70-a86e343bd851
    dies( sub { count_nucleotides "AGXXACT" } ),
    qr(Invalid nucleotide in strand),
    "strand with invalid nucleotides",
); # end: b4c47851-ee9e-4b0a-be70-a86e343bd851

done_testing;
