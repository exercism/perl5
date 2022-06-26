#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use KindergartenGarden qw<plants>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<plants> or bail_out;

for my $case (@test_cases) {
    is( plants( $case->{input} ), $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "partial garden: garden with single student",
    "expected": [
      "radishes",
      "clover",
      "grass",
      "grass"
    ],
    "input": {
      "diagram": "RC\nGG",
      "student": "Alice"
    },
    "property": "plants"
  },
  {
    "description": "partial garden: different garden with single student",
    "expected": [
      "violets",
      "clover",
      "radishes",
      "clover"
    ],
    "input": {
      "diagram": "VC\nRC",
      "student": "Alice"
    },
    "property": "plants"
  },
  {
    "description": "partial garden: garden with two students",
    "expected": [
      "clover",
      "grass",
      "radishes",
      "clover"
    ],
    "input": {
      "diagram": "VVCG\nVVRC",
      "student": "Bob"
    },
    "property": "plants"
  },
  {
    "description": "partial garden: multiple students for the same garden with three students: second student's garden",
    "expected": [
      "clover",
      "clover",
      "clover",
      "clover"
    ],
    "input": {
      "diagram": "VVCCGG\nVVCCGG",
      "student": "Bob"
    },
    "property": "plants"
  },
  {
    "description": "partial garden: multiple students for the same garden with three students: third student's garden",
    "expected": [
      "grass",
      "grass",
      "grass",
      "grass"
    ],
    "input": {
      "diagram": "VVCCGG\nVVCCGG",
      "student": "Charlie"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for Alice, first student's garden",
    "expected": [
      "violets",
      "radishes",
      "violets",
      "radishes"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "Alice"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for Bob, second student's garden",
    "expected": [
      "clover",
      "grass",
      "clover",
      "clover"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "Bob"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for Charlie",
    "expected": [
      "violets",
      "violets",
      "clover",
      "grass"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "Charlie"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for David",
    "expected": [
      "radishes",
      "violets",
      "clover",
      "radishes"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "David"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for Eve",
    "expected": [
      "clover",
      "grass",
      "radishes",
      "grass"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "Eve"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for Fred",
    "expected": [
      "grass",
      "clover",
      "violets",
      "clover"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "Fred"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for Ginny",
    "expected": [
      "clover",
      "grass",
      "grass",
      "clover"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "Ginny"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for Harriet",
    "expected": [
      "violets",
      "radishes",
      "radishes",
      "violets"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "Harriet"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for Ileana",
    "expected": [
      "grass",
      "clover",
      "violets",
      "clover"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "Ileana"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for Joseph",
    "expected": [
      "violets",
      "clover",
      "violets",
      "grass"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "Joseph"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for Kincaid, second to last student's garden",
    "expected": [
      "grass",
      "clover",
      "clover",
      "grass"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "Kincaid"
    },
    "property": "plants"
  },
  {
    "description": "full garden: for Larry, last student's garden",
    "expected": [
      "grass",
      "violets",
      "clover",
      "violets"
    ],
    "input": {
      "diagram": "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV",
      "student": "Larry"
    },
    "property": "plants"
  }
]
