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
    "description": "Adding a student adds them to the sorted roster",
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
    "description": "Adding more students adds them to the sorted roster",
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
    "description": "Adding students to different grades adds them to the same sorted roster",
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
    "description": "Roster returns an empty list if there are no students enrolled",
    "expected": [],
    "input": {
      "students": []
    },
    "property": "roster"
  },
  {
    "description": "Student names with grades are displayed in the same sorted roster",
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
    "description": "Grade returns the students in that grade in alphabetical order",
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
  },
  {
    "description": "Grade returns an empty list if there are no students in that grade",
    "expected": [],
    "input": {
      "desiredGrade": 1,
      "students": []
    },
    "property": "grade"
  }
]
