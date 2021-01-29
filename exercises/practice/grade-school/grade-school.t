#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use GradeSchool qw(roster);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 8;

imported_ok qw(roster) or bail_out;

for my $case ( @{ $C_DATA->{cases} } ) {
  is roster( $case->{input}{students}, $case->{input}{desiredGrade} ),
    $case->{expected}, $case->{description};
}

__DATA__
{
    "exercise": "grade-school",
    "version": "1.0.0",
    "comments": [
        "Given students' names along with the grade that they are in, ",
        "create a roster for the school."
    ],
    "cases": [
        {
            "description": "Adding a student adds them to the sorted roster",
            "property": "roster",
            "input": {
              "students": [["Aimee", 2]]
            },
            "expected": ["Aimee"]
        },
        {
            "description": "Adding more student adds them to the sorted roster",
            "property": "roster",
            "input": {
              "students": [["Blair", 2], ["James", 2], ["Paul", 2]]
            },
            "expected": ["Blair", "James", "Paul"]
        },
        {
            "description": "Adding students to different grades adds them to the same sorted roster",
            "property": "roster",
            "input": {
              "students": [["Chelsea", 3], ["Logan", 7]]
            },
            "expected": ["Chelsea", "Logan"]
        },
        {
            "description": "Roster returns an empty list if there are no students enrolled",
            "property": "roster",
            "input": {
              "students": []
            },
            "expected": []
        },
        {
            "description": "Student names with grades are displayed in the same sorted roster",
            "property": "roster",
            "input": {
              "students": [["Peter", 2], ["Anna", 1], ["Barb", 1], ["Zoe", 2], ["Alex", 2], ["Jim", 3], ["Charlie", 1]]
            },
            "expected": ["Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim"]
        },
        {
            "description": "Grade returns the students in that grade in alphabetical order",
            "property": "grade",
            "input": {
              "students": [["Franklin", 5], ["Bradley", 5], ["Jeff", 1]],
              "desiredGrade": 5
            },
            "expected": ["Bradley", "Franklin"]
        },
        {
            "description": "Grade returns an empty list if there are no students in that grade",
            "property": "grade",
            "input": {
              "students": [],
              "desiredGrade": 1
            },
            "expected": []
        }
    ]
}
