#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use LargestSeriesProduct qw<largest_product>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<largest_product> or bail_out;

for my $case (@test_cases) {
  if ( !ref $case->{expected} ) {
    is( largest_product( $case->{input} ),
      $case->{expected}, $case->{description}, );
  }
  else {
    like dies( sub { largest_product( $case->{input} ) } ),
      qr/$case->{expected}{error}/, $case->{description};
  }
}

done_testing;

__DATA__
[
  {
    "description": "finds the largest product if span equals length",
    "expected": 18,
    "input": {
      "digits": "29",
      "span": 2
    },
    "property": "largestProduct"
  },
  {
    "description": "can find the largest product of 2 with numbers in order",
    "expected": 72,
    "input": {
      "digits": "0123456789",
      "span": 2
    },
    "property": "largestProduct"
  },
  {
    "description": "can find the largest product of 2",
    "expected": 48,
    "input": {
      "digits": "576802143",
      "span": 2
    },
    "property": "largestProduct"
  },
  {
    "description": "can find the largest product of 3 with numbers in order",
    "expected": 504,
    "input": {
      "digits": "0123456789",
      "span": 3
    },
    "property": "largestProduct"
  },
  {
    "description": "can find the largest product of 3",
    "expected": 270,
    "input": {
      "digits": "1027839564",
      "span": 3
    },
    "property": "largestProduct"
  },
  {
    "description": "can find the largest product of 5 with numbers in order",
    "expected": 15120,
    "input": {
      "digits": "0123456789",
      "span": 5
    },
    "property": "largestProduct"
  },
  {
    "description": "can get the largest product of a big number",
    "expected": 23520,
    "input": {
      "digits": "73167176531330624919225119674426574742355349194934",
      "span": 6
    },
    "property": "largestProduct"
  },
  {
    "description": "reports zero if the only digits are zero",
    "expected": 0,
    "input": {
      "digits": "0000",
      "span": 2
    },
    "property": "largestProduct"
  },
  {
    "description": "reports zero if all spans include zero",
    "expected": 0,
    "input": {
      "digits": "99099",
      "span": 3
    },
    "property": "largestProduct"
  },
  {
    "description": "rejects span longer than string length",
    "expected": {
      "error": "span must be smaller than string length"
    },
    "input": {
      "digits": "123",
      "span": 4
    },
    "property": "largestProduct"
  },
  {
    "description": "reports 1 for empty string and empty product (0 span)",
    "expected": 1,
    "input": {
      "digits": "",
      "span": 0
    },
    "property": "largestProduct"
  },
  {
    "description": "reports 1 for nonempty string and empty product (0 span)",
    "expected": 1,
    "input": {
      "digits": "123",
      "span": 0
    },
    "property": "largestProduct"
  },
  {
    "description": "rejects empty string and nonzero span",
    "expected": {
      "error": "span must be smaller than string length"
    },
    "input": {
      "digits": "",
      "span": 1
    },
    "property": "largestProduct"
  },
  {
    "description": "rejects invalid character in digits",
    "expected": {
      "error": "digits input must only contain digits"
    },
    "input": {
      "digits": "1234a5",
      "span": 2
    },
    "property": "largestProduct"
  },
  {
    "description": "rejects negative span",
    "expected": {
      "error": "span must be greater than zero"
    },
    "input": {
      "digits": "12345",
      "span": -1
    },
    "property": "largestProduct"
  }
]
