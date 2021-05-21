#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use OCRNumbers qw<convert>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<convert> or bail_out;

for my $case (@test_cases) {
  if ( !ref $case->{expected} ) {
    is( convert( $case->{input}{rows} ),
      $case->{expected}, $case->{description}, );
  }
  else {
    like dies( sub { convert( $case->{input}{rows} ) } ),
      qr/$case->{expected}{error}/, $case->{description};
  }
}

done_testing;

__DATA__
[
  {
    "description": "Recognizes 0",
    "expected": "0",
    "input": {
      "rows": [
        " _ ",
        "| |",
        "|_|",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Recognizes 1",
    "expected": "1",
    "input": {
      "rows": [
        "   ",
        "  |",
        "  |",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Unreadable but correctly sized inputs return ?",
    "expected": "?",
    "input": {
      "rows": [
        "   ",
        "  _",
        "  |",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Input with a number of lines that is not a multiple of four raises an error",
    "expected": {
      "error": "Number of input lines is not a multiple of four"
    },
    "input": {
      "rows": [
        " _ ",
        "| |",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Input with a number of columns that is not a multiple of three raises an error",
    "expected": {
      "error": "Number of input columns is not a multiple of three"
    },
    "input": {
      "rows": [
        "    ",
        "   |",
        "   |",
        "    "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Recognizes 110101100",
    "expected": "110101100",
    "input": {
      "rows": [
        "       _     _        _  _ ",
        "  |  || |  || |  |  || || |",
        "  |  ||_|  ||_|  |  ||_||_|",
        "                           "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Garbled numbers in a string are replaced with ?",
    "expected": "11?10?1?0",
    "input": {
      "rows": [
        "       _     _           _ ",
        "  |  || |  || |     || || |",
        "  |  | _|  ||_|  |  ||_||_|",
        "                           "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Recognizes 2",
    "expected": "2",
    "input": {
      "rows": [
        " _ ",
        " _|",
        "|_ ",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Recognizes 3",
    "expected": "3",
    "input": {
      "rows": [
        " _ ",
        " _|",
        " _|",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Recognizes 4",
    "expected": "4",
    "input": {
      "rows": [
        "   ",
        "|_|",
        "  |",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Recognizes 5",
    "expected": "5",
    "input": {
      "rows": [
        " _ ",
        "|_ ",
        " _|",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Recognizes 6",
    "expected": "6",
    "input": {
      "rows": [
        " _ ",
        "|_ ",
        "|_|",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Recognizes 7",
    "expected": "7",
    "input": {
      "rows": [
        " _ ",
        "  |",
        "  |",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Recognizes 8",
    "expected": "8",
    "input": {
      "rows": [
        " _ ",
        "|_|",
        "|_|",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Recognizes 9",
    "expected": "9",
    "input": {
      "rows": [
        " _ ",
        "|_|",
        " _|",
        "   "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Recognizes string of decimal numbers",
    "expected": "1234567890",
    "input": {
      "rows": [
        "    _  _     _  _  _  _  _  _ ",
        "  | _| _||_||_ |_   ||_||_|| |",
        "  ||_  _|  | _||_|  ||_| _||_|",
        "                              "
      ]
    },
    "property": "convert"
  },
  {
    "description": "Numbers separated by empty lines are recognized. Lines are joined by commas.",
    "expected": "123,456,789",
    "input": {
      "rows": [
        "    _  _ ",
        "  | _| _|",
        "  ||_  _|",
        "         ",
        "    _  _ ",
        "|_||_ |_ ",
        "  | _||_|",
        "         ",
        " _  _  _ ",
        "  ||_||_|",
        "  ||_| _|",
        "         "
      ]
    },
    "property": "convert"
  }
]
