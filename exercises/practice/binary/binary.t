#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my @cases = (
    {   input    => "1",
        expected => 1,
    },
    {   input    => "10",
        expected => 2,
    },
    {   input    => "11",
        expected => 3,
    },
    {   input    => "100",
        expected => 4,
    },
    {   input    => "1001",
        expected => 9,
    },
    {   input    => "11010",
        expected => 26,
    },
    {   input    => "10001101000",
        expected => 1128,
    },
    {   input    => "carrot23",
        expected => 0,
    },
);

my $module = 'Binary';

plan 4 + @cases;

ok -e "$Bin/$module.pm", "Missing $module.pm",
    or BAIL_OUT "You need to create a file called $module.pm";

eval "use $module";

ok !$@, "Cannot load $module",
    or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";

can_ok $module, "new"
    or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "to_decimal"
    or BAIL_OUT "Missing package $module; or missing sub to_decimal()";

foreach my $c (@cases) {
    my $binary = $module->new( $c->{input} );
    is $binary->to_decimal, $c->{expected},
        "Binary($c->{input}) to_decimal $c->{expected}";
}
