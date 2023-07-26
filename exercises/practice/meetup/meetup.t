#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Meetup qw<meetup>;

is(
    meetup("Teenth Monday of May 2013"),
    "2013-05-13",
    "when teenth Monday is the 13th, the first day of the teenth week",
);

is(
    meetup("Teenth Monday of August 2013"),
    "2013-08-19",
    "when teenth Monday is the 19th, the last day of the teenth week",
);

is(
    meetup("Teenth Monday of September 2013"),
    "2013-09-16",
    "when teenth Monday is some day in the middle of the teenth week",
);

is(
    meetup("Teenth Tuesday of March 2013"),
    "2013-03-19",
    "when teenth Tuesday is the 19th, the last day of the teenth week",
);

is(
    meetup("Teenth Tuesday of April 2013"),
    "2013-04-16",
    "when teenth Tuesday is some day in the middle of the teenth week",
);

is(
    meetup("Teenth Tuesday of August 2013"),
    "2013-08-13",
    "when teenth Tuesday is the 13th, the first day of the teenth week",
);

is(
    meetup("Teenth Wednesday of January 2013"),
    "2013-01-16",
    "when teenth Wednesday is some day in the middle of the teenth week",
);

is(
    meetup("Teenth Wednesday of February 2013"),
    "2013-02-13",
    "when teenth Wednesday is the 13th, the first day of the teenth week",
);

is(
    meetup("Teenth Wednesday of June 2013"),
    "2013-06-19",
    "when teenth Wednesday is the 19th, the last day of the teenth week",
);

is(
    meetup("Teenth Thursday of May 2013"),
    "2013-05-16",
    "when teenth Thursday is some day in the middle of the teenth week",
);

is(
    meetup("Teenth Thursday of June 2013"),
    "2013-06-13",
    "when teenth Thursday is the 13th, the first day of the teenth week",
);

is(
    meetup("Teenth Thursday of September 2013"),
    "2013-09-19",
    "when teenth Thursday is the 19th, the last day of the teenth week",
);

is(
    meetup("Teenth Friday of April 2013"),
    "2013-04-19",
    "when teenth Friday is the 19th, the last day of the teenth week",
);

is(
    meetup("Teenth Friday of August 2013"),
    "2013-08-16",
    "when teenth Friday is some day in the middle of the teenth week",
);

is(
    meetup("Teenth Friday of September 2013"),
    "2013-09-13",
    "when teenth Friday is the 13th, the first day of the teenth week",
);

is(
    meetup("Teenth Saturday of February 2013"),
    "2013-02-16",
    "when teenth Saturday is some day in the middle of the teenth week",
);

is(
    meetup("Teenth Saturday of April 2013"),
    "2013-04-13",
    "when teenth Saturday is the 13th, the first day of the teenth week",
);

is(
    meetup("Teenth Saturday of October 2013"),
    "2013-10-19",
    "when teenth Saturday is the 19th, the last day of the teenth week",
);

is(
    meetup("Teenth Sunday of May 2013"),
    "2013-05-19",
    "when teenth Sunday is the 19th, the last day of the teenth week",
);

is(
    meetup("Teenth Sunday of June 2013"),
    "2013-06-16",
    "when teenth Sunday is some day in the middle of the teenth week",
);

is(
    meetup("Teenth Sunday of October 2013"),
    "2013-10-13",
    "when teenth Sunday is the 13th, the first day of the teenth week",
);

is(
    meetup("First Monday of March 2013"),
    "2013-03-04",
    "when first Monday is some day in the middle of the first week",
);

is(
    meetup("First Monday of April 2013"),
    "2013-04-01",
    "when first Monday is the 1st, the first day of the first week",
);

is(
    meetup("First Tuesday of May 2013"),
    "2013-05-07",
    "when first Tuesday is the 7th, the last day of the first week",
);

is(
    meetup("First Tuesday of June 2013"),
    "2013-06-04",
    "when first Tuesday is some day in the middle of the first week",
);

is(
    meetup("First Wednesday of July 2013"),
    "2013-07-03",
    "when first Wednesday is some day in the middle of the first week",
);

is(
    meetup("First Wednesday of August 2013"),
    "2013-08-07",
    "when first Wednesday is the 7th, the last day of the first week",
);

is(
    meetup("First Thursday of September 2013"),
    "2013-09-05",
    "when first Thursday is some day in the middle of the first week",
);

is(
    meetup("First Thursday of October 2013"),
    "2013-10-03",
    "when first Thursday is another day in the middle of the first week",
);

is(
    meetup("First Friday of November 2013"),
    "2013-11-01",
    "when first Friday is the 1st, the first day of the first week",
);

