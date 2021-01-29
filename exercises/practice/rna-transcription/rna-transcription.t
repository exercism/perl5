#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use RNA qw(to_rna);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 7;

imported_ok qw(to_rna) or bail_out;

for my $case ( @{ $C_DATA->{cases} } ) {
  is to_rna( $case->{input}{dna} ), $case->{expected},
    $case->{description};
}

__DATA__
{
  "exercise": "rna-transcription",
  "version": "1.3.0",
  "cases": [
    {
      "description": "Empty RNA sequence",
      "property": "toRna",
      "input": {
        "dna": ""
      },
      "expected": ""
    },
    {
      "description": "RNA complement of cytosine is guanine",
      "property": "toRna",
      "input": {
        "dna": "C"
      },
      "expected": "G"
    },
    {
      "description": "RNA complement of guanine is cytosine",
      "property": "toRna",
      "input": {
        "dna": "G"
      },
      "expected": "C"
    },
    {
      "description": "RNA complement of thymine is adenine",
      "property": "toRna",
      "input": {
        "dna": "T"
      },
      "expected": "A"
    },
    {
      "description": "RNA complement of adenine is uracil",
      "property": "toRna",
      "input": {
        "dna": "A"
      },
      "expected": "U"
    },
    {
      "description": "RNA complement",
      "property": "toRna",
      "input": {
        "dna": "ACGTGGTCTTAA"
      },
      "expected": "UGCACCAGAAUU"
    }
  ]
}
