use strict;
use warnings;

use Test::More;
use Test::Exception;

my $module = $ENV{EXERCISM} ? 'Example' : 'Series';

plan tests => 13;

ok -e "$module.pm", "Missing $module.pm"  or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";
ok !$@, "Cannot load $module" or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";
can_ok $module, "new"    or BAIL_OUT "Missing package $module, or missing sub new()";
can_ok $module, "slices" or BAIL_OUT "Missing package $module, or missing sub slices()";
can_ok $module, "largest_product" or BAIL_OUT "Missing package $module, or missing sub largest_product()";

is_deeply
    $module->new('97867564')->slices(2),
    [[9, 7], [7, 8], [8, 6], [6, 7], [7, 5], [5, 6], [6, 4]],
    "test slices of two" or diag explain $module->new('97867564')->slices(2);

throws_ok { $module->new('012')->slices(4) } qr/ArgumentError/, "slice length longer than digits legth throws exception";
throws_ok { $module->new('012')->largest_product(4) } qr/ArgumentError/, "slice length longer than digits legth throws exception (largest_product)";

is $module->new('0123456789')->largest_product(2), 72, "largest  product of 2";
is $module->new('19')->largest_product(2), 9, "largest product of 2 on a tiny number";
is $module->new('1027839564')->largest_product(3), 270, "largest product of 3";
is $module->new('52677741234314237566414902593461595376319419139427')->largest_product(6), 28350, "largest product of 6";
is $module->new('')->largest_product(0), 1, "test identity";