is(
    meetup("First Friday of December 2013"),
    "2013-12-06",
    "when first Friday is some day in the middle of the first week",
);

is(
    meetup("First Saturday of January 2013"),
    "2013-01-05",
    "when first Saturday is some day in the middle of the first week",
);

is(
    meetup("First Saturday of February 2013"),
    "2013-02-02",
    "when first Saturday is another day in the middle of the first week",
);

is(
    meetup("First Sunday of March 2013"),
    "2013-03-03",
    "when first Sunday is some day in the middle of the first week",
);

is(
    meetup("First Sunday of April 2013"),
    "2013-04-07",
    "when first Sunday is the 7th, the last day of the first week",
);

is(
    meetup("Second Monday of March 2013"),
    "2013-03-11",
    "when second Monday is some day in the middle of the second week",
);

is(
    meetup("Second Monday of April 2013"),
    "2013-04-08",
    "when second Monday is the 8th, the first day of the second week",
);

is(
    meetup("Second Tuesday of May 2013"),
    "2013-05-14",
    "when second Tuesday is the 14th, the last day of the second week",
);

is(
    meetup("Second Tuesday of June 2013"),
    "2013-06-11",
    "when second Tuesday is some day in the middle of the second week",
);

is(
    meetup("Second Wednesday of July 2013"),
    "2013-07-10",
    "when second Wednesday is some day in the middle of the second week",
);

is(
    meetup("Second Wednesday of August 2013"),
    "2013-08-14",
    "when second Wednesday is the 14th, the last day of the second week",
);

is(
    meetup("Second Thursday of September 2013"),
    "2013-09-12",
    "when second Thursday is some day in the middle of the second week",
);

is(
    meetup("Second Thursday of October 2013"),
    "2013-10-10",
    "when second Thursday is another day in the middle of the second week",
);

is(
    meetup("Second Friday of November 2013"),
    "2013-11-08",
    "when second Friday is the 8th, the first day of the second week",
);

is(
    meetup("Second Friday of December 2013"),
    "2013-12-13",
    "when second Friday is some day in the middle of the second week",
);

is(
    meetup("Second Saturday of January 2013"),
    "2013-01-12",
    "when second Saturday is some day in the middle of the second week",
);

is(
    meetup("Second Saturday of February 2013"),
    "2013-02-09",
    "when second Saturday is another day in the middle of the second week",
);

is(
    meetup("Second Sunday of March 2013"),
    "2013-03-10",
    "when second Sunday is some day in the middle of the second week",
);

is(
    meetup("Second Sunday of April 2013"),
    "2013-04-14",
    "when second Sunday is the 14th, the last day of the second week",
);

is(
    meetup("Third Monday of March 2013"),
    "2013-03-18",
    "when third Monday is some day in the middle of the third week",
);

is(
    meetup("Third Monday of April 2013"),
    "2013-04-15",
    "when third Monday is the 15th, the first day of the third week",
);

is(
    meetup("Third Tuesday of May 2013"),
    "2013-05-21",
    "when third Tuesday is the 21st, the last day of the third week",
);

is(
    meetup("Third Tuesday of June 2013"),
    "2013-06-18",
    "when third Tuesday is some day in the middle of the third week",
);

is(
    meetup("Third Wednesday of July 2013"),
    "2013-07-17",
    "when third Wednesday is some day in the middle of the third week",
);

is(
    meetup("Third Wednesday of August 2013"),
    "2013-08-21",
    "when third Wednesday is the 21st, the last day of the third week",
);

is(
    meetup("Third Thursday of September 2013"),
    "2013-09-19",
    "when third Thursday is some day in the middle of the third week",
);

is(
    meetup("Third Thursday of October 2013"),
    "2013-10-17",
    "when third Thursday is another day in the middle of the third week",
);

is(
    meetup("Third Friday of November 2013"),
    "2013-11-15",
    "when third Friday is the 15th, the first day of the third week",
);

is(
    meetup("Third Friday of December 2013"),
    "2013-12-20",
    "when third Friday is some day in the middle of the third week",
);

is(
    meetup("Third Saturday of January 2013"),
    "2013-01-19",
    "when third Saturday is some day in the middle of the third week",
);

is(
    meetup("Third Saturday of February 2013"),
    "2013-02-16",
    "when third Saturday is another day in the middle of the third week",
);

is(
    meetup("Third Sunday of March 2013"),
    "2013-03-17",
    "when third Sunday is some day in the middle of the third week",
);

is(
    meetup("Third Sunday of April 2013"),
    "2013-04-21",
    "when third Sunday is the 21st, the last day of the third week",
);

