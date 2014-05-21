use warnings;
use strict;
use DateTime;
use Test::More;

# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule)
# where weekday is one of monday, tuesday, etc
# and schedule is first, second, third, fourth, last or teenth.

my $module = $ENV{EXERCISM} ? 'Example' : 'Meetup';

plan tests => 95;

ok -e "$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a module called $module.pm with a method called day() that gets two parameters: the day of the week and the schedule and returns a DateTime object for the correct date.");

eval "use $module";

ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it with 1; ?");

can_ok($module, 'new') or BAIL_OUT("Missing sub new()");
can_ok($module, 'day') or BAIL_OUT("Missing sub day()");

is(DateTime->new(year=>2013, month=> 5, day=>13), $module->new(5, 2013)->day(qw/monday teenth/));
is(DateTime->new(year=>2013, month=> 8, day=>19), $module->new(8, 2013)->day(qw/monday teenth/));
is(DateTime->new(year=>2013, month=> 9, day=>16), $module->new(9, 2013)->day(qw/monday teenth/));
is(DateTime->new(year=>2013, month=> 3, day=>19), $module->new(3, 2013)->day(qw/tuesday teenth/));
is(DateTime->new(year=>2013, month=> 4, day=>16), $module->new(4, 2013)->day(qw/tuesday teenth/));
is(DateTime->new(year=>2013, month=> 8, day=>13), $module->new(8, 2013)->day(qw/tuesday teenth/));
is(DateTime->new(year=>2013, month=> 1, day=>16), $module->new(1, 2013)->day(qw/wednesday teenth/));
is(DateTime->new(year=>2013, month=> 2, day=>13), $module->new(2, 2013)->day(qw/wednesday teenth/));
is(DateTime->new(year=>2013, month=> 6, day=>19), $module->new(6, 2013)->day(qw/wednesday teenth/));
is(DateTime->new(year=>2013, month=> 5, day=>16), $module->new(5, 2013)->day(qw/thursday teenth/));
is(DateTime->new(year=>2013, month=> 6, day=>13), $module->new(6, 2013)->day(qw/thursday teenth/));
is(DateTime->new(year=>2013, month=> 9, day=>19), $module->new(9, 2013)->day(qw/thursday teenth/));
is(DateTime->new(year=>2013, month=> 4, day=>19), $module->new(4, 2013)->day(qw/friday teenth/));
is(DateTime->new(year=>2013, month=> 8, day=>16), $module->new(8, 2013)->day(qw/friday teenth/));
is(DateTime->new(year=>2013, month=> 9, day=>13), $module->new(9, 2013)->day(qw/friday teenth/));
is(DateTime->new(year=>2013, month=> 2, day=>16), $module->new(2, 2013)->day(qw/saturday teenth/));
is(DateTime->new(year=>2013, month=> 4, day=>13), $module->new(4, 2013)->day(qw/saturday teenth/));
is(DateTime->new(year=>2013, month=> 10, day=>19), $module->new(10, 2013)->day(qw/saturday teenth/));
is(DateTime->new(year=>2013, month=> 5, day=>19), $module->new(5, 2013)->day(qw/sunday teenth/));
is(DateTime->new(year=>2013, month=> 6, day=>16), $module->new(6, 2013)->day(qw/sunday teenth/));
is(DateTime->new(year=>2013, month=> 10, day=>13), $module->new(10, 2013)->day(qw/sunday teenth/));
is(DateTime->new(year=>2013, month=> 3, day=>4), $module->new(3, 2013)->day(qw/monday first/));
is(DateTime->new(year=>2013, month=> 4, day=>1), $module->new(4, 2013)->day(qw/monday first/));
is(DateTime->new(year=>2013, month=> 5, day=>7), $module->new(5, 2013)->day(qw/tuesday first/));
is(DateTime->new(year=>2013, month=> 6, day=>4), $module->new(6, 2013)->day(qw/tuesday first/));
is(DateTime->new(year=>2013, month=> 7, day=>3), $module->new(7, 2013)->day(qw/wednesday first/));
is(DateTime->new(year=>2013, month=> 8, day=>7), $module->new(8, 2013)->day(qw/wednesday first/));
is(DateTime->new(year=>2013, month=> 9, day=>5), $module->new(9, 2013)->day(qw/thursday first/));
is(DateTime->new(year=>2013, month=> 10, day=>3), $module->new(10, 2013)->day(qw/thursday first/));
is(DateTime->new(year=>2013, month=> 11, day=>1), $module->new(11, 2013)->day(qw/friday first/));
is(DateTime->new(year=>2013, month=> 12, day=>6), $module->new(12, 2013)->day(qw/friday first/));
is(DateTime->new(year=>2013, month=> 1, day=>5), $module->new(1, 2013)->day(qw/saturday first/));
is(DateTime->new(year=>2013, month=> 2, day=>2), $module->new(2, 2013)->day(qw/saturday first/));
is(DateTime->new(year=>2013, month=> 3, day=>3), $module->new(3, 2013)->day(qw/sunday first/));
is(DateTime->new(year=>2013, month=> 4, day=>7), $module->new(4, 2013)->day(qw/sunday first/));
is(DateTime->new(year=>2013, month=> 3, day=>11), $module->new(3, 2013)->day(qw/monday second/));
is(DateTime->new(year=>2013, month=> 4, day=>8), $module->new(4, 2013)->day(qw/monday second/));
is(DateTime->new(year=>2013, month=> 5, day=>14), $module->new(5, 2013)->day(qw/tuesday second/));
is(DateTime->new(year=>2013, month=> 6, day=>11), $module->new(6, 2013)->day(qw/tuesday second/));
is(DateTime->new(year=>2013, month=> 7, day=>10), $module->new(7, 2013)->day(qw/wednesday second/));
is(DateTime->new(year=>2013, month=> 8, day=>14), $module->new(8, 2013)->day(qw/wednesday second/));
is(DateTime->new(year=>2013, month=> 9, day=>12), $module->new(9, 2013)->day(qw/thursday second/));
is(DateTime->new(year=>2013, month=> 10, day=>10), $module->new(10, 2013)->day(qw/thursday second/));
is(DateTime->new(year=>2013, month=> 11, day=>8), $module->new(11, 2013)->day(qw/friday second/));
is(DateTime->new(year=>2013, month=> 12, day=>13), $module->new(12, 2013)->day(qw/friday second/));
is(DateTime->new(year=>2013, month=> 1, day=>12), $module->new(1, 2013)->day(qw/saturday second/));
is(DateTime->new(year=>2013, month=> 2, day=>9), $module->new(2, 2013)->day(qw/saturday second/));
is(DateTime->new(year=>2013, month=> 3, day=>10), $module->new(3, 2013)->day(qw/sunday second/));
is(DateTime->new(year=>2013, month=> 4, day=>14), $module->new(4, 2013)->day(qw/sunday second/));
is(DateTime->new(year=>2013, month=> 3, day=>18), $module->new(3, 2013)->day(qw/monday third/));
is(DateTime->new(year=>2013, month=> 4, day=>15), $module->new(4, 2013)->day(qw/monday third/));
is(DateTime->new(year=>2013, month=> 5, day=>21), $module->new(5, 2013)->day(qw/tuesday third/));
is(DateTime->new(year=>2013, month=> 6, day=>18), $module->new(6, 2013)->day(qw/tuesday third/));
is(DateTime->new(year=>2013, month=> 7, day=>17), $module->new(7, 2013)->day(qw/wednesday third/));
is(DateTime->new(year=>2013, month=> 8, day=>21), $module->new(8, 2013)->day(qw/wednesday third/));
is(DateTime->new(year=>2013, month=> 9, day=>19), $module->new(9, 2013)->day(qw/thursday third/));
is(DateTime->new(year=>2013, month=> 10,day=> 17), $module->new(10, 2013)->day(qw/thursday third/));
is(DateTime->new(year=>2013, month=> 11,day=> 15), $module->new(11, 2013)->day(qw/friday third/));
is(DateTime->new(year=>2013, month=> 12,day=> 20), $module->new(12, 2013)->day(qw/friday third/));
is(DateTime->new(year=>2013, month=> 1, day=>19), $module->new(1, 2013)->day(qw/saturday third/));
is(DateTime->new(year=>2013, month=> 2, day=>16), $module->new(2, 2013)->day(qw/saturday third/));
is(DateTime->new(year=>2013, month=> 3, day=>17), $module->new(3, 2013)->day(qw/sunday third/));
is(DateTime->new(year=>2013, month=> 4, day=>21), $module->new(4, 2013)->day(qw/sunday third/));
is(DateTime->new(year=>2013, month=> 3, day=>25), $module->new(3, 2013)->day(qw/monday fourth/));
is(DateTime->new(year=>2013, month=> 4, day=>22), $module->new(4, 2013)->day(qw/monday fourth/));
is(DateTime->new(year=>2013, month=> 5, day=>28), $module->new(5, 2013)->day(qw/tuesday fourth/));
is(DateTime->new(year=>2013, month=> 6, day=>25), $module->new(6, 2013)->day(qw/tuesday fourth/));
is(DateTime->new(year=>2013, month=> 7, day=>24), $module->new(7, 2013)->day(qw/wednesday fourth/));
is(DateTime->new(year=>2013, month=> 8, day=>28), $module->new(8, 2013)->day(qw/wednesday fourth/));
is(DateTime->new(year=>2013, month=> 9, day=>26), $module->new(9, 2013)->day(qw/thursday fourth/));
is(DateTime->new(year=>2013, month=> 10,day=> 24), $module->new(10, 2013)->day(qw/thursday fourth/));
is(DateTime->new(year=>2013, month=> 11,day=> 22), $module->new(11, 2013)->day(qw/friday fourth/));
is(DateTime->new(year=>2013, month=> 12,day=> 27), $module->new(12, 2013)->day(qw/friday fourth/));
is(DateTime->new(year=>2013, month=> 1, day=>26), $module->new(1, 2013)->day(qw/saturday fourth/));
is(DateTime->new(year=>2013, month=> 2, day=>23), $module->new(2, 2013)->day(qw/saturday fourth/));
is(DateTime->new(year=>2013, month=> 3, day=>24), $module->new(3, 2013)->day(qw/sunday fourth/));
is(DateTime->new(year=>2013, month=> 4, day=>28), $module->new(4, 2013)->day(qw/sunday fourth/));
is(DateTime->new(year=>2013, month=> 3, day=>25), $module->new(3, 2013)->day(qw/monday last/));
is(DateTime->new(year=>2013, month=> 4, day=>29), $module->new(4, 2013)->day(qw/monday last/));
is(DateTime->new(year=>2013, month=> 5, day=>28), $module->new(5, 2013)->day(qw/tuesday last/));
is(DateTime->new(year=>2013, month=> 6, day=>25), $module->new(6, 2013)->day(qw/tuesday last/));
is(DateTime->new(year=>2013, month=> 7, day=>31), $module->new(7, 2013)->day(qw/wednesday last/));
is(DateTime->new(year=>2013, month=> 8, day=>28), $module->new(8, 2013)->day(qw/wednesday last/));
is(DateTime->new(year=>2013, month=> 9, day=>26), $module->new(9, 2013)->day(qw/thursday last/));
is(DateTime->new(year=>2013, month=> 10,day=> 31), $module->new(10, 2013)->day(qw/thursday last/));
is(DateTime->new(year=>2013, month=> 11,day=> 29), $module->new(11, 2013)->day(qw/friday last/));
is(DateTime->new(year=>2013, month=> 12,day=> 27), $module->new(12, 2013)->day(qw/friday last/));
is(DateTime->new(year=>2013, month=> 1, day=>26), $module->new(1, 2013)->day(qw/saturday last/));
is(DateTime->new(year=>2013, month=> 2, day=>23), $module->new(2, 2013)->day(qw/saturday last/));
is(DateTime->new(year=>2013, month=> 3, day=>31), $module->new(3, 2013)->day(qw/sunday last/));
is(DateTime->new(year=>2013, month=> 4, day=>28), $module->new(4, 2013)->day(qw/sunday last/));

