#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Series qw<slices>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<slices> or bail_out;

for my $case (@test_cases) {
    if ( ref $case->{expected} ne 'HASH' ) {
        is(
            slices( $case->{input} ),
            $case->{expected},
            $case->{description},
        );
    }
    else {
        like dies( sub { slices( $case->{input} ) } ),
            qr/$case->{expected}{error}/, $case->{description};
    }
}

done_testing;

__DATA__
[
  {
    "description": "slices of one from one",
    "expected": [
      "1"
    ],
    "input": {
      "series": "1",
      "sliceLength": 1
    },
    "property": "slices"
  },
  {
    "description": "slices of one from two",
    "expected": [
      "1",
      "2"
    ],
    "input": {
      "series": "12",
      "sliceLength": 1
    },
    "property": "slices"
  },
  {
    "description": "slices of two",
    "expected": [
      "35"
    ],
    "input": {
      "series": "35",
      "sliceLength": 2
    },
    "property": "slices"
  },
  {
    "description": "slices of two overlap",
    "expected": [
      "91",
      "14",
      "42"
    ],
    "input": {
      "series": "9142",
      "sliceLength": 2
    },
    "property": "slices"
  },
  {
    "description": "slices can include duplicates",
    "expected": [
      "777",
      "777",
      "777",
      "777"
    ],
    "input": {
      "series": "777777",
      "sliceLength": 3
    },
    "property": "slices"
  },
  {
    "description": "slices of a long series",
    "expected": [
      "91849",
      "18493",
      "84939",
      "49390",
      "93904",
      "39042",
      "90424",
      "04243"
    ],
    "input": {
      "series": "918493904243",
      "sliceLength": 5
    },
    "property": "slices"
  },
  {
    "description": "slice length is too large",
    "expected": {
      "error": "slice length cannot be greater than series length"
    },
    "input": {
      "series": "12345",
      "sliceLength": 6
    },
    "property": "slices"
  },
  {
    "description": "slice length cannot be zero",
    "expected": {
      "error": "slice length cannot be zero"
    },
    "input": {
      "series": "12345",
      "sliceLength": 0
    },
    "property": "slices"
  },
  {
    "description": "slice length cannot be negative",
    "expected": {
      "error": "slice length cannot be negative"
    },
    "input": {
      "series": "123",
      "sliceLength": -1
    },
    "property": "slices"
  },
  {
    "description": "empty series is invalid",
    "expected": {
      "error": "series cannot be empty"
    },
    "input": {
      "series": "",
      "sliceLength": 1
    },
    "property": "slices"
  }
]
