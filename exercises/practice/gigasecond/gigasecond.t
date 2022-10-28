#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Gigasecond qw<add_gigasecond>;

imported_ok qw<add_gigasecond> or bail_out;

is( add_gigasecond("2011-04-25"),
    "2043-01-01T01:46:40", "date only specification of time",
);

is( add_gigasecond("1977-06-13"),
    "2009-02-19T01:46:40", "second test for date only specification of time",
);

is( add_gigasecond("1959-07-19"),
    "1991-03-27T01:46:40", "third test for date only specification of time",
);

is( add_gigasecond("2015-01-24T22:00:00"),
    "2046-10-02T23:46:40", "full time specified",
);

is( add_gigasecond("2015-01-24T23:59:59"),
    "2046-10-03T01:46:39", "full time with day roll-over",
);

done_testing;
