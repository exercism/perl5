#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5"; # Find modules in the same dir as this file.

use Leap qw<is_leap_year>;

is( # begin: 6466b30d-519c-438e-935d-388224ab5223
    is_leap_year(2015),
    DF, # Defined but False
    "year not divisible by 4 in common year",
); # end: 6466b30d-519c-438e-935d-388224ab5223

is( # begin: ac227e82-ee82-4a09-9eb6-4f84331ffdb0
    is_leap_year(1970),
    DF, # Defined but False
    "year divisible by 2, not divisible by 4 in common year",
); # end: ac227e82-ee82-4a09-9eb6-4f84331ffdb0

is( # begin: 4fe9b84c-8e65-489e-970b-856d60b8b78e
    is_leap_year(1996),
    T, # True
    "year divisible by 4, not divisible by 100 in leap year",
); # end: 4fe9b84c-8e65-489e-970b-856d60b8b78e

is( # begin: 7fc6aed7-e63c-48f5-ae05-5fe182f60a5d
    is_leap_year(1960),
    T, # True
    "year divisible by 4 and 5 is still a leap year",
); # end: 7fc6aed7-e63c-48f5-ae05-5fe182f60a5d

is( # begin: 78a7848f-9667-4192-ae53-87b30c9a02dd
    is_leap_year(2100),
    DF, # Defined but False
    "year divisible by 100, not divisible by 400 in common year",
); # end: 78a7848f-9667-4192-ae53-87b30c9a02dd

is( # begin: 9d70f938-537c-40a6-ba19-f50739ce8bac
    is_leap_year(1900),
    DF, # Defined but False
    "year divisible by 100 but not by 3 is still not a leap year",
); # end: 9d70f938-537c-40a6-ba19-f50739ce8bac

is( # begin: 42ee56ad-d3e6-48f1-8e3f-c84078d916fc
    is_leap_year(2000),
    T, # True
    "year divisible by 400 is leap year",
); # end: 42ee56ad-d3e6-48f1-8e3f-c84078d916fc

is( # begin: 57902c77-6fe9-40de-8302-587b5c27121e
    is_leap_year(2400),
    T, # True
    "year divisible by 400 but not by 125 is still a leap year",
); # end: 57902c77-6fe9-40de-8302-587b5c27121e

is( # begin: c30331f6-f9f6-4881-ad38-8ca8c12520c1
    is_leap_year(1800),
    DF, # Defined but False
    "year divisible by 200, not divisible by 400 in common year",
); # end: c30331f6-f9f6-4881-ad38-8ca8c12520c1

done_testing;
