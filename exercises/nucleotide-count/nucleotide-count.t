#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 6;
use JSON::PP;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use NucleotideCount qw(count_nucleotides);

can_ok 'NucleotideCount', 'import' or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
my @exception_cases;
foreach my $case (map {@{$_->{cases}}} @{$C_DATA->{cases}}) {
  if ($case->{expected}{error}) {
    push @exception_cases, $case;
  }
  else {
    is_deeply count_nucleotides($case->{input}{strand}), $case->{expected}, $case->{description};
  }
}

SKIP: {
  if ( eval { require Test2::Tools::Exception } ) {
    ok(
      Test2::Tools::Exception::dies( sub { count_nucleotides $_->{input}{strand} } ),
      $_->{description}
    ) foreach @exception_cases;
  }
  else {
    skip 'Test2::Tools::Exception not loaded', scalar @exception_cases;
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
