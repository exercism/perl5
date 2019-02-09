#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 12;
use JSON::PP;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use BinarySearch qw(binary_search);

can_ok 'BinarySearch', 'import' or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
my @exception_cases;

foreach my $case (@{$C_DATA->{cases}}) {
  if (ref $case->{expected} eq 'HASH' && exists $case->{expected}{error}) {
    push @exception_cases, $case;
  }
  else {
    cmp_ok binary_search($case->{input}), '==', $case->{expected}, $case->{description};
  }
}

SKIP: {
  if ( eval { require Test2::Tools::Exception } ) {
    ok(
      Test2::Tools::Exception::dies( sub { binary_search $_->{input} } ),
      $_->{description}
    ) foreach @exception_cases;
  }
  else {
    skip 'Test2::Tools::Exception not loaded', scalar @exception_cases;
  }
}

__DATA__
{
  "exercise": "binary-search",
  "version": "1.3.0",
  "comments": [
    "The error object is used to indicate that the value is not included in the array.",
    "It should be replaced with the respective expression that is idiomatic",
    "for the language that implements the tests.",

    "Following https://github.com/exercism/problem-specifications/issues/234 the exercise",
    "should NOT include checking whether the array is sorted as it defeats",
    "the point of the binary search.",

    "The exercise should utilize an array-like (i.e. constant-time indexed)",
    "data structure and not a linked list. If something like an array is not",
    "usually used in the language the problem should not be implemented.",
    "See https://github.com/exercism/problem-specifications/issues/244 for details."
  ],
  "cases": [
    {
      "description": "finds a value in an array with one element",
      "property": "find",
      "input": {
        "array": [6],
        "value": 6
      },
      "expected": 0
    },
    {
      "description": "finds a value in the middle of an array",
      "property": "find",
      "input": {
        "array": [1, 3, 4, 6, 8, 9, 11],
        "value": 6
      },
      "expected": 3
    },
    {
      "description": "finds a value at the beginning of an array",
      "property": "find",
      "input": {
        "array": [1, 3, 4, 6, 8, 9, 11],
        "value": 1
      },
      "expected": 0
    },
    {
      "description": "finds a value at the end of an array",
      "property": "find",
      "input": {
        "array": [1, 3, 4, 6, 8, 9, 11],
        "value": 11
      },
      "expected": 6
    },
    {
      "description": "finds a value in an array of odd length",
      "property": "find",
      "input": {
        "array": [1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634],
        "value": 144
      },
      "expected": 9
    },
    {
      "description": "finds a value in an array of even length",
      "property": "find",
      "input": {
        "array": [1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377],
        "value": 21
      },
      "expected": 5
    },
    {
      "description": "identifies that a value is not included in the array",
      "property": "find",
      "input": {
        "array": [1, 3, 4, 6, 8, 9, 11],
        "value": 7
      },
      "expected": {"error": "value not in array"}
    },
    {
      "description": "a value smaller than the array's smallest value is not found",
      "property": "find",
      "input": {
        "array": [1, 3, 4, 6, 8, 9, 11],
        "value": 0
      },
      "expected": {"error": "value not in array"}
    },
    {
      "description": "a value larger than the array's largest value is not found",
      "property": "find",
      "input": {
        "array": [1, 3, 4, 6, 8, 9, 11],
        "value": 13
      },
      "expected": {"error": "value not in array"}
    },
    {
      "description": "nothing is found in an empty array",
      "property": "find",
      "input": {
        "array": [],
        "value": 1
      },
      "expected": {"error": "value not in array"}
    },
    {
      "description": "nothing is found when the left and right bounds cross",
      "property": "find",
      "input": {
        "array": [1, 2],
        "value": 0
      },
      "expected": {"error": "value not in array"}
    }
  ]
}
