#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Gigasecond qw<add_gigasecond>;

is( # begin: 92fbe71c-ea52-4fac-bd77-be38023cacf7
    add_gigasecond("2011-04-25"),
    "2043-01-01T01:46:40",
    "date only specification of time",
); # end: 92fbe71c-ea52-4fac-bd77-be38023cacf7

is( # begin: 6d86dd16-6f7a-47be-9e58-bb9fb2ae1433
    add_gigasecond("1977-06-13"),
    "2009-02-19T01:46:40",
    "second test for date only specification of time",
); # end: 6d86dd16-6f7a-47be-9e58-bb9fb2ae1433

is( # begin: 77eb8502-2bca-4d92-89d9-7b39ace28dd5
    add_gigasecond("1959-07-19"),
    "1991-03-27T01:46:40",
    "third test for date only specification of time",
); # end: 77eb8502-2bca-4d92-89d9-7b39ace28dd5

is( # begin: c9d89a7d-06f8-4e28-a305-64f1b2abc693
    add_gigasecond("2015-01-24T22:00:00"),
    "2046-10-02T23:46:40",
    "full time specified",
); # end: c9d89a7d-06f8-4e28-a305-64f1b2abc693

is( # begin: 09d4e30e-728a-4b52-9005-be44a58d9eba
    add_gigasecond("2015-01-24T23:59:59"),
    "2046-10-03T01:46:39",
    "full time with day roll-over",
); # end: 09d4e30e-728a-4b52-9005-be44a58d9eba

done_testing;
