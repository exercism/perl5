#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Grains qw<grains_on_square total_grains>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 12;

imported_ok qw<grains_on_square total_grains> or bail_out;

for my $case (@test_cases) {
  if ( ref $case->{expected} ) {
    like dies( sub { grains_on_square( $case->{input}{square} ) } ),
      qr/$case->{expected}{error}/,
      $case->{description};
  }
  elsif ( $case->{property} eq 'square' ) {
    is( grains_on_square( $case->{input}{square} ),
      $case->{expected}, 'square no. ' . $case->{description} );
  }
  elsif ( $case->{property} eq 'total' ) {
    is( total_grains(), $case->{expected}, $case->{description} );
  }
}

__DATA__
[
  {
    "description": "returns the number of grains on the square: grains on square 1",
    "expected": 1,
    "input": {
      "square": 1
    },
    "property": "square"
  },
  {
    "description": "returns the number of grains on the square: grains on square 2",
    "expected": 2,
    "input": {
      "square": 2
    },
    "property": "square"
  },
  {
    "description": "returns the number of grains on the square: grains on square 3",
    "expected": 4,
    "input": {
      "square": 3
    },
    "property": "square"
  },
  {
    "description": "returns the number of grains on the square: grains on square 4",
    "expected": 8,
    "input": {
      "square": 4
    },
    "property": "square"
  },
  {
    "description": "returns the number of grains on the square: grains on square 16",
    "expected": 32768,
    "input": {
      "square": 16
    },
    "property": "square"
  },
  {
    "description": "returns the number of grains on the square: grains on square 32",
    "expected": 2147483648,
    "input": {
      "square": 32
    },
    "property": "square"
  },
  {
    "description": "returns the number of grains on the square: grains on square 64",
    "expected": 9223372036854775808,
    "input": {
      "square": 64
    },
    "property": "square"
  },
  {
    "description": "returns the number of grains on the square: square 0 raises an exception",
    "expected": {
      "error": "square must be between 1 and 64"
    },
    "input": {
      "square": 0
    },
    "property": "square"
  },
  {
    "description": "returns the number of grains on the square: negative square raises an exception",
    "expected": {
      "error": "square must be between 1 and 64"
    },
    "input": {
      "square": -1
    },
    "property": "square"
  },
  {
    "description": "returns the number of grains on the square: square greater than 64 raises an exception",
    "expected": {
      "error": "square must be between 1 and 64"
    },
    "input": {
      "square": 65
    },
    "property": "square"
  },
  {
    "description": "returns the total number of grains on the board",
    "expected": 18446744073709551615,
    "input": {},
    "property": "total"
  }
]
