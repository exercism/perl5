#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use GradeSchool qw<roster>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 8;

imported_ok qw<roster> or bail_out;

for my $case (@test_cases) {
  is roster( $case->{input}{students}, $case->{input}{desiredGrade} ),
    $case->{expected}, $case->{description};
}

__DATA__
[
  {
    "description": "Roster is empty when no student is added",
    "expected": [],
    "input": {
      "students": []
    },
    "property": "roster"
  },
  {
    "description": "Student is added to the roster",
    "expected": [
      "Aimee"
    ],
    "input": {
      "students": [
        [
          "Aimee",
          2
        ]
      ]
    },
    "property": "roster"
  },
  {
    "description": "Multiple students in the same grade are added to the roster",
    "expected": [
      "Blair",
      "James",
      "Paul"
    ],
    "input": {
      "students": [
        [
          "Blair",
          2
        ],
        [
          "James",
          2
        ],
        [
          "Paul",
          2
        ]
      ]
    },
    "property": "roster"
  },
  {
    "description": "Students in multiple grades are added to the roster",
    "expected": [
      "Chelsea",
      "Logan"
    ],
    "input": {
      "students": [
        [
          "Chelsea",
          3
        ],
        [
          "Logan",
          7
        ]
      ]
    },
    "property": "roster"
  },
  {
    "description": "Students are sorted by grades and then by name in the roster",
    "expected": [
      "Anna",
      "Barb",
      "Charlie",
      "Alex",
      "Peter",
      "Zoe",
      "Jim"
    ],
    "input": {
      "students": [
        [
          "Peter",
          2
        ],
        [
          "Anna",
          1
        ],
        [
          "Barb",
          1
        ],
        [
          "Zoe",
          2
        ],
        [
          "Alex",
          2
        ],
        [
          "Jim",
          3
        ],
        [
          "Charlie",
          1
        ]
      ]
    },
    "property": "roster"
  },
  {
    "description": "Grade is empty if no students in the roster",
    "expected": [],
    "input": {
      "desiredGrade": 1,
      "students": []
    },
    "property": "grade"
  },
  {
    "description": "Students are sorted by name in a grade",
    "expected": [
      "Bradley",
      "Franklin"
    ],
    "input": {
      "desiredGrade": 5,
      "students": [
        [
          "Franklin",
          5
        ],
        [
          "Bradley",
          5
        ],
        [
          "Jeff",
          1
        ]
      ]
    },
    "property": "grade"
  }
]
