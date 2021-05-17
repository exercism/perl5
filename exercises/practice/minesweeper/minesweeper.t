#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Minesweeper qw<annotate>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<annotate> or bail_out;

for my $case (@test_cases) {
  is( annotate( $case->{input}{minefield} ),
    $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "no rows",
    "expected": [],
    "input": {
      "minefield": []
    },
    "property": "annotate"
  },
  {
    "description": "no columns",
    "expected": [
      ""
    ],
    "input": {
      "minefield": [
        ""
      ]
    },
    "property": "annotate"
  },
  {
    "description": "no mines",
    "expected": [
      "   ",
      "   ",
      "   "
    ],
    "input": {
      "minefield": [
        "   ",
        "   ",
        "   "
      ]
    },
    "property": "annotate"
  },
  {
    "description": "minefield with only mines",
    "expected": [
      "***",
      "***",
      "***"
    ],
    "input": {
      "minefield": [
        "***",
        "***",
        "***"
      ]
    },
    "property": "annotate"
  },
  {
    "description": "mine surrounded by spaces",
    "expected": [
      "111",
      "1*1",
      "111"
    ],
    "input": {
      "minefield": [
        "   ",
        " * ",
        "   "
      ]
    },
    "property": "annotate"
  },
  {
    "description": "space surrounded by mines",
    "expected": [
      "***",
      "*8*",
      "***"
    ],
    "input": {
      "minefield": [
        "***",
        "* *",
        "***"
      ]
    },
    "property": "annotate"
  },
  {
    "description": "horizontal line",
    "expected": [
      "1*2*1"
    ],
    "input": {
      "minefield": [
        " * * "
      ]
    },
    "property": "annotate"
  },
  {
    "description": "horizontal line, mines at edges",
    "expected": [
      "*1 1*"
    ],
    "input": {
      "minefield": [
        "*   *"
      ]
    },
    "property": "annotate"
  },
  {
    "description": "vertical line",
    "expected": [
      "1",
      "*",
      "2",
      "*",
      "1"
    ],
    "input": {
      "minefield": [
        " ",
        "*",
        " ",
        "*",
        " "
      ]
    },
    "property": "annotate"
  },
  {
    "description": "vertical line, mines at edges",
    "expected": [
      "*",
      "1",
      " ",
      "1",
      "*"
    ],
    "input": {
      "minefield": [
        "*",
        " ",
        " ",
        " ",
        "*"
      ]
    },
    "property": "annotate"
  },
  {
    "description": "cross",
    "expected": [
      " 2*2 ",
      "25*52",
      "*****",
      "25*52",
      " 2*2 "
    ],
    "input": {
      "minefield": [
        "  *  ",
        "  *  ",
        "*****",
        "  *  ",
        "  *  "
      ]
    },
    "property": "annotate"
  },
  {
    "description": "large minefield",
    "expected": [
      "1*22*1",
      "12*322",
      " 123*2",
      "112*4*",
      "1*22*2",
      "111111"
    ],
    "input": {
      "minefield": [
        " *  * ",
        "  *   ",
        "    * ",
        "   * *",
        " *  * ",
        "      "
      ]
    },
    "property": "annotate"
  }
]
