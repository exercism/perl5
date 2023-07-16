#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Robot ();

my $robot;

$robot = Robot->new( x => 0, y => 0, direction => "north" )->enact("R");    # begin: 8cbd0086-6392-4680-b9b9-73cf491e67e5
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "east";
    },
    "Rotating clockwise: changes north to east",
);                                                                          # end: 8cbd0086-6392-4680-b9b9-73cf491e67e5

$robot = Robot->new( x => 0, y => 0, direction => "east" )->enact("R");     # begin: 8abc87fc-eab2-4276-93b7-9c009e866ba1
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "south";
    },
    "Rotating clockwise: changes east to south",
);                                                                          # end: 8abc87fc-eab2-4276-93b7-9c009e866ba1

$robot = Robot->new( x => 0, y => 0, direction => "south" )->enact("R");    # begin: 3cfe1b85-bbf2-4bae-b54d-d73e7e93617a
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "west";
    },
    "Rotating clockwise: changes south to west",
);                                                                          # end: 3cfe1b85-bbf2-4bae-b54d-d73e7e93617a

$robot = Robot->new( x => 0, y => 0, direction => "west" )->enact("R");     # begin: 5ea9fb99-3f2c-47bd-86f7-46b7d8c3c716
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "north";
    },
    "Rotating clockwise: changes west to north",
);                                                                          # end: 5ea9fb99-3f2c-47bd-86f7-46b7d8c3c716

$robot = Robot->new( x => 0, y => 0, direction => "north" )->enact("L");    # begin: fa0c40f5-6ba3-443d-a4b3-58cbd6cb8d63
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "west";
    },
    "Rotating counter-clockwise: changes north to west",
);                                                                          # end: fa0c40f5-6ba3-443d-a4b3-58cbd6cb8d63

$robot = Robot->new( x => 0, y => 0, direction => "west" )->enact("L");     # begin: da33d734-831f-445c-9907-d66d7d2a92e2
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "south";
    },
    "Rotating counter-clockwise: changes west to south",
);                                                                          # end: da33d734-831f-445c-9907-d66d7d2a92e2

$robot = Robot->new( x => 0, y => 0, direction => "south" )->enact("L");    # begin: bd1ca4b9-4548-45f4-b32e-900fc7c19389
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "east";
    },
    "Rotating counter-clockwise: changes south to east",
);                                                                          # end: bd1ca4b9-4548-45f4-b32e-900fc7c19389

$robot = Robot->new( x => 0, y => 0, direction => "east" )->enact("L");     # begin: 2de27b67-a25c-4b59-9883-bc03b1b55bba
is(
    $robot,
    object {
        call x         => 0;
        call y         => 0;
        call direction => "north";
    },
    "Rotating counter-clockwise: changes east to north",
);                                                                          # end: 2de27b67-a25c-4b59-9883-bc03b1b55bba

$robot = Robot->new( x => 0, y => 0, direction => "north" )->enact("A");    # begin: f0dc2388-cddc-4f83-9bed-bcf46b8fc7b8
is(
    $robot,
    object {
        call x         => 0;
        call y         => 1;
        call direction => "north";
    },
    "Moving forward one: facing north increments Y",
);                                                                          # end: f0dc2388-cddc-4f83-9bed-bcf46b8fc7b8

$robot = Robot->new( x => 0, y => 0, direction => "south" )->enact("A");    # begin: 2786cf80-5bbf-44b0-9503-a89a9c5789da
is(
    $robot,
    object {
        call x         => 0;
        call y         => -1;
        call direction => "south";
    },
    "Moving forward one: facing south decrements Y",
);                                                                          # end: 2786cf80-5bbf-44b0-9503-a89a9c5789da

$robot = Robot->new( x => 0, y => 0, direction => "east" )->enact("A");     # begin: 84bf3c8c-241f-434d-883d-69817dbd6a48
is(
    $robot,
    object {
        call x         => 1;
        call y         => 0;
        call direction => "east";
    },
    "Moving forward one: facing east increments X",
);                                                                          # end: 84bf3c8c-241f-434d-883d-69817dbd6a48

$robot = Robot->new( x => 0, y => 0, direction => "west" )->enact("A");     # begin: bb69c4a7-3bbf-4f64-b415-666fa72d7b04
is(
    $robot,
    object {
        call x         => -1;
        call y         => 0;
        call direction => "west";
    },
    "Moving forward one: facing west decrements X",
);                                                                          # end: bb69c4a7-3bbf-4f64-b415-666fa72d7b04

$robot
    = Robot->new( x => 7, y => 3, direction => "north" )->enact("RAALAL");   # begin: e34ac672-4ed4-4be3-a0b8-d9af259cbaa1
is(
    $robot,
    object {
        call x         => 9;
        call y         => 4;
        call direction => "west";
    },
    "Follow series of instructions: moving east and north from README",
);                                                                           # end: e34ac672-4ed4-4be3-a0b8-d9af259cbaa1

$robot
    = Robot->new( x => 0, y => 0, direction => "north" )->enact("LAAARALA"); # begin: f30e4955-4b47-4aa3-8b39-ae98cfbd515b
is(
    $robot,
    object {
        call x         => -4;
        call y         => 1;
        call direction => "west";
    },
    "Follow series of instructions: moving west and north",
);                                                                           # end: f30e4955-4b47-4aa3-8b39-ae98cfbd515b

$robot
    = Robot->new( x => 2, y => -7, direction => "east" )->enact("RRAAAAALA")
    ;                                                                        # begin: 3e466bf6-20ab-4d79-8b51-264165182fca
is(
    $robot,
    object {
        call x         => -3;
        call y         => -8;
        call direction => "south";
    },
    "Follow series of instructions: moving west and south",
);                                                                           # end: 3e466bf6-20ab-4d79-8b51-264165182fca

$robot = Robot->new( x => 8, y => 4, direction => "south" )
    ->enact("LAAARRRALLLL");                                                 # begin: 41f0bb96-c617-4e6b-acff-a4b279d44514
is(
    $robot,
    object {
        call x         => 11;
        call y         => 5;
        call direction => "north";
    },
    "Follow series of instructions: moving east and north",
);                                                                           # end: 41f0bb96-c617-4e6b-acff-a4b279d44514

done_testing;
