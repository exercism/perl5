#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Allergies qw<allergic_to list_allergies>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 50;

imported_ok qw<allergic_to list_allergies> or bail_out;

for my $case (@test_cases) {
  if ( $case->{property} eq 'allergicTo' ) {
    is allergic_to( $case->{input} ), $case->{expected} ? T : DF,
      $case->{description};
  }
  elsif ( $case->{property} eq 'list' ) {
    is
      list_allergies( $case->{input}{score} ), bag {
      item $_ for @{ $case->{expected} };
      end;
      }, $case->{description};
  }
}

__DATA__
[
  {
    "description": "testing for eggs allergy: not allergic to anything",
    "expected": false,
    "input": {
      "item": "eggs",
      "score": 0
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for eggs allergy: allergic only to eggs",
    "expected": true,
    "input": {
      "item": "eggs",
      "score": 1
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for eggs allergy: allergic to eggs and something else",
    "expected": true,
    "input": {
      "item": "eggs",
      "score": 3
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for eggs allergy: allergic to something, but not eggs",
    "expected": false,
    "input": {
      "item": "eggs",
      "score": 2
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for eggs allergy: allergic to everything",
    "expected": true,
    "input": {
      "item": "eggs",
      "score": 255
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for peanuts allergy: not allergic to anything",
    "expected": false,
    "input": {
      "item": "peanuts",
      "score": 0
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for peanuts allergy: allergic only to peanuts",
    "expected": true,
    "input": {
      "item": "peanuts",
      "score": 2
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for peanuts allergy: allergic to peanuts and something else",
    "expected": true,
    "input": {
      "item": "peanuts",
      "score": 7
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for peanuts allergy: allergic to something, but not peanuts",
    "expected": false,
    "input": {
      "item": "peanuts",
      "score": 5
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for peanuts allergy: allergic to everything",
    "expected": true,
    "input": {
      "item": "peanuts",
      "score": 255
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for shellfish allergy: not allergic to anything",
    "expected": false,
    "input": {
      "item": "shellfish",
      "score": 0
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for shellfish allergy: allergic only to shellfish",
    "expected": true,
    "input": {
      "item": "shellfish",
      "score": 4
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for shellfish allergy: allergic to shellfish and something else",
    "expected": true,
    "input": {
      "item": "shellfish",
      "score": 14
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for shellfish allergy: allergic to something, but not shellfish",
    "expected": false,
    "input": {
      "item": "shellfish",
      "score": 10
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for shellfish allergy: allergic to everything",
    "expected": true,
    "input": {
      "item": "shellfish",
      "score": 255
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for strawberries allergy: not allergic to anything",
    "expected": false,
    "input": {
      "item": "strawberries",
      "score": 0
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for strawberries allergy: allergic only to strawberries",
    "expected": true,
    "input": {
      "item": "strawberries",
      "score": 8
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for strawberries allergy: allergic to strawberries and something else",
    "expected": true,
    "input": {
      "item": "strawberries",
      "score": 28
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for strawberries allergy: allergic to something, but not strawberries",
    "expected": false,
    "input": {
      "item": "strawberries",
      "score": 20
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for strawberries allergy: allergic to everything",
    "expected": true,
    "input": {
      "item": "strawberries",
      "score": 255
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for tomatoes allergy: not allergic to anything",
    "expected": false,
    "input": {
      "item": "tomatoes",
      "score": 0
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for tomatoes allergy: allergic only to tomatoes",
    "expected": true,
    "input": {
      "item": "tomatoes",
      "score": 16
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for tomatoes allergy: allergic to tomatoes and something else",
    "expected": true,
    "input": {
      "item": "tomatoes",
      "score": 56
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for tomatoes allergy: allergic to something, but not tomatoes",
    "expected": false,
    "input": {
      "item": "tomatoes",
      "score": 40
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for tomatoes allergy: allergic to everything",
    "expected": true,
    "input": {
      "item": "tomatoes",
      "score": 255
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for chocolate allergy: not allergic to anything",
    "expected": false,
    "input": {
      "item": "chocolate",
      "score": 0
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for chocolate allergy: allergic only to chocolate",
    "expected": true,
    "input": {
      "item": "chocolate",
      "score": 32
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for chocolate allergy: allergic to chocolate and something else",
    "expected": true,
    "input": {
      "item": "chocolate",
      "score": 112
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for chocolate allergy: allergic to something, but not chocolate",
    "expected": false,
    "input": {
      "item": "chocolate",
      "score": 80
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for chocolate allergy: allergic to everything",
    "expected": true,
    "input": {
      "item": "chocolate",
      "score": 255
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for pollen allergy: not allergic to anything",
    "expected": false,
    "input": {
      "item": "pollen",
      "score": 0
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for pollen allergy: allergic only to pollen",
    "expected": true,
    "input": {
      "item": "pollen",
      "score": 64
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for pollen allergy: allergic to pollen and something else",
    "expected": true,
    "input": {
      "item": "pollen",
      "score": 224
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for pollen allergy: allergic to something, but not pollen",
    "expected": false,
    "input": {
      "item": "pollen",
      "score": 160
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for pollen allergy: allergic to everything",
    "expected": true,
    "input": {
      "item": "pollen",
      "score": 255
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for cats allergy: not allergic to anything",
    "expected": false,
    "input": {
      "item": "cats",
      "score": 0
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for cats allergy: allergic only to cats",
    "expected": true,
    "input": {
      "item": "cats",
      "score": 128
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for cats allergy: allergic to cats and something else",
    "expected": true,
    "input": {
      "item": "cats",
      "score": 192
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for cats allergy: allergic to something, but not cats",
    "expected": false,
    "input": {
      "item": "cats",
      "score": 64
    },
    "property": "allergicTo"
  },
  {
    "description": "testing for cats allergy: allergic to everything",
    "expected": true,
    "input": {
      "item": "cats",
      "score": 255
    },
    "property": "allergicTo"
  },
  {
    "description": "list when: no allergies",
    "expected": [],
    "input": {
      "score": 0
    },
    "property": "list"
  },
  {
    "description": "list when: just eggs",
    "expected": [
      "eggs"
    ],
    "input": {
      "score": 1
    },
    "property": "list"
  },
  {
    "description": "list when: just peanuts",
    "expected": [
      "peanuts"
    ],
    "input": {
      "score": 2
    },
    "property": "list"
  },
  {
    "description": "list when: just strawberries",
    "expected": [
      "strawberries"
    ],
    "input": {
      "score": 8
    },
    "property": "list"
  },
  {
    "description": "list when: eggs and peanuts",
    "expected": [
      "eggs",
      "peanuts"
    ],
    "input": {
      "score": 3
    },
    "property": "list"
  },
  {
    "description": "list when: more than eggs but not peanuts",
    "expected": [
      "eggs",
      "shellfish"
    ],
    "input": {
      "score": 5
    },
    "property": "list"
  },
  {
    "description": "list when: lots of stuff",
    "expected": [
      "strawberries",
      "tomatoes",
      "chocolate",
      "pollen",
      "cats"
    ],
    "input": {
      "score": 248
    },
    "property": "list"
  },
  {
    "description": "list when: everything",
    "expected": [
      "eggs",
      "peanuts",
      "shellfish",
      "strawberries",
      "tomatoes",
      "chocolate",
      "pollen",
      "cats"
    ],
    "input": {
      "score": 255
    },
    "property": "list"
  },
  {
    "description": "list when: no allergen score parts",
    "expected": [
      "eggs",
      "shellfish",
      "strawberries",
      "tomatoes",
      "chocolate",
      "pollen",
      "cats"
    ],
    "input": {
      "score": 509
    },
    "property": "list"
  }
]
