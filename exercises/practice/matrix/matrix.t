#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Matrix qw<row column>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<row column> or bail_out;

for my $case (@test_cases) {
    my $func;
    if ( $case->{property} eq 'row' ) {
        $func = \&row;
    }
    elsif ( $case->{property} eq 'column' ) {
        $func = \&column;
    }

    is( $func->( $case->{input} ), $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "extract row from one number matrix",
    "expected": [
      1
    ],
    "input": {
      "index": 1,
      "string": "1"
    },
    "property": "row"
  },
  {
    "description": "can extract row",
    "expected": [
      3,
      4
    ],
    "input": {
      "index": 2,
      "string": "1 2\n3 4"
    },
    "property": "row"
  },
  {
    "description": "extract row where numbers have different widths",
    "expected": [
      10,
      20
    ],
    "input": {
      "index": 2,
      "string": "1 2\n10 20"
    },
    "property": "row"
  },
  {
    "description": "can extract row from non-square matrix with no corresponding column",
    "expected": [
      8,
      7,
      6
    ],
    "input": {
      "index": 4,
      "string": "1 2 3\n4 5 6\n7 8 9\n8 7 6"
    },
    "property": "row"
  },
  {
    "description": "extract column from one number matrix",
    "expected": [
      1
    ],
    "input": {
      "index": 1,
      "string": "1"
    },
    "property": "column"
  },
  {
    "description": "can extract column",
    "expected": [
      3,
      6,
      9
    ],
    "input": {
      "index": 3,
      "string": "1 2 3\n4 5 6\n7 8 9"
    },
    "property": "column"
  },
  {
    "description": "can extract column from non-square matrix with no corresponding row",
    "expected": [
      4,
      8,
      6
    ],
    "input": {
      "index": 4,
      "string": "1 2 3 4\n5 6 7 8\n9 8 7 6"
    },
    "property": "column"
  },
  {
    "description": "extract column where numbers have different widths",
    "expected": [
      1903,
      3,
      4
    ],
    "input": {
      "index": 2,
      "string": "89 1903 3\n18 3 1\n9 4 800"
    },
    "property": "column"
  }
]
