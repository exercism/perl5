#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Strain qw<keep discard>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

my ( $input, $expected, $function );

$input    = [];
$expected = [];
$function = sub { my $x = shift; $x % 2 == 0 };
is( keep( $input, $function ), $expected, "empty list" );

$input    = [ 2, 4, 6, 8, 10 ];
$expected = [];
$function = sub { my $x = shift; $x % 2 == 1 };
is( keep( $input, $function ),
    $expected, "keep odd numbers. empty result " );

$input    = [ 2, 4, 6, 8, 10 ];
$expected = [];
$function = sub { my $x = shift; $x % 2 == 0 };
is( discard( $input, $function ),
    $expected, "discard even numbers. empty result" );

$input    = [ 2, 4, 6, 8, 10 ];
$expected = [ 2, 4, 6, 8, 10 ];
$function = sub { my $x = shift; $x % 2 == 0 };
is( keep( $input, $function ),
    $expected, "keep even numbers. result == input" );

$input    = [qw(dough cash plough though through enough)];
$expected = ['cash'];
$function = sub { my $x = shift; $x =~ m/ough$/ };
is( discard( $input, $function ),
    $expected, "discard input endswith 'ough'" );

$input    = [qw(zebra arizona apple google mozilla)];
$expected = [qw(zebra arizona mozilla)];
$function = sub { my $x = shift; $x =~ /z/ };
is( keep( $input, $function ),
    $expected, "keep input with 'z'" );

