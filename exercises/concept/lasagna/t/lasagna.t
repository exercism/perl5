#!/usr/bin/env perl

use v5.36;
use Test2::V0;

use Lasagna;

is(
    $Lasagna::EXPECTED_MINUTES_IN_OVEN,
    40,
    'expected minutes in oven',
);

is(
    Lasagna::remaining_minutes_in_oven(25),
    15,
    'remaining minutes in oven',
);

is(
    Lasagna::preparation_time_in_minutes(1),
    2,
    'preparation time in minutes for one layer',
);

is(
    Lasagna::preparation_time_in_minutes(4),
    8,
    'preparation time in minutes for multiple layers',
);

is(
    Lasagna::total_time_in_minutes(1, 30),
    32,
    'total time in minutes for one layer',
);

is(
    Lasagna::total_time_in_minutes(4, 8),
    16,
    'total time in minutes for multiple layers',
);

is(
    Lasagna::alarm(),
    'Ding!',
    'notification message',
);

done_testing;
