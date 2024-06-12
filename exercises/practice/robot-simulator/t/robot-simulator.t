#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Robot ();

subtest "Rotating clockwise: changes north to east" => sub { # begin: 8cbd0086-6392-4680-b9b9-73cf491e67e5
    my $robot = Robot->new( x => 0, y => 0, direction => "north" )->enact("R");
    is( $robot->x,         0,      "x" );
    is( $robot->y,         0,      "y" );
    is( $robot->direction, "east", "direction" );
}; # end: 8cbd0086-6392-4680-b9b9-73cf491e67e5

subtest "Rotating clockwise: changes east to south" => sub { # begin: 8abc87fc-eab2-4276-93b7-9c009e866ba1
    my $robot = Robot->new( x => 0, y => 0, direction => "east" )->enact("R");
    is( $robot->x,         0,       "x" );
    is( $robot->y,         0,       "y" );
    is( $robot->direction, "south", "direction" );
}; # end: 8abc87fc-eab2-4276-93b7-9c009e866ba1

subtest "Rotating clockwise: changes south to west" => sub { # begin: 3cfe1b85-bbf2-4bae-b54d-d73e7e93617a
    my $robot = Robot->new( x => 0, y => 0, direction => "south" )->enact("R");
    is( $robot->x,         0,      "x" );
    is( $robot->y,         0,      "y" );
    is( $robot->direction, "west", "direction" );
}; # end: 3cfe1b85-bbf2-4bae-b54d-d73e7e93617a

subtest "Rotating clockwise: changes west to north" => sub { # begin: 5ea9fb99-3f2c-47bd-86f7-46b7d8c3c716
    my $robot = Robot->new( x => 0, y => 0, direction => "west" )->enact("R");
    is( $robot->x,         0,       "x" );
    is( $robot->y,         0,       "y" );
    is( $robot->direction, "north", "direction" );
}; # end: 5ea9fb99-3f2c-47bd-86f7-46b7d8c3c716

subtest "Rotating counter-clockwise: changes north to west" => sub { # begin: fa0c40f5-6ba3-443d-a4b3-58cbd6cb8d63
    my $robot = Robot->new( x => 0, y => 0, direction => "north" )->enact("L");
    is( $robot->x,         0,      "x" );
    is( $robot->y,         0,      "y" );
    is( $robot->direction, "west", "direction" );
}; # end: fa0c40f5-6ba3-443d-a4b3-58cbd6cb8d63

subtest "Rotating counter-clockwise: changes west to south" => sub { # begin: da33d734-831f-445c-9907-d66d7d2a92e2
    my $robot = Robot->new( x => 0, y => 0, direction => "west" )->enact("L");
    is( $robot->x,         0,       "x" );
    is( $robot->y,         0,       "y" );
    is( $robot->direction, "south", "direction" );
}; # end: da33d734-831f-445c-9907-d66d7d2a92e2

subtest "Rotating counter-clockwise: changes south to east" => sub { # begin: bd1ca4b9-4548-45f4-b32e-900fc7c19389
    my $robot = Robot->new( x => 0, y => 0, direction => "south" )->enact("L");
    is( $robot->x,         0,      "x" );
    is( $robot->y,         0,      "y" );
    is( $robot->direction, "east", "direction" );
}; # end: bd1ca4b9-4548-45f4-b32e-900fc7c19389

subtest "Rotating counter-clockwise: changes east to north" => sub { # begin: 2de27b67-a25c-4b59-9883-bc03b1b55bba
    my $robot = Robot->new( x => 0, y => 0, direction => "east" )->enact("L");
    is( $robot->x,         0,       "x" );
    is( $robot->y,         0,       "y" );
    is( $robot->direction, "north", "direction" );
}; # end: 2de27b67-a25c-4b59-9883-bc03b1b55bba

subtest "Moving forward one: facing north increments Y" => sub { # begin: f0dc2388-cddc-4f83-9bed-bcf46b8fc7b8
    my $robot = Robot->new( x => 0, y => 0, direction => "north" )->enact("A");
    is( $robot->x,         0,       "x" );
    is( $robot->y,         1,       "y" );
    is( $robot->direction, "north", "direction" );
}; # end: f0dc2388-cddc-4f83-9bed-bcf46b8fc7b8

subtest "Moving forward one: facing south decrements Y" => sub { # begin: 2786cf80-5bbf-44b0-9503-a89a9c5789da
    my $robot = Robot->new( x => 0, y => 0, direction => "south" )->enact("A");
    is( $robot->x,          0,      "x" );
    is( $robot->y,         -1,      "y" );
    is( $robot->direction, "south", "direction" );
}; # end: 2786cf80-5bbf-44b0-9503-a89a9c5789da

subtest "Moving forward one: facing east increments X" => sub { # begin: 84bf3c8c-241f-434d-883d-69817dbd6a48
    my $robot = Robot->new( x => 0, y => 0, direction => "east" )->enact("A");
    is( $robot->x,         1,      "x" );
    is( $robot->y,         0,      "y" );
    is( $robot->direction, "east", "direction" );
}; # end: 84bf3c8c-241f-434d-883d-69817dbd6a48

subtest "Moving forward one: facing west decrements X" => sub { # begin: bb69c4a7-3bbf-4f64-b415-666fa72d7b04
    my $robot = Robot->new( x => 0, y => 0, direction => "west" )->enact("A");
    is( $robot->x,         -1,     "x" );
    is( $robot->y,          0,     "y" );
    is( $robot->direction, "west", "direction" );
}; # end: bb69c4a7-3bbf-4f64-b415-666fa72d7b04

subtest "Follow series of instructions: moving east and north from README" => sub { # begin: e34ac672-4ed4-4be3-a0b8-d9af259cbaa1
    my $robot = Robot->new( x => 7, y => 3, direction => "north" )->enact("RAALAL");
    is( $robot->x,         9,      "x" );
    is( $robot->y,         4,      "y" );
    is( $robot->direction, "west", "direction" );
}; # end: e34ac672-4ed4-4be3-a0b8-d9af259cbaa1

subtest "Follow series of instructions: moving west and north" => sub { # begin: f30e4955-4b47-4aa3-8b39-ae98cfbd515b
    my $robot = Robot->new( x => 0, y => 0, direction => "north" )->enact("LAAARALA");
    is( $robot->x,         -4,     "x" );
    is( $robot->y,          1,     "y" );
    is( $robot->direction, "west", "direction" );
}; # end: f30e4955-4b47-4aa3-8b39-ae98cfbd515b

subtest "Follow series of instructions: moving west and south" => sub { # begin: 3e466bf6-20ab-4d79-8b51-264165182fca
    my $robot = Robot->new( x => 2, y => -7, direction => "east" )->enact("RRAAAAALA");
    is( $robot->x,         -3,      "x" );
    is( $robot->y,         -8,      "y" );
    is( $robot->direction, "south", "direction" );
}; # end: 3e466bf6-20ab-4d79-8b51-264165182fca

subtest "Follow series of instructions: moving east and north" => sub { # begin: 41f0bb96-c617-4e6b-acff-a4b279d44514
    my $robot = Robot->new( x => 8, y => 4, direction => "south" )->enact("LAAARRRALLLL");
    is( $robot->x,         11,      "x" );
    is( $robot->y,         5,       "y" );
    is( $robot->direction, "north", "direction" );
}; # end: 41f0bb96-c617-4e6b-acff-a4b279d44514

done_testing;
