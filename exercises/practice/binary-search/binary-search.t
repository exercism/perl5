#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use BinarySearch qw(binary_search);

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 12;

imported_ok qw<binary_search> or bail_out;

for my $case (@test_cases) {
  if ( !ref $case->{expected} ) {
    is binary_search( $case->{input} ), number( $case->{expected} ),
      $case->{description};
  }
  else {
    like dies( sub { binary_search( $case->{input} ) } ),
      qr/$case->{expected}{error}/,
      $case->{description};
  }
}

__DATA__
[
   {
      "description": "finds a value in an array with one element",
      "expected": 0,
      "input": {
         "array": [
            6
         ],
         "value": 6
      },
      "property": "find"
   },
   {
      "description": "finds a value in the middle of an array",
      "expected": 3,
      "input": {
         "array": [
            1,
            3,
            4,
            6,
            8,
            9,
            11
         ],
         "value": 6
      },
      "property": "find"
   },
   {
      "description": "finds a value at the beginning of an array",
      "expected": 0,
      "input": {
         "array": [
            1,
            3,
            4,
            6,
            8,
            9,
            11
         ],
         "value": 1
      },
      "property": "find"
   },
   {
      "description": "finds a value at the end of an array",
      "expected": 6,
      "input": {
         "array": [
            1,
            3,
            4,
            6,
            8,
            9,
            11
         ],
         "value": 11
      },
      "property": "find"
   },
   {
      "description": "finds a value in an array of odd length",
      "expected": 9,
      "input": {
         "array": [
            1,
            3,
            5,
            8,
            13,
            21,
            34,
            55,
            89,
            144,
            233,
            377,
            634
         ],
         "value": 144
      },
      "property": "find"
   },
   {
      "description": "finds a value in an array of even length",
      "expected": 5,
      "input": {
         "array": [
            1,
            3,
            5,
            8,
            13,
            21,
            34,
            55,
            89,
            144,
            233,
            377
         ],
         "value": 21
      },
      "property": "find"
   },
   {
      "description": "identifies that a value is not included in the array",
      "expected": {
         "error": "value not in array"
      },
      "input": {
         "array": [
            1,
            3,
            4,
            6,
            8,
            9,
            11
         ],
         "value": 7
      },
      "property": "find"
   },
   {
      "description": "a value smaller than the array's smallest value is not found",
      "expected": {
         "error": "value not in array"
      },
      "input": {
         "array": [
            1,
            3,
            4,
            6,
            8,
            9,
            11
         ],
         "value": 0
      },
      "property": "find"
   },
   {
      "description": "a value larger than the array's largest value is not found",
      "expected": {
         "error": "value not in array"
      },
      "input": {
         "array": [
            1,
            3,
            4,
            6,
            8,
            9,
            11
         ],
         "value": 13
      },
      "property": "find"
   },
   {
      "description": "nothing is found in an empty array",
      "expected": {
         "error": "value not in array"
      },
      "input": {
         "array": [],
         "value": 1
      },
      "property": "find"
   },
   {
      "description": "nothing is found when the left and right bounds cross",
      "expected": {
         "error": "value not in array"
      },
      "input": {
         "array": [
            1,
            2
         ],
         "value": 0
      },
      "property": "find"
   }
]

