#!/usr/bin/env perl
use warnings;
use strict;

use DateTime;
use Test::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Meetup';

plan tests => 95;

ok -e "$Bin/$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a module called $module.pm with a method called day() that gets two parameters: the day of the week and the schedule and returns a DateTime object for the correct date.");

eval "use $module";

ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it with 1; ?");

can_ok($module, 'new') or BAIL_OUT("Missing sub new()");
can_ok($module, 'day') or BAIL_OUT("Missing sub day()");

is($module->new(5, 2013)->day(qw/monday teenth/)     , DateTime->new(year=>2013, month=> 5, day=>13));
is($module->new(8, 2013)->day(qw/monday teenth/)     , DateTime->new(year=>2013, month=> 8, day=>19));
is($module->new(9, 2013)->day(qw/monday teenth/)     , DateTime->new(year=>2013, month=> 9, day=>16));
is($module->new(3, 2013)->day(qw/tuesday teenth/)    , DateTime->new(year=>2013, month=> 3, day=>19));
is($module->new(4, 2013)->day(qw/tuesday teenth/)    , DateTime->new(year=>2013, month=> 4, day=>16));
is($module->new(8, 2013)->day(qw/tuesday teenth/)    , DateTime->new(year=>2013, month=> 8, day=>13));
is($module->new(1, 2013)->day(qw/wednesday teenth/)  , DateTime->new(year=>2013, month=> 1, day=>16));
is($module->new(2, 2013)->day(qw/wednesday teenth/)  , DateTime->new(year=>2013, month=> 2, day=>13));
is($module->new(6, 2013)->day(qw/wednesday teenth/)  , DateTime->new(year=>2013, month=> 6, day=>19));
is($module->new(5, 2013)->day(qw/thursday teenth/)   , DateTime->new(year=>2013, month=> 5, day=>16));
is($module->new(6, 2013)->day(qw/thursday teenth/)   , DateTime->new(year=>2013, month=> 6, day=>13));
is($module->new(9, 2013)->day(qw/thursday teenth/)   , DateTime->new(year=>2013, month=> 9, day=>19));
is($module->new(4, 2013)->day(qw/friday teenth/)     , DateTime->new(year=>2013, month=> 4, day=>19));
is($module->new(8, 2013)->day(qw/friday teenth/)     , DateTime->new(year=>2013, month=> 8, day=>16));
is($module->new(9, 2013)->day(qw/friday teenth/)     , DateTime->new(year=>2013, month=> 9, day=>13));
is($module->new(2, 2013)->day(qw/saturday teenth/)   , DateTime->new(year=>2013, month=> 2, day=>16));
is($module->new(4, 2013)->day(qw/saturday teenth/)   , DateTime->new(year=>2013, month=> 4, day=>13));
is($module->new(10,2013)->day(qw/saturday teenth/)   , DateTime->new(year=>2013, month=> 10,day=>19));
is($module->new(5, 2013)->day(qw/sunday teenth/)     , DateTime->new(year=>2013, month=> 5, day=>19));
is($module->new(6, 2013)->day(qw/sunday teenth/)     , DateTime->new(year=>2013, month=> 6, day=>16));
is($module->new(10,2013)->day(qw/sunday teenth/)     , DateTime->new(year=>2013, month=> 10,day=>13));
is($module->new(3, 2013)->day(qw/monday first/)      , DateTime->new(year=>2013, month=> 3, day=>4 ));
is($module->new(4, 2013)->day(qw/monday first/)      , DateTime->new(year=>2013, month=> 4, day=>1 ));
is($module->new(5, 2013)->day(qw/tuesday first/)     , DateTime->new(year=>2013, month=> 5, day=>7 ));
is($module->new(6, 2013)->day(qw/tuesday first/)     , DateTime->new(year=>2013, month=> 6, day=>4 ));
is($module->new(7, 2013)->day(qw/wednesday first/)   , DateTime->new(year=>2013, month=> 7, day=>3 ));
is($module->new(8, 2013)->day(qw/wednesday first/)   , DateTime->new(year=>2013, month=> 8, day=>7 ));
is($module->new(9, 2013)->day(qw/thursday first/)    , DateTime->new(year=>2013, month=> 9, day=>5 ));
is($module->new(10,2013)->day(qw/thursday first/)    , DateTime->new(year=>2013, month=> 10,day=>3 ));
is($module->new(11,2013)->day(qw/friday first/)      , DateTime->new(year=>2013, month=> 11,day=>1 ));
is($module->new(12,2013)->day(qw/friday first/)      , DateTime->new(year=>2013, month=> 12,day=>6 ));
is($module->new(1, 2013)->day(qw/saturday first/)    , DateTime->new(year=>2013, month=> 1, day=>5 ));
is($module->new(2, 2013)->day(qw/saturday first/)    , DateTime->new(year=>2013, month=> 2, day=>2 ));
is($module->new(3, 2013)->day(qw/sunday first/)      , DateTime->new(year=>2013, month=> 3, day=>3 ));
is($module->new(4, 2013)->day(qw/sunday first/)      , DateTime->new(year=>2013, month=> 4, day=>7 ));
is($module->new(3, 2013)->day(qw/monday second/)     , DateTime->new(year=>2013, month=> 3, day=>11));
is($module->new(4, 2013)->day(qw/monday second/)     , DateTime->new(year=>2013, month=> 4, day=>8 ));
is($module->new(5, 2013)->day(qw/tuesday second/)    , DateTime->new(year=>2013, month=> 5, day=>14));
is($module->new(6, 2013)->day(qw/tuesday second/)    , DateTime->new(year=>2013, month=> 6, day=>11));
is($module->new(7, 2013)->day(qw/wednesday second/)  , DateTime->new(year=>2013, month=> 7, day=>10));
is($module->new(8, 2013)->day(qw/wednesday second/)  , DateTime->new(year=>2013, month=> 8, day=>14));
is($module->new(9, 2013)->day(qw/thursday second/)   , DateTime->new(year=>2013, month=> 9, day=>12));
is($module->new(10,2013)->day(qw/thursday second/)   , DateTime->new(year=>2013, month=> 10,day=>10));
is($module->new(11,2013)->day(qw/friday second/)     , DateTime->new(year=>2013, month=> 11,day=>8 ));
is($module->new(12,2013)->day(qw/friday second/)     , DateTime->new(year=>2013, month=> 12,day=>13));
is($module->new(1, 2013)->day(qw/saturday second/)   , DateTime->new(year=>2013, month=> 1, day=>12));
is($module->new(2, 2013)->day(qw/saturday second/)   , DateTime->new(year=>2013, month=> 2, day=>9 ));
is($module->new(3, 2013)->day(qw/sunday second/)     , DateTime->new(year=>2013, month=> 3, day=>10));
is($module->new(4, 2013)->day(qw/sunday second/)     , DateTime->new(year=>2013, month=> 4, day=>14));
is($module->new(3, 2013)->day(qw/monday third/)      , DateTime->new(year=>2013, month=> 3, day=>18));
is($module->new(4, 2013)->day(qw/monday third/)      , DateTime->new(year=>2013, month=> 4, day=>15));
is($module->new(5, 2013)->day(qw/tuesday third/)     , DateTime->new(year=>2013, month=> 5, day=>21));
is($module->new(6, 2013)->day(qw/tuesday third/)     , DateTime->new(year=>2013, month=> 6, day=>18));
is($module->new(7, 2013)->day(qw/wednesday third/)   , DateTime->new(year=>2013, month=> 7, day=>17));
is($module->new(8, 2013)->day(qw/wednesday third/)   , DateTime->new(year=>2013, month=> 8, day=>21));
is($module->new(9, 2013)->day(qw/thursday third/)    , DateTime->new(year=>2013, month=> 9, day=>19));
is($module->new(10,2013)->day(qw/thursday third/)    , DateTime->new(year=>2013, month=> 10,day=>17));
is($module->new(11,2013)->day(qw/friday third/)      , DateTime->new(year=>2013, month=> 11,day=>15));
is($module->new(12,2013)->day(qw/friday third/)      , DateTime->new(year=>2013, month=> 12,day=>20));
is($module->new(1, 2013)->day(qw/saturday third/)    , DateTime->new(year=>2013, month=> 1, day=>19));
is($module->new(2, 2013)->day(qw/saturday third/)    , DateTime->new(year=>2013, month=> 2, day=>16));
is($module->new(3, 2013)->day(qw/sunday third/)      , DateTime->new(year=>2013, month=> 3, day=>17));
is($module->new(4, 2013)->day(qw/sunday third/)      , DateTime->new(year=>2013, month=> 4, day=>21));
is($module->new(3, 2013)->day(qw/monday fourth/)     , DateTime->new(year=>2013, month=> 3, day=>25));
is($module->new(4, 2013)->day(qw/monday fourth/)     , DateTime->new(year=>2013, month=> 4, day=>22));
is($module->new(5, 2013)->day(qw/tuesday fourth/)    , DateTime->new(year=>2013, month=> 5, day=>28));
is($module->new(6, 2013)->day(qw/tuesday fourth/)    , DateTime->new(year=>2013, month=> 6, day=>25));
is($module->new(7, 2013)->day(qw/wednesday fourth/)  , DateTime->new(year=>2013, month=> 7, day=>24));
is($module->new(8, 2013)->day(qw/wednesday fourth/)  , DateTime->new(year=>2013, month=> 8, day=>28));
is($module->new(9, 2013)->day(qw/thursday fourth/)   , DateTime->new(year=>2013, month=> 9, day=>26));
is($module->new(10,2013)->day(qw/thursday fourth/)   , DateTime->new(year=>2013, month=> 10,day=>24));
is($module->new(11,2013)->day(qw/friday fourth/)     , DateTime->new(year=>2013, month=> 11,day=>22));
is($module->new(12,2013)->day(qw/friday fourth/)     , DateTime->new(year=>2013, month=> 12,day=>27));
is($module->new(1, 2013)->day(qw/saturday fourth/)   , DateTime->new(year=>2013, month=> 1, day=>26));
is($module->new(2, 2013)->day(qw/saturday fourth/)   , DateTime->new(year=>2013, month=> 2, day=>23));
is($module->new(3, 2013)->day(qw/sunday fourth/)     , DateTime->new(year=>2013, month=> 3, day=>24));
is($module->new(4, 2013)->day(qw/sunday fourth/)     , DateTime->new(year=>2013, month=> 4, day=>28));
is($module->new(3, 2013)->day(qw/monday last/)       , DateTime->new(year=>2013, month=> 3, day=>25));
is($module->new(4, 2013)->day(qw/monday last/)       , DateTime->new(year=>2013, month=> 4, day=>29));
is($module->new(5, 2013)->day(qw/tuesday last/)      , DateTime->new(year=>2013, month=> 5, day=>28));
is($module->new(6, 2013)->day(qw/tuesday last/)      , DateTime->new(year=>2013, month=> 6, day=>25));
is($module->new(7, 2013)->day(qw/wednesday last/)    , DateTime->new(year=>2013, month=> 7, day=>31));
is($module->new(8, 2013)->day(qw/wednesday last/)    , DateTime->new(year=>2013, month=> 8, day=>28));
is($module->new(9, 2013)->day(qw/thursday last/)     , DateTime->new(year=>2013, month=> 9, day=>26));
is($module->new(10,2013)->day(qw/thursday last/)     , DateTime->new(year=>2013, month=> 10,day=>31));
is($module->new(11,2013)->day(qw/friday last/)       , DateTime->new(year=>2013, month=> 11,day=>29));
is($module->new(12,2013)->day(qw/friday last/)       , DateTime->new(year=>2013, month=> 12,day=>27));
is($module->new(1, 2013)->day(qw/saturday last/)     , DateTime->new(year=>2013, month=> 1, day=>26));
is($module->new(2, 2013)->day(qw/saturday last/)     , DateTime->new(year=>2013, month=> 2, day=>23));
is($module->new(3, 2013)->day(qw/sunday last/)       , DateTime->new(year=>2013, month=> 3, day=>31));
is($module->new(4, 2013)->day(qw/sunday last/)       , DateTime->new(year=>2013, month=> 4, day=>28));

