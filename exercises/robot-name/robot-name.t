#!/usr/bin/env perl
use Test2::V0;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5"; # Find modules in the same dir as this file.

use RobotName ();

plan 7;    # This is how many tests we expect to run.

can_ok 'RobotName', qw(new name reset_name) or bail_out;

my $robot = RobotName->new;
isa_ok $robot, 'RobotName';

my $name = $robot->name;
my $schema = qr/^[A-Z]{2}[0-9]{3}$/;
like $robot->name, $schema, 'Name should match schema';
is $name, $robot->name, 'Name should be persistent';
isnt $robot->name, RobotName->new->name,
  'Robots should have different names';
isnt $robot->reset_name, $name,
  'reset_name should change the robot name';
like $robot->name, $schema, 'New name should match schema';
