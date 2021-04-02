#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use RNA qw<to_rna>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 7;

imported_ok qw<to_rna> or bail_out;

for my $case (@test_cases) {
  is to_rna( $case->{input}{dna} ), $case->{expected},
    $case->{description};
}

__DATA__
[
  {
    "description": "Empty RNA sequence",
    "expected": "",
    "input": {
      "dna": ""
    },
    "property": "toRna"
  },
  {
    "description": "RNA complement of cytosine is guanine",
    "expected": "G",
    "input": {
      "dna": "C"
    },
    "property": "toRna"
  },
  {
    "description": "RNA complement of guanine is cytosine",
    "expected": "C",
    "input": {
      "dna": "G"
    },
    "property": "toRna"
  },
  {
    "description": "RNA complement of thymine is adenine",
    "expected": "A",
    "input": {
      "dna": "T"
    },
    "property": "toRna"
  },
  {
    "description": "RNA complement of adenine is uracil",
    "expected": "U",
    "input": {
      "dna": "A"
    },
    "property": "toRna"
  },
  {
    "description": "RNA complement",
    "expected": "UGCACCAGAAUU",
    "input": {
      "dna": "ACGTGGTCTTAA"
    },
    "property": "toRna"
  }
]
