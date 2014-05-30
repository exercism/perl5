use strict;
use warnings;

use Test::More;

my $module = $ENV{EXERCISM} ? 'Example' : 'Squares';

plan tests => 15;

ok -e "$module.pm", "Missing $module.pm"
        or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";
ok !$@, "Cannot load $module"
        or BAIL_OUT "Cannot load $module; Does it compile? Does it end with 1;?";

can_ok $module, "new"
        or BAIL_OUT "Missing package $module; or missing sub new()";

can_ok $module, "sum_of_squares"
        or BAIL_OUT "Missing package $module; or missing sub sum_of_squares()";

can_ok $module, "square_of_sums"
        or BAIL_OUT "Missing package $module; or missing sub square_of_sums()";

can_ok $module, "difference"
        or BAIL_OUT "Missing package $module; or missing sub difference()";

is $module->new(5)->square_of_sums, 225, "square_of_sums to 5";
is $module->new(5)->sum_of_squares, 55, "sum_of_squares to 5";
is $module->new(5)->difference, 170, "difference of 5";

is $module->new(10)->square_of_sums, 3025, "square_of_sums to 10";
is $module->new(10)->sum_of_squares, 385, "sum_of_squares to 10";
is $module->new(10)->difference, 2640, "difference of 10";

is $module->new(100)->square_of_sums, 25_502_500, "square_of_sums to 100";
is $module->new(100)->sum_of_squares, 338_350, "sum_of_squares to 100";
is $module->new(100)->difference, 25_164_150, "difference of 100";
