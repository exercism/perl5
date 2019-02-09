#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 8;
use JSON::PP;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use Hamming qw(hamming_distance);

can_ok 'Hamming', 'import' or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
my @exception_cases;

foreach my $case (@{$C_DATA->{cases}}) {
  if (ref $case->{expected} eq 'HASH' && exists $case->{expected}{error}) {
    push @exception_cases, $case;
  }
  else {
    is hamming_distance(@{$case->{input}}{qw(strand1 strand2)}), $case->{expected}, $case->{description};
  }
}

SKIP: {
  if ( eval { require Test2::Tools::Exception } ) {
    ok(
      Test2::Tools::Exception::dies( sub { hamming_distance @{$_->{input}}{qw(strand1 strand2)} } ),
      $_->{description}
    ) foreach @exception_cases;
  }
  else {
    skip 'Test2::Tools::Exception not loaded', scalar @exception_cases;
  }
}

__DATA__
{
"exercise": "hamming",
"version": "2.2.0",
  "comments": [
    "Language implementations vary on the issue of unequal length strands.",
    "A language may elect to simplify this task by only presenting equal",
    "length test cases.  For languages handling unequal length strands as",
    "error condition, unequal length test cases are included here and are",
    "indicated with an error object.  Language idioms of errors or exceptions",
    "should be followed.  Alternative interpretations such as ignoring excess",
    "length at the end are not represented here."
  ],
  "cases": [
    {
      "description": "empty strands",
      "property": "distance",
      "input": {
        "strand1": "",
        "strand2": ""
      },
      "expected": 0
    },
    {
      "description": "single letter identical strands",
      "property": "distance",
      "input": {
        "strand1": "A",
        "strand2": "A"
      },
      "expected": 0
    },
    {
      "description": "single letter different strands",
      "property": "distance",
      "input": {
        "strand1": "G",
        "strand2": "T"
      },
      "expected": 1
    },
    {
      "description": "long identical strands",
      "property": "distance",
      "input": {
        "strand1": "GGACTGAAATCTG",
        "strand2": "GGACTGAAATCTG"
      },
      "expected": 0
    },
    {
      "description": "long different strands",
      "property": "distance",
      "input": {
        "strand1": "GGACGGATTCTG",
        "strand2": "AGGACGGATTCT"
      },
      "expected": 9
    },
    {
      "description": "disallow first strand longer",
      "property": "distance",
      "input": {
        "strand1": "AATG",
        "strand2": "AAA"
      },
      "expected": {"error": "left and right strands must be of equal length"}
    },
    {
      "description": "disallow second strand longer",
      "property": "distance",
      "input": {
        "strand1": "ATA",
        "strand2": "AGTG"
      },
      "expected": {"error": "left and right strands must be of equal length"}
    }
  ]
}
