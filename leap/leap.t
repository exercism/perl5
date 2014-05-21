use warnings;
use strict;
use Test::More tests => 7;

my $module = $ENV{EXERCISM} ? 'Example' : 'Leap';
my $sub = $module . '::is_leap';

use_ok($module) or BAIL_OUT ("You need to create a module called $module.pm.");
can_ok($module, 'is_leap') or BAIL_OUT("Missing package $module with sub is_leap()");

do {
    no strict 'refs';
    is 1, $sub->(1996), '1996 is a leap year';
    is 0, $sub->(1997), '1997 is not a leap year';
    is 0, $sub->(1998), '1998 is not a leap year';
    is 0, $sub->(1900), '1900 is not a leap year';
    is 1, $sub->(2400), '2400 is a leap year';
}
