#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use NucleotideCount qw<count_nucleotides>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 6;

imported_ok qw<count_nucleotides> or bail_out;

for my $case (@test_cases) {
  if ( $case->{expected}{error} ) {
    like dies( sub { count_nucleotides( $case->{input}{strand} ) } ),
      qr/$case->{expected}{error}/, $case->{description};
  }
  else {
    is count_nucleotides( $case->{input}{strand} ),
      $case->{expected}, $case->{description};
  }
}

__DATA__
[
  {
    "description": "empty strand",
    "expected": {
      "A": 0,
      "C": 0,
      "G": 0,
      "T": 0
    },
    "input": {
      "strand": ""
    },
    "property": "nucleotideCounts"
  },
  {
    "description": "can count one nucleotide in single-character input",
    "expected": {
      "A": 0,
      "C": 0,
      "G": 1,
      "T": 0
    },
    "input": {
      "strand": "G"
    },
    "property": "nucleotideCounts"
  },
  {
    "description": "strand with repeated nucleotide",
    "expected": {
      "A": 0,
      "C": 0,
      "G": 7,
      "T": 0
    },
    "input": {
      "strand": "GGGGGGG"
    },
    "property": "nucleotideCounts"
  },
  {
    "description": "strand with multiple nucleotides",
    "expected": {
      "A": 20,
      "C": 12,
      "G": 17,
      "T": 21
    },
    "input": {
      "strand": "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
    },
    "property": "nucleotideCounts"
  },
  {
    "description": "strand with invalid nucleotides",
    "expected": {
      "error": "Invalid nucleotide in strand"
    },
    "input": {
      "strand": "AGXXACT"
    },
    "property": "nucleotideCounts"
  }
]