is(
    meetup("Fourth Monday of March 2013"),
    "2013-03-25",
    "when fourth Monday is some day in the middle of the fourth week",
);

is(
    meetup("Fourth Monday of April 2013"),
    "2013-04-22",
    "when fourth Monday is the 22nd, the first day of the fourth week",
);

is(
    meetup("Fourth Tuesday of May 2013"),
    "2013-05-28",
    "when fourth Tuesday is the 28th, the last day of the fourth week",
);

is(
    meetup("Fourth Tuesday of June 2013"),
    "2013-06-25",
    "when fourth Tuesday is some day in the middle of the fourth week",
);

is(
    meetup("Fourth Wednesday of July 2013"),
    "2013-07-24",
    "when fourth Wednesday is some day in the middle of the fourth week",
);

is(
    meetup("Fourth Wednesday of August 2013"),
    "2013-08-28",
    "when fourth Wednesday is the 28th, the last day of the fourth week",
);

is(
    meetup("Fourth Thursday of September 2013"),
    "2013-09-26",
    "when fourth Thursday is some day in the middle of the fourth week",
);

is(
    meetup("Fourth Thursday of October 2013"),
    "2013-10-24",
    "when fourth Thursday is another day in the middle of the fourth week",
);

is(
    meetup("Fourth Friday of November 2013"),
    "2013-11-22",
    "when fourth Friday is the 22nd, the first day of the fourth week",
);

is(
    meetup("Fourth Friday of December 2013"),
    "2013-12-27",
    "when fourth Friday is some day in the middle of the fourth week",
);

is(
    meetup("Fourth Saturday of January 2013"),
    "2013-01-26",
    "when fourth Saturday is some day in the middle of the fourth week",
);

is(
    meetup("Fourth Saturday of February 2013"),
    "2013-02-23",
    "when fourth Saturday is another day in the middle of the fourth week",
);

is(
    meetup("Fourth Sunday of March 2013"),
    "2013-03-24",
    "when fourth Sunday is some day in the middle of the fourth week",
);

is(
    meetup("Fourth Sunday of April 2013"),
    "2013-04-28",
    "when fourth Sunday is the 28th, the last day of the fourth week",
);

is(
    meetup("Last Monday of March 2013"),
    "2013-03-25",
    "last Monday in a month with four Mondays",
);

is(
    meetup("Last Monday of April 2013"),
    "2013-04-29",
    "last Monday in a month with five Mondays",
);

is(
    meetup("Last Tuesday of May 2013"),
    "2013-05-28",
    "last Tuesday in a month with four Tuesdays",
);

is(
    meetup("Last Tuesday of June 2013"),
    "2013-06-25",
    "last Tuesday in another month with four Tuesdays",
);

is(
    meetup("Last Wednesday of July 2013"),
    "2013-07-31",
    "last Wednesday in a month with five Wednesdays",
);

is(
    meetup("Last Wednesday of August 2013"),
    "2013-08-28",
    "last Wednesday in a month with four Wednesdays",
);

is(
    meetup("Last Thursday of September 2013"),
    "2013-09-26",
    "last Thursday in a month with four Thursdays",
);

is(
    meetup("Last Thursday of October 2013"),
    "2013-10-31",
    "last Thursday in a month with five Thursdays",
);

is(
    meetup("Last Friday of November 2013"),
    "2013-11-29",
    "last Friday in a month with five Fridays",
);

is(
    meetup("Last Friday of December 2013"),
    "2013-12-27",
    "last Friday in a month with four Fridays",
);

is(
    meetup("Last Saturday of January 2013"),
    "2013-01-26",
    "last Saturday in a month with four Saturdays",
);

is(
    meetup("Last Saturday of February 2013"),
    "2013-02-23",
    "last Saturday in another month with four Saturdays",
);

is(
    meetup("Last Sunday of March 2013"),
    "2013-03-31",
    "last Sunday in a month with five Sundays",
);

is(
    meetup("Last Sunday of April 2013"),
    "2013-04-28",
    "last Sunday in a month with four Sundays",
);

is(
    meetup("Last Wednesday of February 2012"),
    "2012-02-29",
    "when last Wednesday in February in a leap year is the 29th",
);

is(
    meetup("Last Wednesday of December 2014"),
    "2014-12-31",
    "last Wednesday in December that is also the last day of the year",
);

is(
    meetup("Last Sunday of February 2015"),
    "2015-02-22",
    "when last Sunday in February in a non-leap year is not the 29th",
);

is(
    meetup("First Friday of December 2012"),
    "2012-12-07",
    "when first Friday is the 7th, the last day of the first week",
);

done_testing;
