#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use BinarySearchTree qw<tree treeSort>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<tree treeSort> or bail_out;

subtest data => sub {
  for my $case ( grep { $_->{property} eq 'data' } @test_cases ) {
    is( tree( $case->{input}{treeData} ),
      $case->{expected}, $case->{description}, );
  }
};

subtest sorting => sub {
  for my $case ( grep { $_->{property} eq 'sortedData' } @test_cases )
  {
    is( treeSort( $case->{input}{treeData} ),
      $case->{expected}, $case->{description}, );
  }
};

done_testing;

__DATA__
[
  {
    "description": "data is retained",
    "expected": {
      "data": "4",
      "left": null,
      "right": null
    },
    "input": {
      "treeData": [
        "4"
      ]
    },
    "property": "data"
  },
  {
    "description": "insert data at proper node: smaller number at left node",
    "expected": {
      "data": "4",
      "left": {
        "data": "2",
        "left": null,
        "right": null
      },
      "right": null
    },
    "input": {
      "treeData": [
        "4",
        "2"
      ]
    },
    "property": "data"
  },
  {
    "description": "insert data at proper node: same number at left node",
    "expected": {
      "data": "4",
      "left": {
        "data": "4",
        "left": null,
        "right": null
      },
      "right": null
    },
    "input": {
      "treeData": [
        "4",
        "4"
      ]
    },
    "property": "data"
  },
  {
    "description": "insert data at proper node: greater number at right node",
    "expected": {
      "data": "4",
      "left": null,
      "right": {
        "data": "5",
        "left": null,
        "right": null
      }
    },
    "input": {
      "treeData": [
        "4",
        "5"
      ]
    },
    "property": "data"
  },
  {
    "description": "can create complex tree",
    "expected": {
      "data": "4",
      "left": {
        "data": "2",
        "left": {
          "data": "1",
          "left": null,
          "right": null
        },
        "right": {
          "data": "3",
          "left": null,
          "right": null
        }
      },
      "right": {
        "data": "6",
        "left": {
          "data": "5",
          "left": null,
          "right": null
        },
        "right": {
          "data": "7",
          "left": null,
          "right": null
        }
      }
    },
    "input": {
      "treeData": [
        "4",
        "2",
        "6",
        "1",
        "3",
        "5",
        "7"
      ]
    },
    "property": "data"
  },
  {
    "description": "can sort data: can sort single number",
    "expected": [
      "2"
    ],
    "input": {
      "treeData": [
        "2"
      ]
    },
    "property": "sortedData"
  },
  {
    "description": "can sort data: can sort if second number is smaller than first",
    "expected": [
      "1",
      "2"
    ],
    "input": {
      "treeData": [
        "2",
        "1"
      ]
    },
    "property": "sortedData"
  },
  {
    "description": "can sort data: can sort if second number is same as first",
    "expected": [
      "2",
      "2"
    ],
    "input": {
      "treeData": [
        "2",
        "2"
      ]
    },
    "property": "sortedData"
  },
  {
    "description": "can sort data: can sort if second number is greater than first",
    "expected": [
      "2",
      "3"
    ],
    "input": {
      "treeData": [
        "2",
        "3"
      ]
    },
    "property": "sortedData"
  },
  {
    "description": "can sort data: can sort complex tree",
    "expected": [
      "1",
      "2",
      "3",
      "5",
      "6",
      "7"
    ],
    "input": {
      "treeData": [
        "2",
        "1",
        "3",
        "6",
        "7",
        "5"
      ]
    },
    "property": "sortedData"
  }
]
