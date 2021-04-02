#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Hamming qw<hamming_distance>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 10;

imported_ok qw<hamming_distance> or bail_out;

for my $case (@test_cases) {
  if ( !ref $case->{expected} ) {
    is hamming_distance( @{ $case->{input} }{qw(strand1 strand2)} ),
      $case->{expected}, $case->{description};
  }
  else {
    like dies(
      sub {
        hamming_distance( @{ $case->{input} }{qw(strand1 strand2)} );
      }
      ),
      qr/left and right strands must be of equal length/,
      $case->{description};
  }
}

__DATA__
[
  {
    "description": "empty strands",
    "expected": 0,
    "input": {
      "strand1": "",
      "strand2": ""
    },
    "property": "distance"
  },
  {
    "description": "single letter identical strands",
    "expected": 0,
    "input": {
      "strand1": "A",
      "strand2": "A"
    },
    "property": "distance"
  },
  {
    "description": "single letter different strands",
    "expected": 1,
    "input": {
      "strand1": "G",
      "strand2": "T"
    },
    "property": "distance"
  },
  {
    "description": "long identical strands",
    "expected": 0,
    "input": {
      "strand1": "GGACTGAAATCTG",
      "strand2": "GGACTGAAATCTG"
    },
    "property": "distance"
  },
  {
    "description": "long different strands",
    "expected": 9,
    "input": {
      "strand1": "GGACGGATTCTG",
      "strand2": "AGGACGGATTCT"
    },
    "property": "distance"
  },
  {
    "description": "disallow first strand longer",
    "expected": {
      "error": "left and right strands must be of equal length"
    },
    "input": {
      "strand1": "AATG",
      "strand2": "AAA"
    },
    "property": "distance"
  },
  {
    "description": "disallow second strand longer",
    "expected": {
      "error": "left and right strands must be of equal length"
    },
    "input": {
      "strand1": "ATA",
      "strand2": "AGTG"
    },
    "property": "distance"
  },
  {
    "description": "disallow left empty strand",
    "expected": {
      "error": "left strand must not be empty"
    },
    "input": {
      "strand1": "",
      "strand2": "G"
    },
    "property": "distance"
  },
  {
    "description": "disallow right empty strand",
    "expected": {
      "error": "right strand must not be empty"
    },
    "input": {
      "strand1": "G",
      "strand2": ""
    },
    "property": "distance"
  }
]
