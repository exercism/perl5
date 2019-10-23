#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use PigLatin qw(translate);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 23;

imported_ok qw(translate) or bail_out;

for my $case ( map { @{ $_->{cases} } } @{ $C_DATA->{cases} } ) {
  is translate( $case->{input}{phrase} ), $case->{expected},
    $case->{description};
}

__DATA__
{
  "exercise": "pig-latin",
  "version": "1.2.0",
  "cases": [
    {
      "description": "ay is added to words that start with vowels",
      "cases": [
        {
          "description": "word beginning with a",
          "property": "translate",
          "input": {
            "phrase": "apple"
          },
          "expected": "appleay"
        },
        {
          "description": "word beginning with e",
          "property": "translate",
          "input": {
            "phrase": "ear"
          },
          "expected": "earay"
        },
        {
          "description": "word beginning with i",
          "property": "translate",
          "input": {
            "phrase": "igloo"
          },
          "expected": "iglooay"
        },
        {
          "description": "word beginning with o",
          "property": "translate",
          "input": {
            "phrase": "object"
          },
          "expected": "objectay"
        },
        {
          "description": "word beginning with u",
          "property": "translate",
          "input": {
            "phrase": "under"
          },
          "expected": "underay"
        },
        {
          "description": "word beginning with a vowel and followed by a qu",
          "property": "translate",
          "input": {
            "phrase": "equal"
          },
          "expected": "equalay"
        }
      ]
    },
    {
      "description": "first letter and ay are moved to the end of words that start with consonants",
      "cases": [
        {
          "description": "word beginning with p",
          "property": "translate",
          "input": {
            "phrase": "pig"
          },
          "expected": "igpay"
        },
        {
          "description": "word beginning with k",
          "property": "translate",
          "input": {
            "phrase": "koala"
          },
          "expected": "oalakay"
        },
        {
          "description": "word beginning with x",
          "property": "translate",
          "input": {
            "phrase": "xenon"
          },
          "expected": "enonxay"
        },
        {
          "description": "word beginning with q without a following u",
          "property": "translate",
          "input": {
            "phrase": "qat"
          },
          "expected": "atqay"
        }
      ]
    },
    {
      "description": "some letter clusters are treated like a single consonant",
      "cases": [
        {
          "description": "word beginning with ch",
          "property": "translate",
          "input": {
            "phrase": "chair"
          },
          "expected": "airchay"
        },
        {
          "description": "word beginning with qu",
          "property": "translate",
          "input": {
            "phrase": "queen"
          },
          "expected": "eenquay"
        },
        {
          "description": "word beginning with qu and a preceding consonant",
          "property": "translate",
          "input": {
            "phrase": "square"
          },
          "expected": "aresquay"
        },
        {
          "description": "word beginning with th",
          "property": "translate",
          "input": {
            "phrase": "therapy"
          },
          "expected": "erapythay"
        },
        {
          "description": "word beginning with thr",
          "property": "translate",
          "input": {
            "phrase": "thrush"
          },
          "expected": "ushthray"
        },
        {
          "description": "word beginning with sch",
          "property": "translate",
          "input": {
            "phrase": "school"
          },
          "expected": "oolschay"
        }
      ]
    },
    {
      "description": "some letter clusters are treated like a single vowel",
      "cases": [
        {
          "description": "word beginning with yt",
          "property": "translate",
          "input": {
            "phrase": "yttria"
          },
          "expected": "yttriaay"
        },
        {
          "description": "word beginning with xr",
          "property": "translate",
          "input": {
            "phrase": "xray"
          },
          "expected": "xrayay"
        }
      ]
    },
    {
      "description": "position of y in a word determines if it is a consonant or a vowel",
      "cases": [
        {
          "description": "y is treated like a consonant at the beginning of a word",
          "property": "translate",
          "input": {
            "phrase": "yellow"
          },
          "expected": "ellowyay"
        },
        {
          "description": "y is treated like a vowel at the end of a consonant cluster",
          "property": "translate",
          "input": {
            "phrase": "rhythm"
          },
          "expected": "ythmrhay"
        },
        {
          "description": "y as second letter in two letter word",
          "property": "translate",
          "input": {
            "phrase": "my"
          },
          "expected": "ymay"
        }
      ]
    },
    {
      "description": "phrases are translated",
      "cases": [
        {
          "description": "a whole phrase",
          "property": "translate",
          "input": {
            "phrase": "quick fast run"
          },
          "expected": "ickquay astfay unray"
        }
      ]
    }
  ]
}