$input    = [ '1,2,3', 'one', 'almost!', 'love' ];
$expected = [];
$function = sub { my $x = shift; $x =~ /\p{IsAlpha}/ };
is( discard( keep( $input, $function ) // [], $function ),
    $expected, "keep then discard" );

$input    = [ '1,2,3', 'one', 'almost!', 'love' ];
$expected = [ '1,2,3', 'one', 'almost!', 'love' ];
$function = sub { my $x = shift; $x =~ /\p{Alpha}/ };
my $combined = [
    @{ keep( $input, $function )    // [] },
    @{ discard( $input, $function ) // [] }
];
is(
    [ sort @$combined ],
    [ sort @$expected ],
    "combine keep and discard results. keep + discard"
);

done_testing;

__DATA__
[
  {
    "description": "keep on empty list returns empty list",
    "expected": [],
    "input": {
      "list": [],
      "predicate": "fn(x) -> true"
    },
    "property": "keep",
    "uuid": "26af8c32-ba6a-4eb3-aa0a-ebd8f136e003"
  },
  {
    "description": "keeps everything",
    "expected": [
      1,
      3,
      5
    ],
    "input": {
      "list": [
        1,
        3,
        5
      ],
      "predicate": "fn(x) -> true"
    },
    "property": "keep",
    "uuid": "f535cb4d-e99b-472a-bd52-9fa0ffccf454"
  },
  {
    "description": "keeps nothing",
    "expected": [],
    "input": {
      "list": [
        1,
        3,
        5
      ],
      "predicate": "fn(x) -> false"
    },
    "property": "keep",
    "uuid": "950b8e8e-f628-42a8-85e2-9b30f09cde38"
  },
  {
    "description": "keeps first and last",
    "expected": [
      1,
      3
    ],
    "input": {
      "list": [
        1,
        2,
        3
      ],
      "predicate": "fn(x) -> x % 2 == 1"
    },
    "property": "keep",
    "uuid": "92694259-6e76-470c-af87-156bdf75018a"
  },
  {
    "description": "keeps neither first nor last",
    "expected": [
      2
    ],
    "input": {
      "list": [
        1,
        2,
        3
      ],
      "predicate": "fn(x) -> x % 2 == 0"
    },
    "property": "keep",
    "uuid": "938f7867-bfc7-449e-a21b-7b00cbb56994"
  },
  {
    "description": "keeps strings",
    "expected": [
      "zebra",
      "zombies",
      "zealot"
    ],
    "input": {
      "list": [
        "apple",
        "zebra",
        "banana",
        "zombies",
        "cherimoya",
        "zealot"
      ],
      "predicate": "fn(x) -> starts_with(x, 'z')"
    },
    "property": "keep",
    "uuid": "8908e351-4437-4d2b-a0f7-770811e48816"
  },
  {
    "description": "keeps lists",
    "expected": [
      [
        5,
        5,
        5
      ],
      [
        5,
        1,
        2
      ],
      [
        1,
        5,
        2
      ],
      [
        1,
        2,
        5
      ]
    ],
    "input": {
      "list": [
        [
          1,
          2,
          3
        ],
        [
          5,
          5,
          5
        ],
        [
          5,
          1,
          2
        ],
        [
          2,
          1,
          2
        ],
        [
          1,
          5,
          2
        ],
        [
          2,
          2,
          1
        ],
        [
          1,
          2,
          5
        ]
      ],
      "predicate": "fn(x) -> contains(x, 5)"
    },
    "property": "keep",
    "uuid": "2728036b-102a-4f1e-a3ef-eac6160d876a"
  },
  {
    "description": "discard on empty list returns empty list",
    "expected": [],
    "input": {
      "list": [],
      "predicate": "fn(x) -> true"
    },
    "property": "discard",
    "uuid": "ef16beb9-8d84-451a-996a-14e80607fce6"
  },
  {
    "description": "discards everything",
    "expected": [],
    "input": {
      "list": [
        1,
        3,
        5
      ],
      "predicate": "fn(x) -> true"
    },
    "property": "discard",
    "uuid": "2f42f9bc-8e06-4afe-a222-051b5d8cd12a"
  },
  {
    "description": "discards nothing",
    "expected": [
      1,
      3,
      5
    ],
    "input": {
      "list": [
        1,
        3,
        5
      ],
      "predicate": "fn(x) -> false"
    },
    "property": "discard",
    "uuid": "ca990fdd-08c2-4f95-aa50-e0f5e1d6802b"
  },
  {
    "description": "discards first and last",
    "expected": [
      2
    ],
    "input": {
      "list": [
        1,
        2,
        3
      ],
      "predicate": "fn(x) -> x % 2 == 1"
    },
    "property": "discard",
    "uuid": "71595dae-d283-48ca-a52b-45fa96819d2f"
  },
  {
    "description": "discards neither first nor last",
    "expected": [
      1,
      3
    ],
    "input": {
      "list": [
        1,
        2,
        3
      ],
      "predicate": "fn(x) -> x % 2 == 0"
    },
    "property": "discard",
    "uuid": "ae141f79-f86d-4567-b407-919eaca0f3dd"
  },
  {
    "description": "discards strings",
    "expected": [
      "apple",
      "banana",
      "cherimoya"
    ],
    "input": {
      "list": [
        "apple",
        "zebra",
        "banana",
        "zombies",
        "cherimoya",
        "zealot"
      ],
      "predicate": "fn(x) -> starts_with(x, 'z')"
    },
    "property": "discard",
    "uuid": "daf25b36-a59f-4f29-bcfe-302eb4e43609"
  },
  {
    "description": "discards lists",
    "expected": [
      [
        1,
        2,
        3
      ],
      [
        2,
        1,
        2
      ],
      [
        2,
        2,
        1
      ]
    ],
    "input": {
      "list": [
        [
          1,
          2,
          3
        ],
        [
          5,
          5,
          5
        ],
        [
          5,
          1,
          2
        ],
        [
          2,
          1,
          2
        ],
        [
          1,
          5,
          2
        ],
        [
          2,
          2,
          1
        ],
        [
          1,
          2,
          5
        ]
      ],
      "predicate": "fn(x) -> contains(x, 5)"
    },
    "property": "discard",
    "uuid": "a38d03f9-95ad-4459-80d1-48e937e4acaf"
  }
]
