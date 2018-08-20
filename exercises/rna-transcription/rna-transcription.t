#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 7;
use JSON::PP;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use RNA qw(to_rna);

can_ok 'RNA', 'import' or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
foreach my $case (@{$C_DATA->{cases}}) {
  is to_rna($case->{input}{dna}), $case->{expected}, $case->{description};
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
