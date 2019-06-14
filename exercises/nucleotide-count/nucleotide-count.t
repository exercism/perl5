#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use NucleotideCount qw(count_nucleotides);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 6;

imported_ok qw(count_nucleotides) or bail_out;

for my $case ( map { @{ $_->{cases} } } @{ $C_DATA->{cases} } ) {
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
{
  "exercise": "nucleotide-count",
  "version": "1.3.0",
  "cases": [
    {
      "description": "count all nucleotides in a strand",
      "cases": [
        {
          "description": "empty strand",
          "property": "nucleotideCounts",
          "input": {
            "strand": ""
          },
          "expected": {
            "A": 0,
            "C": 0,
            "G": 0,
            "T": 0
          }
        },
        {
          "description": "can count one nucleotide in single-character input",
          "property": "nucleotideCounts",
          "input": {
            "strand": "G"
          },
          "expected": {
            "A": 0,
            "C": 0,
            "G": 1,
            "T": 0
          }
        },
        {
          "description": "strand with repeated nucleotide",
          "property": "nucleotideCounts",
          "input": {
            "strand": "GGGGGGG"
          },
          "expected": {
            "A": 0,
            "C": 0,
            "G": 7,
            "T": 0
          }
        },
        {
          "description": "strand with multiple nucleotides",
          "property": "nucleotideCounts",
          "input": {
            "strand": "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
          },
          "expected": {
            "A": 20,
            "C": 12,
            "G": 17,
            "T": 21
          }
        },
        {
          "description": "strand with invalid nucleotides",
          "property": "nucleotideCounts",
          "input": {
            "strand": "AGXXACT"
          },
          "expected": {
            "error": "Invalid nucleotide in strand"
          }
        }
      ]
    }
  ]
}
