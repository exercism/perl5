use strict;
use warnings;

use Test::More;

my $module = $ENV{EXERCISM} ? 'Example' : 'Trinary';

my @cases = (
    {
        input    => 1,
        expected => 1,
    },
    {
        input    => 2,
        expected => 2,
    },
    {
        input    => 10,
        expected => 3,
    },
    {
        input    => 11,
        expected => 4,
    },
    {
        input    => 100,
        expected => 9,
    },
    {
        input    => 10,
        expected => 3,
    },
    {
        input    => 112,
        expected => 14,
    },
    {
        input    => 222,
        expected => 26,
    },
    {
        input    => 1122000120,
        expected => 32091,
    },
    {
        input    => "carrot",
        expected => 0,
    }
);

plan tests => 3 + @cases;

ok -e "$module.pm", "Missing $module.pm",
        or BAIL_OUT "You need to create a file: $module.pm";

eval "use $module";

ok !$@, "Cannot load $module",
        or BAIL_OUT "Cannot load $module; Does it end with 1;?";

can_ok $module, "to_decimal" or BAIL_OUT "Missing $module; or missing sub to_decimal()";

foreach my $c (@cases) {
    my $trinary = $module->new($c->{input});
    is $trinary->to_decimal, $c->{expected}, "test Trinary(" . $c->{input} . ") to_decimal(" . $c->{expected} . ")";
}
