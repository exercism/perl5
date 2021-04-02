#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Anagram qw<match_anagrams>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 15;

imported_ok qw<match_anagrams> or bail_out;

for my $case (@test_cases) {
  is match_anagrams( $case->{input} ), $case->{expected},
    $case->{description};
}

__DATA__
[
  {
    "description": "no matches",
    "expected": [],
    "input": {
      "candidates": [
        "hello",
        "world",
        "zombies",
        "pants"
      ],
      "subject": "diaper"
    },
    "property": "findAnagrams"
  },
  {
    "description": "detects two anagrams",
    "expected": [
      "stream",
      "maters"
    ],
    "input": {
      "candidates": [
        "stream",
        "pigeon",
        "maters"
      ],
      "subject": "master"
    },
    "property": "findAnagrams"
  },
  {
    "description": "does not detect anagram subsets",
    "expected": [],
    "input": {
      "candidates": [
        "dog",
        "goody"
      ],
      "subject": "good"
    },
    "property": "findAnagrams"
  },
  {
    "description": "detects anagram",
    "expected": [
      "inlets"
    ],
    "input": {
      "candidates": [
        "enlists",
        "google",
        "inlets",
        "banana"
      ],
      "subject": "listen"
    },
    "property": "findAnagrams"
  },
  {
    "description": "detects three anagrams",
    "expected": [
      "gallery",
      "regally",
      "largely"
    ],
    "input": {
      "candidates": [
        "gallery",
        "ballerina",
        "regally",
        "clergy",
        "largely",
        "leading"
      ],
      "subject": "allergy"
    },
    "property": "findAnagrams"
  },
  {
    "description": "detects multiple anagrams with different case",
    "expected": [
      "Eons",
      "ONES"
    ],
    "input": {
      "candidates": [
        "Eons",
        "ONES"
      ],
      "subject": "nose"
    },
    "property": "findAnagrams"
  },
  {
    "description": "does not detect non-anagrams with identical checksum",
    "expected": [],
    "input": {
      "candidates": [
        "last"
      ],
      "subject": "mass"
    },
    "property": "findAnagrams"
  },
  {
    "description": "detects anagrams case-insensitively",
    "expected": [
      "Carthorse"
    ],
    "input": {
      "candidates": [
        "cashregister",
        "Carthorse",
        "radishes"
      ],
      "subject": "Orchestra"
    },
    "property": "findAnagrams"
  },
  {
    "description": "detects anagrams using case-insensitive subject",
    "expected": [
      "carthorse"
    ],
    "input": {
      "candidates": [
        "cashregister",
        "carthorse",
        "radishes"
      ],
      "subject": "Orchestra"
    },
    "property": "findAnagrams"
  },
  {
    "description": "detects anagrams using case-insensitive possible matches",
    "expected": [
      "Carthorse"
    ],
    "input": {
      "candidates": [
        "cashregister",
        "Carthorse",
        "radishes"
      ],
      "subject": "orchestra"
    },
    "property": "findAnagrams"
  },
  {
    "description": "does not detect an anagram if the original word is repeated",
    "expected": [],
    "input": {
      "candidates": [
        "go Go GO"
      ],
      "subject": "go"
    },
    "property": "findAnagrams"
  },
  {
    "description": "anagrams must use all letters exactly once",
    "expected": [],
    "input": {
      "candidates": [
        "patter"
      ],
      "subject": "tapper"
    },
    "property": "findAnagrams"
  },
  {
    "description": "words are not anagrams of themselves (case-insensitive)",
    "expected": [],
    "input": {
      "candidates": [
        "BANANA",
        "Banana",
        "banana"
      ],
      "subject": "BANANA"
    },
    "property": "findAnagrams"
  },
  {
    "description": "words other than themselves can be anagrams",
    "expected": [
      "Silent"
    ],
    "input": {
      "candidates": [
        "Listen",
        "Silent",
        "LISTEN"
      ],
      "subject": "LISTEN"
    },
    "property": "findAnagrams"
  }
]
