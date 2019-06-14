#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use Grains qw(grains_on_square total_grains);
use Math::BigFloat;

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 12;

imported_ok qw(grains_on_square total_grains) or bail_out;

for my $case ( map @{ $_->{cases} // [$_] }, @{ $C_DATA->{cases} } ) {
  if ( ref $case->{expected} ) {
    like dies( sub { grains_on_square( $case->{input}{square} ) } ),
      qr/$case->{expected}{error}/,
      $case->{description};
  }
  elsif ( $case->{property} eq 'square' ) {
    is(
      Math::BigFloat->new(
        grains_on_square( $case->{input}{square} )
      )->numify,
      number( $case->{expected} ),
      'square no. ' . $case->{description}
    );
  }
  elsif ( $case->{property} eq 'total' ) {
    is(
      Math::BigFloat->new( total_grains() )->numify,
      number( $case->{expected} ),
      $case->{description}
    );
  }
}

__DATA__
{
  "exercise": "grains",
  "version": "1.2.0",
  "comments": [
    "The final tests of square test error conditions",
    "In these cases you should expect an error as is idiomatic for your language"
  ],
  "cases": [
    {
      "description": "returns the number of grains on the square",
      "cases": [
        {
          "description": "1",
          "property": "square",
          "input": {
            "square": 1
          },
          "expected": 1
        },
        {
          "description": "2",
          "property": "square",
          "input": {
            "square": 2
          },
          "expected": 2
        },
        {
          "description": "3",
          "property": "square",
          "input": {
            "square": 3
          },
          "expected": 4
        },
        {
          "description": "4",
          "property": "square",
          "input": {
            "square": 4
          },
          "expected": 8
        },
        {
          "description": "16",
          "property": "square",
          "input": {
            "square": 16
          },
          "expected": 32768
        },
        {
          "description": "32",
          "property": "square",
          "input": {
            "square": 32
          },
          "expected": 2147483648
        },
        {
          "description": "64",
          "property": "square",
          "input": {
            "square": 64
          },
          "expected": 9223372036854775808
        },
        {
          "description": "square 0 raises an exception",
          "property": "square",
          "input": {
            "square": 0
          },
          "expected": {"error": "square must be between 1 and 64"}
        },
        {
          "description": "negative square raises an exception",
          "property": "square",
          "input": {
            "square": -1
          },
          "expected": {"error": "square must be between 1 and 64"}
        },
        {
          "description": "square greater than 64 raises an exception",
          "property": "square",
          "input": {
            "square": 65
          },
          "expected": {"error": "square must be between 1 and 64"}
        }
      ]
    },
    {
      "description": "returns the total number of grains on the board",
      "property": "total",
      "input": {},
      "expected": 18446744073709551615
    }
  ]
}
