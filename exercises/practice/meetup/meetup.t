#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Meetup qw<meetup>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 96;

imported_ok qw<meetup> or bail_out;

for my $case (@test_cases) {
  is meetup( $case->{input} ), $case->{expected},
    $case->{description};
}

__DATA__
[
  {
    "description": "monteenth of May 2013",
    "expected": "2013-05-13",
    "input": {
      "dayofweek": "Monday",
      "month": 5,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "monteenth of August 2013",
    "expected": "2013-08-19",
    "input": {
      "dayofweek": "Monday",
      "month": 8,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "monteenth of September 2013",
    "expected": "2013-09-16",
    "input": {
      "dayofweek": "Monday",
      "month": 9,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "tuesteenth of March 2013",
    "expected": "2013-03-19",
    "input": {
      "dayofweek": "Tuesday",
      "month": 3,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "tuesteenth of April 2013",
    "expected": "2013-04-16",
    "input": {
      "dayofweek": "Tuesday",
      "month": 4,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "tuesteenth of August 2013",
    "expected": "2013-08-13",
    "input": {
      "dayofweek": "Tuesday",
      "month": 8,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "wednesteenth of January 2013",
    "expected": "2013-01-16",
    "input": {
      "dayofweek": "Wednesday",
      "month": 1,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "wednesteenth of February 2013",
    "expected": "2013-02-13",
    "input": {
      "dayofweek": "Wednesday",
      "month": 2,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "wednesteenth of June 2013",
    "expected": "2013-06-19",
    "input": {
      "dayofweek": "Wednesday",
      "month": 6,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "thursteenth of May 2013",
    "expected": "2013-05-16",
    "input": {
      "dayofweek": "Thursday",
      "month": 5,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "thursteenth of June 2013",
    "expected": "2013-06-13",
    "input": {
      "dayofweek": "Thursday",
      "month": 6,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "thursteenth of September 2013",
    "expected": "2013-09-19",
    "input": {
      "dayofweek": "Thursday",
      "month": 9,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "friteenth of April 2013",
    "expected": "2013-04-19",
    "input": {
      "dayofweek": "Friday",
      "month": 4,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "friteenth of August 2013",
    "expected": "2013-08-16",
    "input": {
      "dayofweek": "Friday",
      "month": 8,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "friteenth of September 2013",
    "expected": "2013-09-13",
    "input": {
      "dayofweek": "Friday",
      "month": 9,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "saturteenth of February 2013",
    "expected": "2013-02-16",
    "input": {
      "dayofweek": "Saturday",
      "month": 2,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "saturteenth of April 2013",
    "expected": "2013-04-13",
    "input": {
      "dayofweek": "Saturday",
      "month": 4,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "saturteenth of October 2013",
    "expected": "2013-10-19",
    "input": {
      "dayofweek": "Saturday",
      "month": 10,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "sunteenth of May 2013",
    "expected": "2013-05-19",
    "input": {
      "dayofweek": "Sunday",
      "month": 5,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "sunteenth of June 2013",
    "expected": "2013-06-16",
    "input": {
      "dayofweek": "Sunday",
      "month": 6,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "sunteenth of October 2013",
    "expected": "2013-10-13",
    "input": {
      "dayofweek": "Sunday",
      "month": 10,
      "week": "teenth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Monday of March 2013",
    "expected": "2013-03-04",
    "input": {
      "dayofweek": "Monday",
      "month": 3,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Monday of April 2013",
    "expected": "2013-04-01",
    "input": {
      "dayofweek": "Monday",
      "month": 4,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Tuesday of May 2013",
    "expected": "2013-05-07",
    "input": {
      "dayofweek": "Tuesday",
      "month": 5,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Tuesday of June 2013",
    "expected": "2013-06-04",
    "input": {
      "dayofweek": "Tuesday",
      "month": 6,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Wednesday of July 2013",
    "expected": "2013-07-03",
    "input": {
      "dayofweek": "Wednesday",
      "month": 7,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Wednesday of August 2013",
    "expected": "2013-08-07",
    "input": {
      "dayofweek": "Wednesday",
      "month": 8,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Thursday of September 2013",
    "expected": "2013-09-05",
    "input": {
      "dayofweek": "Thursday",
      "month": 9,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Thursday of October 2013",
    "expected": "2013-10-03",
    "input": {
      "dayofweek": "Thursday",
      "month": 10,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Friday of November 2013",
    "expected": "2013-11-01",
    "input": {
      "dayofweek": "Friday",
      "month": 11,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Friday of December 2013",
    "expected": "2013-12-06",
    "input": {
      "dayofweek": "Friday",
      "month": 12,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Saturday of January 2013",
    "expected": "2013-01-05",
    "input": {
      "dayofweek": "Saturday",
      "month": 1,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Saturday of February 2013",
    "expected": "2013-02-02",
    "input": {
      "dayofweek": "Saturday",
      "month": 2,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Sunday of March 2013",
    "expected": "2013-03-03",
    "input": {
      "dayofweek": "Sunday",
      "month": 3,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "first Sunday of April 2013",
    "expected": "2013-04-07",
    "input": {
      "dayofweek": "Sunday",
      "month": 4,
      "week": "first",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Monday of March 2013",
    "expected": "2013-03-11",
    "input": {
      "dayofweek": "Monday",
      "month": 3,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Monday of April 2013",
    "expected": "2013-04-08",
    "input": {
      "dayofweek": "Monday",
      "month": 4,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Tuesday of May 2013",
    "expected": "2013-05-14",
    "input": {
      "dayofweek": "Tuesday",
      "month": 5,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Tuesday of June 2013",
    "expected": "2013-06-11",
    "input": {
      "dayofweek": "Tuesday",
      "month": 6,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Wednesday of July 2013",
    "expected": "2013-07-10",
    "input": {
      "dayofweek": "Wednesday",
      "month": 7,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Wednesday of August 2013",
    "expected": "2013-08-14",
    "input": {
      "dayofweek": "Wednesday",
      "month": 8,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Thursday of September 2013",
    "expected": "2013-09-12",
    "input": {
      "dayofweek": "Thursday",
      "month": 9,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Thursday of October 2013",
    "expected": "2013-10-10",
    "input": {
      "dayofweek": "Thursday",
      "month": 10,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Friday of November 2013",
    "expected": "2013-11-08",
    "input": {
      "dayofweek": "Friday",
      "month": 11,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Friday of December 2013",
    "expected": "2013-12-13",
    "input": {
      "dayofweek": "Friday",
      "month": 12,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Saturday of January 2013",
    "expected": "2013-01-12",
    "input": {
      "dayofweek": "Saturday",
      "month": 1,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Saturday of February 2013",
    "expected": "2013-02-09",
    "input": {
      "dayofweek": "Saturday",
      "month": 2,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Sunday of March 2013",
    "expected": "2013-03-10",
    "input": {
      "dayofweek": "Sunday",
      "month": 3,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "second Sunday of April 2013",
    "expected": "2013-04-14",
    "input": {
      "dayofweek": "Sunday",
      "month": 4,
      "week": "second",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Monday of March 2013",
    "expected": "2013-03-18",
    "input": {
      "dayofweek": "Monday",
      "month": 3,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Monday of April 2013",
    "expected": "2013-04-15",
    "input": {
      "dayofweek": "Monday",
      "month": 4,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Tuesday of May 2013",
    "expected": "2013-05-21",
    "input": {
      "dayofweek": "Tuesday",
      "month": 5,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Tuesday of June 2013",
    "expected": "2013-06-18",
    "input": {
      "dayofweek": "Tuesday",
      "month": 6,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Wednesday of July 2013",
    "expected": "2013-07-17",
    "input": {
      "dayofweek": "Wednesday",
      "month": 7,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Wednesday of August 2013",
    "expected": "2013-08-21",
    "input": {
      "dayofweek": "Wednesday",
      "month": 8,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Thursday of September 2013",
    "expected": "2013-09-19",
    "input": {
      "dayofweek": "Thursday",
      "month": 9,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Thursday of October 2013",
    "expected": "2013-10-17",
    "input": {
      "dayofweek": "Thursday",
      "month": 10,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Friday of November 2013",
    "expected": "2013-11-15",
    "input": {
      "dayofweek": "Friday",
      "month": 11,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Friday of December 2013",
    "expected": "2013-12-20",
    "input": {
      "dayofweek": "Friday",
      "month": 12,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Saturday of January 2013",
    "expected": "2013-01-19",
    "input": {
      "dayofweek": "Saturday",
      "month": 1,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Saturday of February 2013",
    "expected": "2013-02-16",
    "input": {
      "dayofweek": "Saturday",
      "month": 2,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Sunday of March 2013",
    "expected": "2013-03-17",
    "input": {
      "dayofweek": "Sunday",
      "month": 3,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "third Sunday of April 2013",
    "expected": "2013-04-21",
    "input": {
      "dayofweek": "Sunday",
      "month": 4,
      "week": "third",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Monday of March 2013",
    "expected": "2013-03-25",
    "input": {
      "dayofweek": "Monday",
      "month": 3,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Monday of April 2013",
    "expected": "2013-04-22",
    "input": {
      "dayofweek": "Monday",
      "month": 4,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Tuesday of May 2013",
    "expected": "2013-05-28",
    "input": {
      "dayofweek": "Tuesday",
      "month": 5,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Tuesday of June 2013",
    "expected": "2013-06-25",
    "input": {
      "dayofweek": "Tuesday",
      "month": 6,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Wednesday of July 2013",
    "expected": "2013-07-24",
    "input": {
      "dayofweek": "Wednesday",
      "month": 7,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Wednesday of August 2013",
    "expected": "2013-08-28",
    "input": {
      "dayofweek": "Wednesday",
      "month": 8,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Thursday of September 2013",
    "expected": "2013-09-26",
    "input": {
      "dayofweek": "Thursday",
      "month": 9,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Thursday of October 2013",
    "expected": "2013-10-24",
    "input": {
      "dayofweek": "Thursday",
      "month": 10,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Friday of November 2013",
    "expected": "2013-11-22",
    "input": {
      "dayofweek": "Friday",
      "month": 11,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Friday of December 2013",
    "expected": "2013-12-27",
    "input": {
      "dayofweek": "Friday",
      "month": 12,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Saturday of January 2013",
    "expected": "2013-01-26",
    "input": {
      "dayofweek": "Saturday",
      "month": 1,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Saturday of February 2013",
    "expected": "2013-02-23",
    "input": {
      "dayofweek": "Saturday",
      "month": 2,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Sunday of March 2013",
    "expected": "2013-03-24",
    "input": {
      "dayofweek": "Sunday",
      "month": 3,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "fourth Sunday of April 2013",
    "expected": "2013-04-28",
    "input": {
      "dayofweek": "Sunday",
      "month": 4,
      "week": "fourth",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Monday of March 2013",
    "expected": "2013-03-25",
    "input": {
      "dayofweek": "Monday",
      "month": 3,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Monday of April 2013",
    "expected": "2013-04-29",
    "input": {
      "dayofweek": "Monday",
      "month": 4,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Tuesday of May 2013",
    "expected": "2013-05-28",
    "input": {
      "dayofweek": "Tuesday",
      "month": 5,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Tuesday of June 2013",
    "expected": "2013-06-25",
    "input": {
      "dayofweek": "Tuesday",
      "month": 6,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Wednesday of July 2013",
    "expected": "2013-07-31",
    "input": {
      "dayofweek": "Wednesday",
      "month": 7,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Wednesday of August 2013",
    "expected": "2013-08-28",
    "input": {
      "dayofweek": "Wednesday",
      "month": 8,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Thursday of September 2013",
    "expected": "2013-09-26",
    "input": {
      "dayofweek": "Thursday",
      "month": 9,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Thursday of October 2013",
    "expected": "2013-10-31",
    "input": {
      "dayofweek": "Thursday",
      "month": 10,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Friday of November 2013",
    "expected": "2013-11-29",
    "input": {
      "dayofweek": "Friday",
      "month": 11,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Friday of December 2013",
    "expected": "2013-12-27",
    "input": {
      "dayofweek": "Friday",
      "month": 12,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Saturday of January 2013",
    "expected": "2013-01-26",
    "input": {
      "dayofweek": "Saturday",
      "month": 1,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Saturday of February 2013",
    "expected": "2013-02-23",
    "input": {
      "dayofweek": "Saturday",
      "month": 2,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Sunday of March 2013",
    "expected": "2013-03-31",
    "input": {
      "dayofweek": "Sunday",
      "month": 3,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Sunday of April 2013",
    "expected": "2013-04-28",
    "input": {
      "dayofweek": "Sunday",
      "month": 4,
      "week": "last",
      "year": 2013
    },
    "property": "meetup"
  },
  {
    "description": "last Wednesday of February 2012",
    "expected": "2012-02-29",
    "input": {
      "dayofweek": "Wednesday",
      "month": 2,
      "week": "last",
      "year": 2012
    },
    "property": "meetup"
  },
  {
    "description": "last Wednesday of December 2014",
    "expected": "2014-12-31",
    "input": {
      "dayofweek": "Wednesday",
      "month": 12,
      "week": "last",
      "year": 2014
    },
    "property": "meetup"
  },
  {
    "description": "last Sunday of February 2015",
    "expected": "2015-02-22",
    "input": {
      "dayofweek": "Sunday",
      "month": 2,
      "week": "last",
      "year": 2015
    },
    "property": "meetup"
  },
  {
    "description": "first Friday of December 2012",
    "expected": "2012-12-07",
    "input": {
      "dayofweek": "Friday",
      "month": 12,
      "week": "first",
      "year": 2012
    },
    "property": "meetup"
  }
]
