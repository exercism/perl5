#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Sublist qw<compare_lists>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<compare_lists> or bail_out;

for my $case (@test_cases) {
  is( compare_lists( $case->{input} ),
    $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "empty lists",
    "expected": "equal",
    "input": {
      "listOne": [],
      "listTwo": []
    },
    "property": "sublist"
  },
  {
    "description": "empty list within non empty list",
    "expected": "sublist",
    "input": {
      "listOne": [],
      "listTwo": [
        1,
        2,
        3
      ]
    },
    "property": "sublist"
  },
  {
    "description": "non empty list contains empty list",
    "expected": "superlist",
    "input": {
      "listOne": [
        1,
        2,
        3
      ],
      "listTwo": []
    },
    "property": "sublist"
  },
  {
    "description": "list equals itself",
    "expected": "equal",
    "input": {
      "listOne": [
        1,
        2,
        3
      ],
      "listTwo": [
        1,
        2,
        3
      ]
    },
    "property": "sublist"
  },
  {
    "description": "different lists",
    "expected": "unequal",
    "input": {
      "listOne": [
        1,
        2,
        3
      ],
      "listTwo": [
        2,
        3,
        4
      ]
    },
    "property": "sublist"
  },
  {
    "description": "false start",
    "expected": "sublist",
    "input": {
      "listOne": [
        1,
        2,
        5
      ],
      "listTwo": [
        0,
        1,
        2,
        3,
        1,
        2,
        5,
        6
      ]
    },
    "property": "sublist"
  },
  {
    "description": "consecutive",
    "expected": "sublist",
    "input": {
      "listOne": [
        1,
        1,
        2
      ],
      "listTwo": [
        0,
        1,
        1,
        1,
        2,
        1,
        2
      ]
    },
    "property": "sublist"
  },
  {
    "description": "sublist at start",
    "expected": "sublist",
    "input": {
      "listOne": [
        0,
        1,
        2
      ],
      "listTwo": [
        0,
        1,
        2,
        3,
        4,
        5
      ]
    },
    "property": "sublist"
  },
  {
    "description": "sublist in middle",
    "expected": "sublist",
    "input": {
      "listOne": [
        2,
        3,
        4
      ],
      "listTwo": [
        0,
        1,
        2,
        3,
        4,
        5
      ]
    },
    "property": "sublist"
  },
  {
    "description": "sublist at end",
    "expected": "sublist",
    "input": {
      "listOne": [
        3,
        4,
        5
      ],
      "listTwo": [
        0,
        1,
        2,
        3,
        4,
        5
      ]
    },
    "property": "sublist"
  },
  {
    "description": "at start of superlist",
    "expected": "superlist",
    "input": {
      "listOne": [
        0,
        1,
        2,
        3,
        4,
        5
      ],
      "listTwo": [
        0,
        1,
        2
      ]
    },
    "property": "sublist"
  },
  {
    "description": "in middle of superlist",
    "expected": "superlist",
    "input": {
      "listOne": [
        0,
        1,
        2,
        3,
        4,
        5
      ],
      "listTwo": [
        2,
        3
      ]
    },
    "property": "sublist"
  },
  {
    "description": "at end of superlist",
    "expected": "superlist",
    "input": {
      "listOne": [
        0,
        1,
        2,
        3,
        4,
        5
      ],
      "listTwo": [
        3,
        4,
        5
      ]
    },
    "property": "sublist"
  },
  {
    "description": "first list missing element from second list",
    "expected": "unequal",
    "input": {
      "listOne": [
        1,
        3
      ],
      "listTwo": [
        1,
        2,
        3
      ]
    },
    "property": "sublist"
  },
  {
    "description": "second list missing element from first list",
    "expected": "unequal",
    "input": {
      "listOne": [
        1,
        2,
        3
      ],
      "listTwo": [
        1,
        3
      ]
    },
    "property": "sublist"
  },
  {
    "description": "order matters to a list",
    "expected": "unequal",
    "input": {
      "listOne": [
        1,
        2,
        3
      ],
      "listTwo": [
        3,
        2,
        1
      ]
    },
    "property": "sublist"
  },
  {
    "description": "same digits but different numbers",
    "expected": "unequal",
    "input": {
      "listOne": [
        1,
        0,
        1
      ],
      "listTwo": [
        10,
        1
      ]
    },
    "property": "sublist"
  }
]
