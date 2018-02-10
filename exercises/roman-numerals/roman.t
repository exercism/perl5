#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my @cases = (
    {
        decimal  => 1,
        expected => 'I'
    },
    {
        decimal  => 2,
        expected => 'II'
    },
    {
        decimal  => 3,
        expected => 'III'
    },
    {
        decimal  => 4,
        expected => 'IV'
    },
    {
        decimal  => 5,
        expected => 'V'
    },
    {
        decimal  => 6,
        expected => 'VI'
    },
    {
        decimal  => 9,
        expected => 'IX'
    },
    {
        decimal  => 27,
        expected => 'XXVII'
    },
    {
        decimal  => 48,
        expected => 'XLVIII'
    },
    {
        decimal  => 59,
        expected => 'LIX'
    },
    {
        decimal  => 93,
        expected => 'XCIII'
    },
    {
        decimal  => 141,
        expected => 'CXLI'
    },
    {
        decimal  => 163,
        expected => 'CLXIII'
    },
    {
        decimal  => 402,
        expected => 'CDII'
    },
    {
        decimal  => 575,
        expected => 'DLXXV'
    },
    {
        decimal  => 911,
        expected => 'CMXI'
    },
    {
        decimal  => 1024,
        expected => 'MXXIV'
    },
    {
        decimal  => 3000,
        expected => 'MMM'
    },
);

plan tests => 4 + @cases;

my $module = 'Decimal';

ok -e "${dir}${module}.pm", "Missing $module.pm"
                or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";

ok !$@, "Cannot load $module"
                or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";

can_ok $module, "new"      or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "to_roman" or BAIL_OUT "Missing package $module; or missing sub to_roman()";

foreach my $c (@cases) {
    my $decimal = $module->new($c->{decimal});

    is $decimal->to_roman, $c->{expected}, "decimal $c->{decimal} converts to $c->{expected}";
}
