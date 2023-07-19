#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Robot ();

my $robot;

$robot = Robot->new( x => 0, y => 0, direction => "north" )->enact("R");
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "east";
    },
    "Rotating clockwise: changes north to east",
);

$robot = Robot->new( x => 0, y => 0, direction => "east" )->enact("R");
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "south";
    },
    "Rotating clockwise: changes east to south",
);

$robot = Robot->new( x => 0, y => 0, direction => "south" )->enact("R");
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "west";
    },
    "Rotating clockwise: changes south to west",
);

$robot = Robot->new( x => 0, y => 0, direction => "west" )->enact("R");
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "north";
    },
    "Rotating clockwise: changes west to north",
);

$robot = Robot->new( x => 0, y => 0, direction => "north" )->enact("L");
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "west";
    },
    "Rotating counter-clockwise: changes north to west",
);

$robot = Robot->new( x => 0, y => 0, direction => "west" )->enact("L");
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "south";
    },
    "Rotating counter-clockwise: changes west to south",
);

$robot = Robot->new( x => 0, y => 0, direction => "south" )->enact("L");
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "east";
    },
    "Rotating counter-clockwise: changes south to east",
);

$robot = Robot->new( x => 0, y => 0, direction => "east" )->enact("L");
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "north";
    },
    "Rotating counter-clockwise: changes east to north",
);

$robot = Robot->new( x => 0, y => 0, direction => "north" )->enact("A");
is(
    $robot,
    object {
        call x         => 0;
        call y         => 1;
        call direction => "north";
    },
    "Moving forward one: facing north increments Y",
);

$robot = Robot->new( x => 0, y => 0, direction => "south" )->enact("A");
is(
    $robot,
    object {
        call x         => 0;
        call y         => -1;
        call direction => "south";
    },
    "Moving forward one: facing south decrements Y",
);

$robot = Robot->new( x => 0, y => 0, direction => "east" )->enact("A");
is(
    $robot,
    object {
        call x         => 1;
        call y         => 0;
        call direction => "east";
    },
    "Moving forward one: facing east increments X",
);

$robot = Robot->new( x => 0, y => 0, direction => "west" )->enact("A");
is(
    $robot,
    object {
        call x         => -1;
        call y         => 0;
        call direction => "west";
    },
    "Moving forward one: facing west decrements X",
);

$robot = Robot->new( x => 7, y => 3, direction => "north" )->enact("RAALAL");
is(
    $robot,
    object {
        call x         => 9;
        call y         => 4;
        call direction => "west";
    },
    "Follow series of instructions: moving east and north from README",
);

$robot = Robot->new( x => 0, y => 0, direction => "north" )->enact("LAAARALA");
is(
    $robot,
    object {
        call x         => -4;
        call y         => 1;
        call direction => "west";
    },
    "Follow series of instructions: moving west and north",
);

$robot = Robot->new( x => 2, y => -7, direction => "east" )->enact("RRAAAAALA");
is(
    $robot,
    object {
        call x         => -3;
        call y         => -8;
        call direction => "south";
    },
    "Follow series of instructions: moving west and south",
);

$robot = Robot->new( x => 8, y => 4, direction => "south" )->enact("LAAARRRALLLL");
is(
    $robot,
    object {
        call x         => 11;
        call y         => 5;
        call direction => "north";
    },
    "Follow series of instructions: moving east and north",
);

done_testing;
