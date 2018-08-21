#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use JSON::PP qw(decode_json);
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Triangle';

my $cases;
{
    local $/ = undef;
    $cases = decode_json scalar <DATA>;
}

plan tests => 5 + @$cases;

ok -e "$Bin/$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm with a constructor called new.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ? ($@)");

foreach my $sub (qw|triangle is_triangle row|) {
    can_ok($module, $sub) or BAIL_OUT("Missing package $module; or missing sub $sub()");
}

foreach my $c (@$cases) {
    no strict 'refs';
    my $sub = "${module}::" . $c->{sub};
    if ($c->{sub} eq "triangle") {
        is_deeply $sub->($c->{param}), $c->{expected}, $c->{name};
    } else {
        is $sub->($c->{param}), $c->{expected}, $c->{name};
    }
}

__DATA__
[
    {
        "sub"      : "triangle",
        "param"    : 4,
        "expected" : ["1", "1 1", "1 2 1", "1 3 3 1", "1 4 6 4 1"],
        "name"     : "pascals triangle of 0-4 rows"
    },
    {
        "sub"      : "triangle",
        "param"    : 6,
        "expected" : ["1", "1 1", "1 2 1", "1 3 3 1", "1 4 6 4 1", "1 5 10 10 5 1",
                       "1 6 15 20 15 6 1"],
        "name"     : "pascals triangle of 0-6 rows"
    },
    {
        "sub"      : "is_triangle",
        "param"    : ["1", "1 1", "1 2 1", "1 3 3 1", "1 4 6 4 1", "1 5 10 10 5 1"],
        "expected" : true,
        "name"     : "test a valid triangle"
    },
    {
        "sub"      : "is_triangle",
        "param"    : ["1", "1 1", "1 2 1", "1 4 4 1"],
        "expected" : false,
        "name"     : "test a NOT valid triangle"
    },
    {
        "sub"      : "row",
        "param"    : 0,
        "expected" : "1",
        "name"     : "row 0 of pascals triangle"
    },
    {
        "sub"      : "row",
        "param"    : 2,
        "expected" : "1 2 1",
        "name"     : "row 2 of pascals triangle"
    },
    {
        "sub"      : "row",
        "param"    : 7,
        "expected" : "1 7 21 35 35 21 7 1",
        "name"     : "row 7 of pascals triangle"
    }
]
