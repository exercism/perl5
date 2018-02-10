#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use JSON::PP;
use bigint;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $cases;
my $decoder = JSON::PP->new();
$decoder->allow_bignum(1);

{
    local $/ = undef;
    $cases = $decoder->decode( scalar <DATA> );
}

plan tests => 4 + @$cases;

my $module = 'Grains';

ok -e "${dir}${module}.pm", "Missing $module.pm" or BAIL_OUT "You need to create a class called $module.pm";

use_ok($module)
    or BAIL_OUT "Does $module.pm compile? Does it end with 1;?";

can_ok $module, "square" or BAIL_OUT "Missing package $module; or missing sub square()";
can_ok $module, "total"  or BAIL_OUT "Missing package $module; or missing sub total()";

foreach my $c (@$cases) {
    my $sub = $module->can( $c->{sub} );

    if ($c->{sub} eq 'square') {
        cmp_ok $sub->($c->{input}), '==', 0 + $c->{expected}, $c->{name};
    }
    if ($c->{sub} eq 'total') {
        cmp_ok $sub->(), '==', 0 + $c->{expected}, $c->{name};
    }
}

__DATA__
[
    {
        "sub"      : "square",
        "input"    : 1,
        "expected" : 1,
        "name"     : "test square 1"
    },
    {
        "sub"      : "square",
        "input"    : 2,
        "expected" : 2,
        "name"     : "test square 2"
    },
    {
        "sub"      : "square",
        "input"    : 3,
        "expected" : 4,
        "name"     : "test square 3"
    },
    {
        "sub"      : "square",
        "input"    : 4,
        "expected" : 8,
        "name"     : "test square 4"
    },
    {
        "sub"      : "square",
        "input"    : 16,
        "expected" : 32768,
        "name"     : "test square 16"
    },
    {
        "sub"      : "square",
        "input"    : 32,
        "expected" : 2147483648,
        "name"     : "test square 32"
    },
    {
        "sub"      : "square",
        "input"    : 64,
        "expected" : 9223372036854775808,
        "name"     : "test square 64"
    },
    {
        "sub"      : "total",
        "expected" : 18446744073709551615,
        "name"     : "test total"
    }
]
