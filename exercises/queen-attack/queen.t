#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
use JSON::PP qw(decode_json);
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Queens';

my $cases;
{
  local $/ = undef;
  $cases = decode_json scalar <DATA>;
}

#diag explain $cases;

my $tests = 3;
foreach my $c (@$cases) {
  foreach my $bo ( @{ $c->{boards} } ) {
    $tests += keys(%$bo) - 1;
    $tests++ if not exists $bo->{exception};
  }
}
plan $tests;

ok -e "$Bin/$module.pm", "missing $module.pm"
  or BAIL_OUT(
  "You need to create a class called $module.pm with a constructor called new."
  );

eval "use $module";
ok !$@, "Cannot load $module.pm"
  or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ? ($@)");

can_ok( $module, 'new' )
  or BAIL_OUT("Missing package $module; or missing sub new()");

foreach my $c (@$cases) {
  foreach my $board ( @{ $c->{boards} } ) {
    eval { $board->{res} = $module->new( %{ $board->{params} } ); };
    if ($@) {
      $board->{res} = { exception => $@ };
    }
  }
  foreach my $board ( @{ $c->{boards} } ) {
    if ( $board->{exception} ) {
      like $board->{res}{exception}, qr{^$board->{exception}},
        "$c->{name} exception";
    }
    else {
      ok !$board->{res}{exception}, "$c->{name} no exception" or do {
        diag $board->{res}{exception};
        next;
      };
    }
    if ( $board->{white} ) {
      is_deeply $board->{res}->white, $board->{white},
        "$c->{name} white";
    }
    if ( $board->{black} ) {
      is_deeply $board->{res}->black, $board->{black},
        "$c->{name} black";
    }
    if ( $board->{board} ) {
      my $expected = join( "\n", @{ $board->{board} } ) . "\n";
      is $board->{res}->to_string, $expected, "$c->{name} board";
    }
    if ( exists $board->{attack} ) {
      if ( $board->{attack} ) {
        ok $board->{res}->can_attack, "$c->{name} can attack";
      }
      else {
        ok !$board->{res}->can_attack, "$c->{name} can NOT attack";
      }
    }
  }
}

__DATA__
[
  {
    "boards" : [
      {
        "params" : {},
        "white"  : [0, 3],
        "black"  : [7, 3]
      }
    ],
    "name" : "default_positions"
  },
  {
    "boards" : [
      {
        "params" : { "white" : [3, 7], "black" : [6, 1] },
        "white"  : [3, 7],
        "black"  : [6, 1]
      }
    ],
    "name" : "specific_placement"
  },
  {
    "boards" : [
      {
        "params" : { "white": [3, 7], "black": [6, 1] },
        "white"  : [3, 7],
        "black"  : [6, 1]
      },
      {
        "params" : { "white": [5, 4], "black": [7, 7] },
        "white"  : [5, 4],
        "black"  : [7, 7]
      }
    ],
    "name" : "multiple_boards_simultaneously"
  },
  {
    "boards" : [
      {
        "params"    : { "white": [2, 4], "black": [2, 4] },
        "exception" : "ArgumentError"
      }
    ],
    "name" : "cannot_occupy_same_space"
  },
  {
    "boards" : [
      {
        "params"    : { "white": [2, -4], "black": [1, 3] },
        "exception" : "ArgumentError"
      }
    ],
    "name" : "cannot_have_negative_coordinate"
  },
  {
    "boards" : [
      {
        "params"    : { "white": [2, 4], "black": [1, 8] },
        "exception" : "ArgumentError"
      }
    ],
    "name" : "cannot_be_outside_the_board"
  },
  {
    "boards" : [
      {
        "params" : {"white": [2, 4], "black": [6, 6] },
        "board"  : [
             "O O O O O O O O",
             "O O O O O O O O",
             "O O O O W O O O",
             "O O O O O O O O",
             "O O O O O O O O",
             "O O O O O O O O",
             "O O O O O O B O",
             "O O O O O O O O"
        ]
      }
    ],
    "name" : "string_representation"
  },
  {
    "boards" : [
      {
        "params" : {"white": [7, 1], "black": [0, 0]},
        "board"  : [
            "B O O O O O O O",
            "O O O O O O O O",
            "O O O O O O O O",
            "O O O O O O O O",
            "O O O O O O O O",
            "O O O O O O O O",
            "O O O O O O O O",
            "O W O O O O O O"
        ]
      }
    ],
    "name" : "another_string_representation"
  },
  {
    "boards" : [
      {
        "params" : {"white": [4, 3], "black": [3, 4]},
        "board"  : [
            "O O O O O O O O",
            "O O O O O O O O",
            "O O O O O O O O",
            "O O O O B O O O",
            "O O O W O O O O",
            "O O O O O O O O",
            "O O O O O O O O",
            "O O O O O O O O"
        ]
      }
    ],
    "name" : "yet_another_string_representation"
  },
  {
    "boards" : [
      {
        "params" : {"white": [2, 3], "black": [4, 7]},
        "attack" : false
      }
    ],
    "name" : "cannot_attack"
  },
  {
    "boards" : [
      {
        "params" : {"white": [2, 4], "black": [2, 7]},
        "attack" : true
      }
    ],
    "name" : "can_attack_on_same_row"
  },
  {
    "boards" : [
      {
        "params" : {"white": [5, 4], "black": [2, 4]},
        "attack" : true
      }
    ],
    "name" : "can_attack_on_same_column"
  },
  {
    "boards" : [
      {
        "params" : {"white": [1, 1], "black": [6, 6]},
        "attack" : true
      }
    ],
    "name" : "can_attack_on_diagonal"
  },
  {
    "boards" : [
      {
        "params" : {"white": [0, 6], "black": [1, 7]},
        "attack" : true
      }
    ],
    "name" : "can_attack_on_other_diagonal"
  },
  {
    "boards" : [
      {
        "params" : {"white": [4, 1], "black": [6, 3]},
        "attack" : true
      }
    ],
    "name" : "can_attack_on_yet_another_diagonal"
  },
  {
    "boards" : [
      {
        "params" : {"white": [4, 2], "black": [5, 1]},
        "attack" : true
      }
    ],
    "name" : "can_attack_on_orthogonal_diagonal"
  }
]

