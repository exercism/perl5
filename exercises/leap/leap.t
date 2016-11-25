#!/usr/bin/env perl
use warnings;
use strict;

use Test::More tests => 7;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = $ENV{EXERCISM} ? 'Example' : 'Leap';

use_ok($module)
    or BAIL_OUT ("You need to create a module called $module.pm.");
can_ok($module, 'is_leap')
    or BAIL_OUT("Missing package $module with sub is_leap()");

my $sub = $module->can('is_leap');

do {
    ok $sub->(1996), '1996 is a leap year';
    ok !$sub->(1997), '1997 is not a leap year';
    ok !$sub->(1998), '1998 is not a leap year';
    ok !$sub->(1900), '1900 is not a leap year';
    ok $sub->(2400), '2400 is a leap year';
}
