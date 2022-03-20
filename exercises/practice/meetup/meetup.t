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

use constant MONTHS => qw<
  January February March     April   May      June
  July    August   September October November December
>;

for my $case (@test_cases) {
  my $input_string = sprintf( '%s %s of %s %u',
    ucfirst( $case->{input}{week} ),
    $case->{input}{dayofweek},
    (MONTHS)[ $case->{input}{month} - 1 ],
    $case->{input}{year} );

  is meetup($input_string), $case->{expected}, $case->{description};
}

__DATA__
[
  {
    "description": "when teenth Monday is the 13th, the first day of the teenth week",
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
    "description": "when teenth Monday is the 19th, the last day of the teenth week",
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
    "description": "when teenth Monday is some day in the middle of the teenth week",
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
    "description": "when teenth Tuesday is the 19th, the last day of the teenth week",
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
    "description": "when teenth Tuesday is some day in the middle of the teenth week",
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
    "description": "when teenth Tuesday is the 13th, the first day of the teenth week",
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
    "description": "when teenth Wednesday is some day in the middle of the teenth week",
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
    "description": "when teenth Wednesday is the 13th, the first day of the teenth week",
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
    "description": "when teenth Wednesday is the 19th, the last day of the teenth week",
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
    "description": "when teenth Thursday is some day in the middle of the teenth week",
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
    "description": "when teenth Thursday is the 13th, the first day of the teenth week",
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
    "description": "when teenth Thursday is the 19th, the last day of the teenth week",
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
    "description": "when teenth Friday is the 19th, the last day of the teenth week",
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
    "description": "when teenth Friday is some day in the middle of the teenth week",
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
    "description": "when teenth Friday is the 13th, the first day of the teenth week",
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
    "description": "when teenth Saturday is some day in the middle of the teenth week",
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
    "description": "when teenth Saturday is the 13th, the first day of the teenth week",
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
    "description": "when teenth Saturday is the 19th, the last day of the teenth week",
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
    "description": "when teenth Sunday is the 19th, the last day of the teenth week",
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
    "description": "when teenth Sunday is some day in the middle of the teenth week",
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
    "description": "when teenth Sunday is the 13th, the first day of the teenth week",
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
    "description": "when first Monday is some day in the middle of the first week",
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
    "description": "when first Monday is the 1st, the first day of the first week",
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
    "description": "when first Tuesday is the 7th, the last day of the first week",
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
    "description": "when first Tuesday is some day in the middle of the first week",
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
    "description": "when first Wednesday is some day in the middle of the first week",
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
    "description": "when first Wednesday is the 7th, the last day of the first week",
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
    "description": "when first Thursday is some day in the middle of the first week",
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
    "description": "when first Thursday is another day in the middle of the first week",
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
    "description": "when first Friday is the 1st, the first day of the first week",
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
    "description": "when first Friday is some day in the middle of the first week",
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
    "description": "when first Saturday is some day in the middle of the first week",
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
    "description": "when first Saturday is another day in the middle of the first week",
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
    "description": "when first Sunday is some day in the middle of the first week",
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
    "description": "when first Sunday is the 7th, the last day of the first week",
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
    "description": "when second Monday is some day in the middle of the second week",
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
    "description": "when second Monday is the 8th, the first day of the second week",
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
    "description": "when second Tuesday is the 14th, the last day of the second week",
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
    "description": "when second Tuesday is some day in the middle of the second week",
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
    "description": "when second Wednesday is some day in the middle of the second week",
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
    "description": "when second Wednesday is the 14th, the last day of the second week",
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
    "description": "when second Thursday is some day in the middle of the second week",
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
    "description": "when second Thursday is another day in the middle of the second week",
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
    "description": "when second Friday is the 8th, the first day of the second week",
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
    "description": "when second Friday is some day in the middle of the second week",
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
    "description": "when second Saturday is some day in the middle of the second week",
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
    "description": "when second Saturday is another day in the middle of the second week",
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
    "description": "when second Sunday is some day in the middle of the second week",
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
    "description": "when second Sunday is the 14th, the last day of the second week",
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
    "description": "when third Monday is some day in the middle of the third week",
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
    "description": "when third Monday is the 15th, the first day of the third week",
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
    "description": "when third Tuesday is the 21st, the last day of the third week",
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
    "description": "when third Tuesday is some day in the middle of the third week",
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
    "description": "when third Wednesday is some day in the middle of the third week",
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
    "description": "when third Wednesday is the 21st, the last day of the third week",
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
    "description": "when third Thursday is some day in the middle of the third week",
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
    "description": "when third Thursday is another day in the middle of the third week",
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
    "description": "when third Friday is the 15th, the first day of the third week",
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
    "description": "when third Friday is some day in the middle of the third week",
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
    "description": "when third Saturday is some day in the middle of the third week",
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
    "description": "when third Saturday is another day in the middle of the third week",
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
    "description": "when third Sunday is some day in the middle of the third week",
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
    "description": "when third Sunday is the 21st, the last day of the third week",
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
    "description": "when fourth Monday is some day in the middle of the fourth week",
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
    "description": "when fourth Monday is the 22nd, the first day of the fourth week",
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
    "description": "when fourth Tuesday is the 28th, the last day of the fourth week",
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
    "description": "when fourth Tuesday is some day in the middle of the fourth week",
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
    "description": "when fourth Wednesday is some day in the middle of the fourth week",
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
    "description": "when fourth Wednesday is the 28th, the last day of the fourth week",
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
    "description": "when fourth Thursday is some day in the middle of the fourth week",
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
    "description": "when fourth Thursday is another day in the middle of the fourth week",
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
    "description": "when fourth Friday is the 22nd, the first day of the fourth week",
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
    "description": "when fourth Friday is some day in the middle of the fourth week",
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
    "description": "when fourth Saturday is some day in the middle of the fourth week",
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
    "description": "when fourth Saturday is another day in the middle of the fourth week",
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
    "description": "when fourth Sunday is some day in the middle of the fourth week",
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
    "description": "when fourth Sunday is the 28th, the last day of the fourth week",
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
    "description": "last Monday in a month with four Mondays",
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
    "description": "last Monday in a month with five Mondays",
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
    "description": "last Tuesday in a month with four Tuesdays",
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
    "description": "last Tuesday in another month with four Tuesdays",
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
    "description": "last Wednesday in a month with five Wednesdays",
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
    "description": "last Wednesday in a month with four Wednesdays",
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
    "description": "last Thursday in a month with four Thursdays",
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
    "description": "last Thursday in a month with five Thursdays",
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
    "description": "last Friday in a month with five Fridays",
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
    "description": "last Friday in a month with four Fridays",
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
    "description": "last Saturday in a month with four Saturdays",
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
    "description": "last Saturday in another month with four Saturdays",
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
    "description": "last Sunday in a month with five Sundays",
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
    "description": "last Sunday in a month with four Sundays",
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
    "description": "when last Wednesday in February in a leap year is the 29th",
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
    "description": "last Wednesday in December that is also the last day of the year",
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
    "description": "when last Sunday in February in a non-leap year is not the 29th",
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
    "description": "when first Friday is the 7th, the last day of the first week",
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
