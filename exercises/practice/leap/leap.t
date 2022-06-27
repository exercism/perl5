#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";    # Find modules in the same dir as this file.

use Leap qw<is_leap_year>;
plan 10;                                 # This is how many tests we expect to run.

imported_ok qw<is_leap_year> or bail_out;

is( is_leap_year(2015),
    DF,                                  # Defined but False
    'year not divisible by 4 in common year',
);

is( is_leap_year(1970),
    DF,                                  # Defined but False
    'year divisible by 2, not divisible by 4 in common year',
);

is( is_leap_year(1996),
    T,                                   # True
    'year divisible by 4, not divisible by 100 in leap year',
);

is( is_leap_year(1960),
    T,                                   # True
    'year divisible by 4 and 5 is still a leap year',
);

is( is_leap_year(2100),
    DF,                                  # Defined but False
    'year divisible by 100, not divisible by 400 in common year',
);

is( is_leap_year(1900),
    DF,                                  # Defined but False
    'year divisible by 100 but not by 3 is still not a leap year',
);

is( is_leap_year(2000),
    T,                                   # True
    'year divisible by 400 is leap year',
);

is( is_leap_year(2400),
    T,                                   # True
    'year divisible by 400 but not by 125 is still a leap year',
);

is( is_leap_year(1800),
    DF,                                  # Defined but False
    'year divisible by 200, not divisible by 400 in common year',
);

