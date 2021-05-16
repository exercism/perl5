#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PhoneNumber qw<clean_number>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 19;

imported_ok qw<clean_number> or bail_out;

for my $case (@test_cases) {
  if ( !ref $case->{expected} ) {
    is clean_number( $case->{input}{phrase} ), $case->{expected},
      $case->{description};
  }
  else {
    like dies( sub { clean_number( $case->{input}{phrase} ) } ),
      qr/$case->{expected}{error}/, $case->{description};
  }
}

__DATA__
[
  {
    "description": "cleans the number",
    "expected": "2234567890",
    "input": {
      "phrase": "(223) 456-7890"
    },
    "property": "clean"
  },
  {
    "description": "cleans numbers with dots",
    "expected": "2234567890",
    "input": {
      "phrase": "223.456.7890"
    },
    "property": "clean"
  },
  {
    "description": "cleans numbers with multiple spaces",
    "expected": "2234567890",
    "input": {
      "phrase": "223 456   7890   "
    },
    "property": "clean"
  },
  {
    "description": "invalid when 9 digits",
    "expected": {
      "error": "incorrect number of digits"
    },
    "input": {
      "phrase": "123456789"
    },
    "property": "clean"
  },
  {
    "description": "invalid when 11 digits does not start with a 1",
    "expected": {
      "error": "11 digits must start with 1"
    },
    "input": {
      "phrase": "22234567890"
    },
    "property": "clean"
  },
  {
    "description": "valid when 11 digits and starting with 1",
    "expected": "2234567890",
    "input": {
      "phrase": "12234567890"
    },
    "property": "clean"
  },
  {
    "description": "valid when 11 digits and starting with 1 even with punctuation",
    "expected": "2234567890",
    "input": {
      "phrase": "+1 (223) 456-7890"
    },
    "property": "clean"
  },
  {
    "description": "invalid when more than 11 digits",
    "expected": {
      "error": "more than 11 digits"
    },
    "input": {
      "phrase": "321234567890"
    },
    "property": "clean"
  },
  {
    "description": "invalid with letters",
    "expected": {
      "error": "letters not permitted"
    },
    "input": {
      "phrase": "123-abc-7890"
    },
    "property": "clean"
  },
  {
    "description": "invalid with punctuations",
    "expected": {
      "error": "punctuations not permitted"
    },
    "input": {
      "phrase": "123-@:!-7890"
    },
    "property": "clean"
  },
  {
    "description": "invalid if area code starts with 0",
    "expected": {
      "error": "area code cannot start with zero"
    },
    "input": {
      "phrase": "(023) 456-7890"
    },
    "property": "clean"
  },
  {
    "description": "invalid if area code starts with 1",
    "expected": {
      "error": "area code cannot start with one"
    },
    "input": {
      "phrase": "(123) 456-7890"
    },
    "property": "clean"
  },
  {
    "description": "invalid if exchange code starts with 0",
    "expected": {
      "error": "exchange code cannot start with zero"
    },
    "input": {
      "phrase": "(223) 056-7890"
    },
    "property": "clean"
  },
  {
    "description": "invalid if exchange code starts with 1",
    "expected": {
      "error": "exchange code cannot start with one"
    },
    "input": {
      "phrase": "(223) 156-7890"
    },
    "property": "clean"
  },
  {
    "description": "invalid if area code starts with 0 on valid 11-digit number",
    "expected": {
      "error": "area code cannot start with zero"
    },
    "input": {
      "phrase": "1 (023) 456-7890"
    },
    "property": "clean"
  },
  {
    "description": "invalid if area code starts with 1 on valid 11-digit number",
    "expected": {
      "error": "area code cannot start with one"
    },
    "input": {
      "phrase": "1 (123) 456-7890"
    },
    "property": "clean"
  },
  {
    "description": "invalid if exchange code starts with 0 on valid 11-digit number",
    "expected": {
      "error": "exchange code cannot start with zero"
    },
    "input": {
      "phrase": "1 (223) 056-7890"
    },
    "property": "clean"
  },
  {
    "description": "invalid if exchange code starts with 1 on valid 11-digit number",
    "expected": {
      "error": "exchange code cannot start with one"
    },
    "input": {
      "phrase": "1 (223) 156-7890"
    },
    "property": "clean"
  }
]
