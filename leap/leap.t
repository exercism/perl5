use warnings;
use strict;
use Test::More tests => 7;

my $module = $ENV{EXERCISM} ? 'Example' : 'Leap';
my $sub = $module . '::is_leap';

use_ok($module) or BAIL_OUT ("You need to create a module called $module.pm.");
can_ok($module, 'is_leap') or BAIL_OUT("Missing package $module with sub is_leap()");

do {
    no strict 'refs';
    is $sub->(1996), 1, '1996 is a leap year';
    is $sub->(1997), 0, '1997 is not a leap year';
    is $sub->(1998), 0, '1998 is not a leap year';
    is $sub->(1900), 0, '1900 is not a leap year';
    is $sub->(2400), 1, '2400 is a leap year';
}
