#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use Meetup qw(meetup);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 96;

imported_ok qw(meetup) or bail_out;

for my $case ( @{ $C_DATA->{cases} } ) {
  is meetup( $case->{input} ), $case->{expected},
    $case->{description};
}

__DATA__
{
  "exercise": "meetup",
  "version": "1.1.0",
  "cases": [
    {
      "description": "monteenth of May 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 5,
        "week": "teenth",
        "dayofweek": "Monday"
      },
      "expected": "2013-05-13"
    },
    {
      "description": "monteenth of August 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 8,
        "week": "teenth",
        "dayofweek": "Monday"
      },
      "expected": "2013-08-19"
    },
    {
      "description": "monteenth of September 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 9,
        "week": "teenth",
        "dayofweek": "Monday"
      },
      "expected": "2013-09-16"
    },
    {
      "description": "tuesteenth of March 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 3,
        "week": "teenth",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-03-19"
    },
    {
      "description": "tuesteenth of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "teenth",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-04-16"
    },
    {
      "description": "tuesteenth of August 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 8,
        "week": "teenth",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-08-13"
    },
    {
      "description": "wednesteenth of January 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 1,
        "week": "teenth",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-01-16"
    },
    {
      "description": "wednesteenth of February 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 2,
        "week": "teenth",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-02-13"
    },
    {
      "description": "wednesteenth of June 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 6,
        "week": "teenth",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-06-19"
    },
    {
      "description": "thursteenth of May 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 5,
        "week": "teenth",
        "dayofweek": "Thursday"
      },
      "expected": "2013-05-16"
    },
    {
      "description": "thursteenth of June 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 6,
        "week": "teenth",
        "dayofweek": "Thursday"
      },
      "expected": "2013-06-13"
    },
    {
      "description": "thursteenth of September 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 9,
        "week": "teenth",
        "dayofweek": "Thursday"
      },
      "expected": "2013-09-19"
    },
    {
      "description": "friteenth of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "teenth",
        "dayofweek": "Friday"
      },
      "expected": "2013-04-19"
    },
    {
      "description": "friteenth of August 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 8,
        "week": "teenth",
        "dayofweek": "Friday"
      },
      "expected": "2013-08-16"
    },
    {
      "description": "friteenth of September 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 9,
        "week": "teenth",
        "dayofweek": "Friday"
      },
      "expected": "2013-09-13"
    },
    {
      "description": "saturteenth of February 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 2,
        "week": "teenth",
        "dayofweek": "Saturday"
      },
      "expected": "2013-02-16"
    },
    {
      "description": "saturteenth of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "teenth",
        "dayofweek": "Saturday"
      },
      "expected": "2013-04-13"
    },
    {
      "description": "saturteenth of October 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 10,
        "week": "teenth",
        "dayofweek": "Saturday"
      },
      "expected": "2013-10-19"
    },
    {
      "description": "sunteenth of May 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 5,
        "week": "teenth",
        "dayofweek": "Sunday"
      },
      "expected": "2013-05-19"
    },
    {
      "description": "sunteenth of June 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 6,
        "week": "teenth",
        "dayofweek": "Sunday"
      },
      "expected": "2013-06-16"
    },
    {
      "description": "sunteenth of October 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 10,
        "week": "teenth",
        "dayofweek": "Sunday"
      },
      "expected": "2013-10-13"
    },
    {
      "description": "first Monday of March 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 3,
        "week": "first",
        "dayofweek": "Monday"
      },
      "expected": "2013-03-04"
    },
    {
      "description": "first Monday of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "first",
        "dayofweek": "Monday"
      },
      "expected": "2013-04-01"
    },
    {
      "description": "first Tuesday of May 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 5,
        "week": "first",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-05-07"
    },
    {
      "description": "first Tuesday of June 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 6,
        "week": "first",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-06-04"
    },
    {
      "description": "first Wednesday of July 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 7,
        "week": "first",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-07-03"
    },
    {
      "description": "first Wednesday of August 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 8,
        "week": "first",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-08-07"
    },
    {
      "description": "first Thursday of September 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 9,
        "week": "first",
        "dayofweek": "Thursday"
      },
      "expected": "2013-09-05"
    },
    {
      "description": "first Thursday of October 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 10,
        "week": "first",
        "dayofweek": "Thursday"
      },
      "expected": "2013-10-03"
    },
    {
      "description": "first Friday of November 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 11,
        "week": "first",
        "dayofweek": "Friday"
      },
      "expected": "2013-11-01"
    },
    {
      "description": "first Friday of December 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 12,
        "week": "first",
        "dayofweek": "Friday"
      },
      "expected": "2013-12-06"
    },
    {
      "description": "first Saturday of January 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 1,
        "week": "first",
        "dayofweek": "Saturday"
      },
      "expected": "2013-01-05"
    },
    {
      "description": "first Saturday of February 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 2,
        "week": "first",
        "dayofweek": "Saturday"
      },
      "expected": "2013-02-02"
    },
    {
      "description": "first Sunday of March 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 3,
        "week": "first",
        "dayofweek": "Sunday"
      },
      "expected": "2013-03-03"
    },
    {
      "description": "first Sunday of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "first",
        "dayofweek": "Sunday"
      },
      "expected": "2013-04-07"
    },
    {
      "description": "second Monday of March 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 3,
        "week": "second",
        "dayofweek": "Monday"
      },
      "expected": "2013-03-11"
    },
    {
      "description": "second Monday of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "second",
        "dayofweek": "Monday"
      },
      "expected": "2013-04-08"
    },
    {
      "description": "second Tuesday of May 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 5,
        "week": "second",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-05-14"
    },
    {
      "description": "second Tuesday of June 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 6,
        "week": "second",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-06-11"
    },
    {
      "description": "second Wednesday of July 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 7,
        "week": "second",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-07-10"
    },
    {
      "description": "second Wednesday of August 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 8,
        "week": "second",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-08-14"
    },
    {
      "description": "second Thursday of September 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 9,
        "week": "second",
        "dayofweek": "Thursday"
      },
      "expected": "2013-09-12"
    },
    {
      "description": "second Thursday of October 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 10,
        "week": "second",
        "dayofweek": "Thursday"
      },
      "expected": "2013-10-10"
    },
    {
      "description": "second Friday of November 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 11,
        "week": "second",
        "dayofweek": "Friday"
      },
      "expected": "2013-11-08"
    },
    {
      "description": "second Friday of December 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 12,
        "week": "second",
        "dayofweek": "Friday"
      },
      "expected": "2013-12-13"
    },
    {
      "description": "second Saturday of January 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 1,
        "week": "second",
        "dayofweek": "Saturday"
      },
      "expected": "2013-01-12"
    },
    {
      "description": "second Saturday of February 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 2,
        "week": "second",
        "dayofweek": "Saturday"
      },
      "expected": "2013-02-09"
    },
    {
      "description": "second Sunday of March 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 3,
        "week": "second",
        "dayofweek": "Sunday"
      },
      "expected": "2013-03-10"
    },
    {
      "description": "second Sunday of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "second",
        "dayofweek": "Sunday"
      },
      "expected": "2013-04-14"
    },
    {
      "description": "third Monday of March 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 3,
        "week": "third",
        "dayofweek": "Monday"
      },
      "expected": "2013-03-18"
    },
    {
      "description": "third Monday of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "third",
        "dayofweek": "Monday"
      },
      "expected": "2013-04-15"
    },
    {
      "description": "third Tuesday of May 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 5,
        "week": "third",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-05-21"
    },
    {
      "description": "third Tuesday of June 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 6,
        "week": "third",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-06-18"
    },
    {
      "description": "third Wednesday of July 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 7,
        "week": "third",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-07-17"
    },
    {
      "description": "third Wednesday of August 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 8,
        "week": "third",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-08-21"
    },
    {
      "description": "third Thursday of September 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 9,
        "week": "third",
        "dayofweek": "Thursday"
      },
      "expected": "2013-09-19"
    },
    {
      "description": "third Thursday of October 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 10,
        "week": "third",
        "dayofweek": "Thursday"
      },
      "expected": "2013-10-17"
    },
    {
      "description": "third Friday of November 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 11,
        "week": "third",
        "dayofweek": "Friday"
      },
      "expected": "2013-11-15"
    },
    {
      "description": "third Friday of December 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 12,
        "week": "third",
        "dayofweek": "Friday"
      },
      "expected": "2013-12-20"
    },
    {
      "description": "third Saturday of January 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 1,
        "week": "third",
        "dayofweek": "Saturday"
      },
      "expected": "2013-01-19"
    },
    {
      "description": "third Saturday of February 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 2,
        "week": "third",
        "dayofweek": "Saturday"
      },
      "expected": "2013-02-16"
    },
    {
      "description": "third Sunday of March 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 3,
        "week": "third",
        "dayofweek": "Sunday"
      },
      "expected": "2013-03-17"
    },
    {
      "description": "third Sunday of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "third",
        "dayofweek": "Sunday"
      },
      "expected": "2013-04-21"
    },
    {
      "description": "fourth Monday of March 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 3,
        "week": "fourth",
        "dayofweek": "Monday"
      },
      "expected": "2013-03-25"
    },
    {
      "description": "fourth Monday of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "fourth",
        "dayofweek": "Monday"
      },
      "expected": "2013-04-22"
    },
    {
      "description": "fourth Tuesday of May 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 5,
        "week": "fourth",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-05-28"
    },
    {
      "description": "fourth Tuesday of June 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 6,
        "week": "fourth",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-06-25"
    },
    {
      "description": "fourth Wednesday of July 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 7,
        "week": "fourth",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-07-24"
    },
    {
      "description": "fourth Wednesday of August 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 8,
        "week": "fourth",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-08-28"
    },
    {
      "description": "fourth Thursday of September 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 9,
        "week": "fourth",
        "dayofweek": "Thursday"
      },
      "expected": "2013-09-26"
    },
    {
      "description": "fourth Thursday of October 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 10,
        "week": "fourth",
        "dayofweek": "Thursday"
      },
      "expected": "2013-10-24"
    },
    {
      "description": "fourth Friday of November 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 11,
        "week": "fourth",
        "dayofweek": "Friday"
      },
      "expected": "2013-11-22"
    },
    {
      "description": "fourth Friday of December 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 12,
        "week": "fourth",
        "dayofweek": "Friday"
      },
      "expected": "2013-12-27"
    },
    {
      "description": "fourth Saturday of January 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 1,
        "week": "fourth",
        "dayofweek": "Saturday"
      },
      "expected": "2013-01-26"
    },
    {
      "description": "fourth Saturday of February 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 2,
        "week": "fourth",
        "dayofweek": "Saturday"
      },
      "expected": "2013-02-23"
    },
    {
      "description": "fourth Sunday of March 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 3,
        "week": "fourth",
        "dayofweek": "Sunday"
      },
      "expected": "2013-03-24"
    },
    {
      "description": "fourth Sunday of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "fourth",
        "dayofweek": "Sunday"
      },
      "expected": "2013-04-28"
    },
    {
      "description": "last Monday of March 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 3,
        "week": "last",
        "dayofweek": "Monday"
      },
      "expected": "2013-03-25"
    },
    {
      "description": "last Monday of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "last",
        "dayofweek": "Monday"
      },
      "expected": "2013-04-29"
    },
    {
      "description": "last Tuesday of May 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 5,
        "week": "last",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-05-28"
    },
    {
      "description": "last Tuesday of June 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 6,
        "week": "last",
        "dayofweek": "Tuesday"
      },
      "expected": "2013-06-25"
    },
    {
      "description": "last Wednesday of July 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 7,
        "week": "last",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-07-31"
    },
    {
      "description": "last Wednesday of August 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 8,
        "week": "last",
        "dayofweek": "Wednesday"
      },
      "expected": "2013-08-28"
    },
    {
      "description": "last Thursday of September 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 9,
        "week": "last",
        "dayofweek": "Thursday"
      },
      "expected": "2013-09-26"
    },
    {
      "description": "last Thursday of October 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 10,
        "week": "last",
        "dayofweek": "Thursday"
      },
      "expected": "2013-10-31"
    },
    {
      "description": "last Friday of November 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 11,
        "week": "last",
        "dayofweek": "Friday"
      },
      "expected": "2013-11-29"
    },
    {
      "description": "last Friday of December 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 12,
        "week": "last",
        "dayofweek": "Friday"
      },
      "expected": "2013-12-27"
    },
    {
      "description": "last Saturday of January 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 1,
        "week": "last",
        "dayofweek": "Saturday"
      },
      "expected": "2013-01-26"
    },
    {
      "description": "last Saturday of February 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 2,
        "week": "last",
        "dayofweek": "Saturday"
      },
      "expected": "2013-02-23"
    },
    {
      "description": "last Sunday of March 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 3,
        "week": "last",
        "dayofweek": "Sunday"
      },
      "expected": "2013-03-31"
    },
    {
      "description": "last Sunday of April 2013",
      "property": "meetup",
      "input": {
        "year": 2013,
        "month": 4,
        "week": "last",
        "dayofweek": "Sunday"
      },
      "expected": "2013-04-28"
    },
    {
      "description": "last Wednesday of February 2012",
      "property": "meetup",
      "input": {
        "year": 2012,
        "month": 2,
        "week": "last",
        "dayofweek": "Wednesday"
      },
      "expected": "2012-02-29"
    },
    {
      "description": "last Wednesday of December 2014",
      "property": "meetup",
      "input": {
        "year": 2014,
        "month": 12,
        "week": "last",
        "dayofweek": "Wednesday"
      },
      "expected": "2014-12-31"
    },
    {
      "description": "last Sunday of February 2015",
      "property": "meetup",
      "input": {
        "year": 2015,
        "month": 2,
        "week": "last",
        "dayofweek": "Sunday"
      },
      "expected": "2015-02-22"
    },
    {
      "description": "first Friday of December 2012",
      "property": "meetup",
      "input": {
        "year": 2012,
        "month": 12,
        "week": "first",
        "dayofweek": "Friday"
      },
      "expected": "2012-12-07"
    }
  ]
}
