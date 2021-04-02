#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PigLatin qw<translate>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 23;

imported_ok qw<translate> or bail_out;

for my $case (@test_cases) {
  is translate( $case->{input}{phrase} ), $case->{expected},
    $case->{description};
}

__DATA__
[
  {
    "description": "ay is added to words that start with vowels: word beginning with a",
    "expected": "appleay",
    "input": {
      "phrase": "apple"
    },
    "property": "translate"
  },
  {
    "description": "ay is added to words that start with vowels: word beginning with e",
    "expected": "earay",
    "input": {
      "phrase": "ear"
    },
    "property": "translate"
  },
  {
    "description": "ay is added to words that start with vowels: word beginning with i",
    "expected": "iglooay",
    "input": {
      "phrase": "igloo"
    },
    "property": "translate"
  },
  {
    "description": "ay is added to words that start with vowels: word beginning with o",
    "expected": "objectay",
    "input": {
      "phrase": "object"
    },
    "property": "translate"
  },
  {
    "description": "ay is added to words that start with vowels: word beginning with u",
    "expected": "underay",
    "input": {
      "phrase": "under"
    },
    "property": "translate"
  },
  {
    "description": "ay is added to words that start with vowels: word beginning with a vowel and followed by a qu",
    "expected": "equalay",
    "input": {
      "phrase": "equal"
    },
    "property": "translate"
  },
  {
    "description": "first letter and ay are moved to the end of words that start with consonants: word beginning with p",
    "expected": "igpay",
    "input": {
      "phrase": "pig"
    },
    "property": "translate"
  },
  {
    "description": "first letter and ay are moved to the end of words that start with consonants: word beginning with k",
    "expected": "oalakay",
    "input": {
      "phrase": "koala"
    },
    "property": "translate"
  },
  {
    "description": "first letter and ay are moved to the end of words that start with consonants: word beginning with x",
    "expected": "enonxay",
    "input": {
      "phrase": "xenon"
    },
    "property": "translate"
  },
  {
    "description": "first letter and ay are moved to the end of words that start with consonants: word beginning with q without a following u",
    "expected": "atqay",
    "input": {
      "phrase": "qat"
    },
    "property": "translate"
  },
  {
    "description": "some letter clusters are treated like a single consonant: word beginning with ch",
    "expected": "airchay",
    "input": {
      "phrase": "chair"
    },
    "property": "translate"
  },
  {
    "description": "some letter clusters are treated like a single consonant: word beginning with qu",
    "expected": "eenquay",
    "input": {
      "phrase": "queen"
    },
    "property": "translate"
  },
  {
    "description": "some letter clusters are treated like a single consonant: word beginning with qu and a preceding consonant",
    "expected": "aresquay",
    "input": {
      "phrase": "square"
    },
    "property": "translate"
  },
  {
    "description": "some letter clusters are treated like a single consonant: word beginning with th",
    "expected": "erapythay",
    "input": {
      "phrase": "therapy"
    },
    "property": "translate"
  },
  {
    "description": "some letter clusters are treated like a single consonant: word beginning with thr",
    "expected": "ushthray",
    "input": {
      "phrase": "thrush"
    },
    "property": "translate"
  },
  {
    "description": "some letter clusters are treated like a single consonant: word beginning with sch",
    "expected": "oolschay",
    "input": {
      "phrase": "school"
    },
    "property": "translate"
  },
  {
    "description": "some letter clusters are treated like a single vowel: word beginning with yt",
    "expected": "yttriaay",
    "input": {
      "phrase": "yttria"
    },
    "property": "translate"
  },
  {
    "description": "some letter clusters are treated like a single vowel: word beginning with xr",
    "expected": "xrayay",
    "input": {
      "phrase": "xray"
    },
    "property": "translate"
  },
  {
    "description": "position of y in a word determines if it is a consonant or a vowel: y is treated like a consonant at the beginning of a word",
    "expected": "ellowyay",
    "input": {
      "phrase": "yellow"
    },
    "property": "translate"
  },
  {
    "description": "position of y in a word determines if it is a consonant or a vowel: y is treated like a vowel at the end of a consonant cluster",
    "expected": "ythmrhay",
    "input": {
      "phrase": "rhythm"
    },
    "property": "translate"
  },
  {
    "description": "position of y in a word determines if it is a consonant or a vowel: y as second letter in two letter word",
    "expected": "ymay",
    "input": {
      "phrase": "my"
    },
    "property": "translate"
  },
  {
    "description": "phrases are translated: a whole phrase",
    "expected": "ickquay astfay unray",
    "input": {
      "phrase": "quick fast run"
    },
    "property": "translate"
  }
]
