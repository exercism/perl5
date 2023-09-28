#!/usr/bin/env perl

use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Lasagna ();

is( # begin: var task: 1
    $Lasagna::ExpectedMinutesInOven,
    40,
    'expected minutes in oven',
); # end: var

is( # begin: remaining1 task: 2
    Lasagna::remaining_minutes_in_oven(25),
    15,
    'some remaining minutes in oven',
); # end: remaining1

is( # begin: remaining2 task: 2
    Lasagna::remaining_minutes_in_oven(40),
    0,
    'no more remaining minutes in oven',
); # end: remaining2

is( # begin: prep1 task: 3
    Lasagna::preparation_time_in_minutes(1),
    2,
    'preparation time in minutes for one layer',
); # end: prep1

is( # begin: prep2 task: 3
    Lasagna::preparation_time_in_minutes(4),
    8,
    'preparation time in minutes for multiple layers',
); # end: prep2

is( # begin: total1 task: 4
    Lasagna::total_time_in_minutes( 1, 30 ),
    32,
    'total time in minutes for one layer',
); # end: total1

is( # begin: total2 task: 4
    Lasagna::total_time_in_minutes( 4, 8 ),
    16,
    'total time in minutes for multiple layers',
); # end: total2

is( # begin: alarm task: 5
    Lasagna::oven_alarm(),
    'Ding!',
    'notification message',
); # end: alarm

done_testing;
