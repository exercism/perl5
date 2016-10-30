use strict;
use warnings;
use Test::More;

my $module = $ENV{EXERCISM} ? 'Example' : 'RobotName';

plan tests => 9;

ok -e "$module.pm", "Missing $module.pm"
    or BAIL_OUT("You need to create a module called $module.pm with a constructor and methods called name() and reset_name().");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ?");

can_ok($module, 'new')  or BAIL_OUT("Missing package $module with sub sub new()");
can_ok($module, 'name')  or BAIL_OUT("Missing package $module with sub sub name()");
can_ok($module, 'reset_name') or BAIL_OUT("Missing package $module with sub sub reset()");

# robot method tests
my $robot = $module->new;
my $name = $robot->name;

ok $robot->name =~ /[A-Z]{2}[0-9]{3}/, 'Name should match schema';
is $name, $robot->name, 'Name should be persistent';
ok $robot->name ne $module->new->name, 'Robots should have different names';
ok $robot->reset_name ne $name, 'reset_name should change the robot name';
