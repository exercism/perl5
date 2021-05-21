#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use WordCount qw<count_words>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<count_words> or bail_out;

for my $case (@test_cases) {
  is( count_words( $case->{input}{sentence} ),
    $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "count one word",
    "expected": {
      "word": 1
    },
    "input": {
      "sentence": "word"
    },
    "property": "countWords"
  },
  {
    "description": "count one of each word",
    "expected": {
      "each": 1,
      "of": 1,
      "one": 1
    },
    "input": {
      "sentence": "one of each"
    },
    "property": "countWords"
  },
  {
    "description": "multiple occurrences of a word",
    "expected": {
      "blue": 1,
      "fish": 4,
      "one": 1,
      "red": 1,
      "two": 1
    },
    "input": {
      "sentence": "one fish two fish red fish blue fish"
    },
    "property": "countWords"
  },
  {
    "description": "handles cramped lists",
    "expected": {
      "one": 1,
      "three": 1,
      "two": 1
    },
    "input": {
      "sentence": "one,two,three"
    },
    "property": "countWords"
  },
  {
    "description": "handles expanded lists",
    "expected": {
      "one": 1,
      "three": 1,
      "two": 1
    },
    "input": {
      "sentence": "one,\ntwo,\nthree"
    },
    "property": "countWords"
  },
  {
    "description": "ignore punctuation",
    "expected": {
      "as": 1,
      "car": 1,
      "carpet": 1,
      "java": 1,
      "javascript": 1
    },
    "input": {
      "sentence": "car: carpet as java: javascript!!&@$%^&"
    },
    "property": "countWords"
  },
  {
    "description": "include numbers",
    "expected": {
      "1": 1,
      "2": 1,
      "testing": 2
    },
    "input": {
      "sentence": "testing, 1, 2 testing"
    },
    "property": "countWords"
  },
  {
    "description": "normalize case",
    "expected": {
      "go": 3,
      "stop": 2
    },
    "input": {
      "sentence": "go Go GO Stop stop"
    },
    "property": "countWords"
  },
  {
    "description": "with apostrophes",
    "expected": {
      "cry": 1,
      "don't": 2,
      "first": 1,
      "laugh": 1,
      "then": 1
    },
    "input": {
      "sentence": "First: don't laugh. Then: don't cry."
    },
    "property": "countWords"
  },
  {
    "description": "with quotations",
    "expected": {
      "and": 1,
      "between": 1,
      "can't": 1,
      "joe": 1,
      "large": 2,
      "tell": 1
    },
    "input": {
      "sentence": "Joe can't tell between 'large' and large."
    },
    "property": "countWords"
  },
  {
    "description": "substrings from the beginning",
    "expected": {
      "a": 1,
      "and": 1,
      "app": 1,
      "apple": 1,
      "between": 1,
      "can't": 1,
      "joe": 1,
      "tell": 1
    },
    "input": {
      "sentence": "Joe can't tell between app, apple and a."
    },
    "property": "countWords"
  },
  {
    "description": "multiple spaces not detected as a word",
    "expected": {
      "multiple": 1,
      "whitespaces": 1
    },
    "input": {
      "sentence": " multiple   whitespaces"
    },
    "property": "countWords"
  },
  {
    "description": "alternating word separators not detected as a word",
    "expected": {
      "one": 1,
      "three": 1,
      "two": 1
    },
    "input": {
      "sentence": ",\n,one,\n ,two \n 'three'"
    },
    "property": "countWords"
  }
]
