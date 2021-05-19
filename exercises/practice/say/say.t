#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Say qw<say_number>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<say_number> or bail_out;

for my $case (@test_cases) {
  if ( !ref $case->{expected} ) {
    is( say_number( $case->{input}{number} ),
      $case->{expected}, $case->{description}, );
  }
  else {
    like dies( sub { say_number( $case->{input}{number} ) } ),
      qr/$case->{expected}{error}/, $case->{description};
  }
}

done_testing;

__DATA__
[
  {
    "description": "zero",
    "expected": "zero",
    "input": {
      "number": 0
    },
    "property": "say"
  },
  {
    "description": "one",
    "expected": "one",
    "input": {
      "number": 1
    },
    "property": "say"
  },
  {
    "description": "fourteen",
    "expected": "fourteen",
    "input": {
      "number": 14
    },
    "property": "say"
  },
  {
    "description": "twenty",
    "expected": "twenty",
    "input": {
      "number": 20
    },
    "property": "say"
  },
  {
    "description": "twenty-two",
    "expected": "twenty-two",
    "input": {
      "number": 22
    },
    "property": "say"
  },
  {
    "description": "one hundred",
    "expected": "one hundred",
    "input": {
      "number": 100
    },
    "property": "say"
  },
  {
    "description": "one hundred twenty-three",
    "expected": "one hundred twenty-three",
    "input": {
      "number": 123
    },
    "property": "say"
  },
  {
    "description": "one thousand",
    "expected": "one thousand",
    "input": {
      "number": 1000
    },
    "property": "say"
  },
  {
    "description": "one thousand two hundred thirty-four",
    "expected": "one thousand two hundred thirty-four",
    "input": {
      "number": 1234
    },
    "property": "say"
  },
  {
    "description": "one million",
    "expected": "one million",
    "input": {
      "number": 1000000
    },
    "property": "say"
  },
  {
    "description": "one million two thousand three hundred forty-five",
    "expected": "one million two thousand three hundred forty-five",
    "input": {
      "number": 1002345
    },
    "property": "say"
  },
  {
    "description": "one billion",
    "expected": "one billion",
    "input": {
      "number": 1000000000
    },
    "property": "say"
  },
  {
    "description": "a big number",
    "expected": "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three",
    "input": {
      "number": 987654321123
    },
    "property": "say"
  },
  {
    "description": "numbers below zero are out of range",
    "expected": {
      "error": "input out of range"
    },
    "input": {
      "number": -1
    },
    "property": "say"
  },
  {
    "description": "numbers above 999,999,999,999 are out of range",
    "expected": {
      "error": "input out of range"
    },
    "input": {
      "number": 1000000000000
    },
    "property": "say"
  }
]
