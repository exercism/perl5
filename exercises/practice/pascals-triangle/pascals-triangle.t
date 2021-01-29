#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use PascalsTriangle qw(pascal_rows);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 9;

imported_ok qw(pascal_rows) or bail_out;

for my $case ( map @{ $_->{cases} }, @{ $C_DATA->{cases} } ) {
  is pascal_rows( $case->{input}{count} ),
    join( "\n", map { join ' ', @$_ } @{ $case->{expected} } ),
    $case->{description};
}

__DATA__
{
  "exercise": "pascals-triangle",
  "version": "1.5.0",
  "comments": [
    "Expectations are represented here as an array of arrays.",
    "How you represent this idiomatically in your language is up to you."
  ],
  "cases": [
    {
      "description": "Given a count, return a collection of that many rows of pascal's triangle",
      "cases": [
        {
          "description": "zero rows",
          "property": "rows",
          "input": {
            "count": 0
          },
          "expected": []
        },
        {
          "description": "single row",
          "property": "rows",
          "input": {
            "count": 1
          },
          "expected": [[1]]
        },
        {
          "description": "two rows",
          "property": "rows",
          "input": {
            "count": 2
          },
          "expected": [[1], [1, 1]]
        },
        {
          "description": "three rows",
          "property": "rows",
          "input": {
            "count": 3
          },
          "expected": [[1], [1, 1], [1, 2, 1]]
        },
        {
          "description": "four rows",
          "property": "rows",
          "input": {
            "count": 4
          },
          "expected": [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
        },
        {
          "description": "five rows",
          "property": "rows",
          "input": {
            "count": 5
          },
          "expected": [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
        },
        {
          "description": "six rows",
          "property": "rows",
          "input": {
            "count": 6
          },
          "expected": [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]]
        },
        {
          "description": "ten rows",
          "property": "rows",
          "input": {
            "count": 10
          },
          "expected": [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1], [1, 6, 15, 20, 15, 6, 1], [1, 7, 21, 35, 35, 21, 7, 1], [1, 8, 28, 56, 70, 56, 28, 8, 1], [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]]
        }
      ]
    }
  ]
}
