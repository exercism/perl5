#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5"; # Find modules in the same dir as this file.

use RobotName ();

my $robot = RobotName->new; # begin: 1
isa_ok $robot, 'RobotName'; # end: 1

my $name = $robot->name; # begin: 1
my $schema = qr/^[A-Z]{2}[0-9]{3}$/;
like $robot->name, $schema, 'Name should match schema'; # end: 2

is $name, $robot->name, 'Name should be persistent'; # case: 3

isnt $robot->name, RobotName->new->name, 'Robots should have different names'; # case: 4

isnt $robot->reset_name, $name, 'reset_name should change the robot name'; # case: 5

like $robot->name, $schema, 'New name should match schema'; # case: 6

done_testing;
