#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Robot';

plan tests => 45;

ok -e "$Bin/$module.pm", "Missing $module.pm"
        or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";

ok !$@, "Cannot load $module"
        or BAIL_OUT "Cannot load $module; Does it compile? Does it end with 1;?";

can_ok $module, "new"
        or BAIL_OUT "Missing package $module; or missing sub new()";

can_ok $module, "orient"
        or BAIL_OUT "Missing package $module; or missing sub orient()";

can_ok $module, "bearing"
        or BAIL_OUT "Missing package $module; or missing sub bearing()";

can_ok $module, "turn_right"
        or BAIL_OUT "Missing package $module; or missing sub turn_right()";

can_ok $module, "turn_left"
        or BAIL_OUT "Missing package $module; or missing sub turn_left()";

can_ok $module, "at"
        or BAIL_OUT "Missing package $module; or missing sub at()";

can_ok $module, "coordinates"
        or BAIL_OUT "Missing package $module; or missing sub coordinates()";

can_ok $module, "advance"
        or BAIL_OUT "Missing package $module; or missing sub advance()";

my $robot = $module->new;
my ($east, $west, $north, $south) = qw(east west north south);

$robot->orient($east);
is $robot->bearing, $east, "robot is facing east after robot->orient(east)";

$robot->orient($west);
is $robot->bearing, $west, "robot is facing west after robot->orient(west)";

$robot->orient($north);
is $robot->bearing, $north, "robot is facing north after robot->orient(north)";

$robot->orient($south);
is $robot->bearing, $south, "robot is facing south after robot->orient(south)";

eval {
    $robot->orient("crood");
};
like $@, qr/ArgumentError/, "throw exception for invalid orientation" ;

$robot->orient($north);
$robot->turn_right;
is $robot->bearing, $east, "robot is facing east after turn_right from north";

$robot->orient($east);
$robot->turn_right;
is $robot->bearing, $south, "robot is facing south after turn_right from east";

$robot->orient($south);
$robot->turn_right;
is $robot->bearing, $west, "robot is facing west after turn_right from south";

$robot->orient($west);
$robot->turn_right;
is $robot->bearing, $north, "robot is facing north after turn_right from west";

$robot->orient($north);
$robot->turn_left;
is $robot->bearing, $west, "robot is facing west after turn_left from north";

$robot->orient($east);
$robot->turn_left;
is $robot->bearing, $north, "robot is facing north after turn_left from east";

$robot->orient($south);
$robot->turn_left;
is $robot->bearing, $east, "robot is facing east after turn_left from south";

$robot->orient($west);
$robot->turn_left;
is $robot->bearing, $south, "robot is facing south after turn_left from west";

$robot->at(3, 0);
is_deeply $robot->coordinates, [3, 0],
    "set robot coordinates" or diag explain $robot->coordinates;

$robot->at(-2, 5);
is_deeply $robot->coordinates, [-2, 5],
    "set robot coordinates with negative x" or diag explain $robot->coordinates;

$robot->at(0, 0);
$robot->orient($north);
$robot->advance;
is_deeply $robot->coordinates, [0, 1],
    "add 1 to y coordinate after robot advances from north" or diag explain $robot->coordinates;

$robot->at(0, 0);
$robot->orient($east);
$robot->advance;
is_deeply $robot->coordinates, [1, 0],
    "add 1 to x coordinate after robot advances from east" or diag explain $robot->coordinates;

$robot->at(0, 0);
$robot->orient($south);
$robot->advance;
is_deeply $robot->coordinates, [0, -1],
    "subtract 1 to y coordinate after robot advances from south" or diag explain $robot->coordinates;

$robot->at(0, 0);
$robot->orient($west);
$robot->advance;
is_deeply $robot->coordinates, [-1, 0],
    "subtract 1 to x coordinate after robot advances from west" or diag explain $robot->coordinates;

my $sim_module = "Simulator";

{
    no strict 'refs';
    scalar %{ join('::', $sim_module, '') } or 
      BAIL_OUT "You need to implement the $sim_module class";
}

can_ok $sim_module, "new" or BAIL_OUT "missing sub ${sim_module}::new()";

can_ok $sim_module, "place" or BAIL_OUT "missing sub ${sim_module}::place()";

can_ok $sim_module, "evaluate" or BAIL_OUT "missing sub ${sim_module}::evaluate()";

can_ok $sim_module, "instructions" or BAIL_OUT "missing sub ${sim_module}::instructions()";

my $simulator = $sim_module->new;

is_deeply $simulator->instructions("L"), ["turn_left"],
        "translate L to 'turn_left'" or diag explain $simulator->instructions;

is_deeply $simulator->instructions("R"), ["turn_right"],
        "translate R to 'turn_right'" or diag explain $simulator->instructions;

is_deeply $simulator->instructions("A"), ["advance"],
        "translate A to 'advance'" or diag explain $simulator->instructions;

is_deeply $simulator->instructions("RAAL"), [qw(turn_right advance advance turn_left)],
        "multiple instruction translations" or diag explain $simulator->instructions;

$robot = $module->new;
$simulator->place($robot, { x => -2, y => 1, direction => $east });
$simulator->evaluate($robot, "RLAALAL");
is_deeply $robot->coordinates, [0, 2],
        "test coordinates after instructing robot" or diag explain $robot->coordinates;
is $robot->bearing, $west, "test bearing after instructing robot";

# test multiple robots
my ($robot_1, $robot_2, $robot_3) = ($module->new, $module->new, $module->new);
$simulator->place($robot_1, { x => 0, y =>  0, direction => $north });
$simulator->place($robot_2, { x => 2, y => -7, direction => $east });
$simulator->place($robot_3, { x => 8, y =>  4, direction => $south });
$simulator->evaluate($robot_1, "LAAARALA");
$simulator->evaluate($robot_2, "RRAAAAALA");
$simulator->evaluate($robot_3, "LAAARRRALLLL");

is_deeply $robot_1->coordinates, [-4, 1],
        "test coordinates after instructing robot_1" or diag explain $robot_1->coordinates;
is $robot_1->bearing, $west, "test bearing after instructing robot_1";

is_deeply $robot_2->coordinates, [-3, -8],
        "test coordinates after instructing robot_2" or diag explain $robot_2->coordinates;
is $robot_2->bearing, $south, "test bearing after instructing robot_2";

is_deeply $robot_3->coordinates, [11, 5],
        "test coordinates after instructing robot_3" or diag explain $robot_3->coordinates;
is $robot_3->bearing, $north, "test bearing after instructing robot_3";
