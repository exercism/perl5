use strict;
use warnings;

use Test::More;

my $module = $ENV{EXERCISM} ? 'Example' : 'SumOfMultiples';

plan tests => 11;

ok -e "$module.pm", "Missing $module.pm"
        or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";
ok !$@, "Cannot load $module"
        or BAIL_OUT "Cannot load $module; Does it compile? Does it end with 1;?";

can_ok $module, "new"
        or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "to"
        or BAIL_OUT "Missing package $module; or missing sub to()";

is $module->new->to(1), 0, "No multiples of 3 or 5 equals zero";
is $module->new->to(4), 3, "One multiple of 3";
is $module->new->to(10), 23, "Multiples of 3 and 5";
is $module->new->to(100), 2_318, "Multiples of 3 and 5 to 100";
is $module->new->to(1000), 233_168, "A lot of multiples of 3 and 5";
is $module->new(7, 13, 17)->to(20), 51, "Multiples of 7, 13, 17";
is $module->new(43, 47)->to(10_000), 2_203_160, "Multiples of 43, 47";
