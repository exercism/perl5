#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Clock ();

can_ok 'Clock', qw<new time add_minutes subtract_minutes> or bail_out;

my $todo;

is(
    Clock->new( hour => 8, minute => 0 )->time,
    "08:00",
    "Create a new clock with an initial time: on the hour",
);

is(
    Clock->new( hour => 11, minute => 9 )->time,
    "11:09",
    "Create a new clock with an initial time: past the hour",
);

is(
    Clock->new( hour => 24, minute => 0 )->time,
    "00:00",
    "Create a new clock with an initial time: midnight is zero hours",
);

is(
    Clock->new( hour => 25, minute => 0 )->time,
    "01:00",
    "Create a new clock with an initial time: hour rolls over",
);

is(
    Clock->new( hour => 100, minute => 0 )->time,
    "04:00",
    "Create a new clock with an initial time: hour rolls over continuously",
);

is(
    Clock->new( hour => 1, minute => 60 )->time,
    "02:00",
    "Create a new clock with an initial time: sixty minutes is next hour",
);

is(
    Clock->new( hour => 0, minute => 160 )->time,
    "02:40",
    "Create a new clock with an initial time: minutes roll over",
);

is(
    Clock->new( hour => 0, minute => 1723 )->time,
    "04:43",
    "Create a new clock with an initial time: minutes roll over continuously",
);

is(
    Clock->new( hour => 25, minute => 160 )->time,
    "03:40",
    "Create a new clock with an initial time: hour and minutes roll over",
);

is(
    Clock->new( hour => 201, minute => 3001 )->time,
    "11:01",
    "Create a new clock with an initial time: hour and minutes roll over continuously",
);

is(
    Clock->new( hour => 72, minute => 8640 )->time,
    "00:00",
    "Create a new clock with an initial time: hour and minutes roll over to exactly midnight",
);

is(
    Clock->new( hour => -1, minute => 15 )->time,
    "23:15",
    "Create a new clock with an initial time: negative hour",
);

is(
    Clock->new( hour => -25, minute => 0 )->time,
    "23:00",
    "Create a new clock with an initial time: negative hour rolls over",
);

is(
    Clock->new( hour => -91, minute => 0 )->time,
    "05:00",
    "Create a new clock with an initial time: negative hour rolls over continuously",
);

is(
    Clock->new( hour => 1, minute => -40 )->time,
    "00:20",
    "Create a new clock with an initial time: negative minutes",
);

is(
    Clock->new( hour => 1, minute => -160 )->time,
    "22:20",
    "Create a new clock with an initial time: negative minutes roll over",
);

is(
    Clock->new( hour => 1, minute => -4820 )->time,
    "16:40",
    "Create a new clock with an initial time: negative minutes roll over continuously",
);

is(
    Clock->new( hour => 2, minute => -60 )->time,
    "01:00",
    "Create a new clock with an initial time: negative sixty minutes is previous hour",
);

is(
    Clock->new( hour => -25, minute => -160 )->time,
    "20:20",
    "Create a new clock with an initial time: negative hour and minutes both roll over",
);

is(
    Clock->new( hour => -121, minute => -5810 )->time,
    "22:10",
    "Create a new clock with an initial time: negative hour and minutes both roll over continuously",
);

is(
    Clock->new( hour => 10, minute => 0 )->add_minutes(3)->time,
    "10:03",
    "Add minutes: add minutes",
);

is(
    Clock->new( hour => 6, minute => 41 )->add_minutes(0)->time,
    "06:41",
    "Add minutes: add no minutes",
);

is(
    Clock->new( hour => 0, minute => 45 )->add_minutes(40)->time,
    "01:25",
    "Add minutes: add to next hour",
);

is(
    Clock->new( hour => 10, minute => 0 )->add_minutes(61)->time,
    "11:01",
    "Add minutes: add more than one hour",
);

is(
    Clock->new( hour => 0, minute => 45 )->add_minutes(160)->time,
    "03:25",
    "Add minutes: add more than two hours with carry",
);

is(
    Clock->new( hour => 23, minute => 59 )->add_minutes(2)->time,
    "00:01",
    "Add minutes: add across midnight",
);

is(
    Clock->new( hour => 5, minute => 32 )->add_minutes(1500)->time,
    "06:32",
    "Add minutes: add more than one day (1500 min = 25 hrs)",
);

is(
    Clock->new( hour => 1, minute => 1 )->add_minutes(3500)->time,
    "11:21",
    "Add minutes: add more than two days",
);

is(
    Clock->new( hour => 10, minute => 3 )->subtract_minutes(3)->time,
    "10:00",
    "Subtract minutes: subtract minutes",
);

is(
    Clock->new( hour => 10, minute => 3 )->subtract_minutes(30)->time,
    "09:33",
    "Subtract minutes: subtract to previous hour",
);

is(
    Clock->new( hour => 10, minute => 3 )->subtract_minutes(70)->time,
    "08:53",
    "Subtract minutes: subtract more than an hour",
);

is(
    Clock->new( hour => 0, minute => 3 )->subtract_minutes(4)->time,
    "23:59",
    "Subtract minutes: subtract across midnight",
);

is(
    Clock->new( hour => 0, minute => 0 )->subtract_minutes(160)->time,
    "21:20",
    "Subtract minutes: subtract more than two hours",
);

is(
    Clock->new( hour => 6, minute => 15 )->subtract_minutes(160)->time,
    "03:35",
    "Subtract minutes: subtract more than two hours with borrow",
);

is(
    Clock->new( hour => 5, minute => 32 )->subtract_minutes(1500)->time,
    "04:32",
    "Subtract minutes: subtract more than one day (1500 min = 25 hrs)",
);

is(
    Clock->new( hour => 2, minute => 20 )->subtract_minutes(3000)->time,
    "00:20",
    "Subtract minutes: subtract more than two days",
);

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 15, minute => 37 ),
    Clock->new( hour => 15, minute => 37 ),
    "Compare two clocks for equality: clocks with same time",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
isnt(
    Clock->new( hour => 15, minute => 36 ),
    Clock->new( hour => 15, minute => 37 ),
    "Compare two clocks for equality: clocks a minute apart",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
isnt(
    Clock->new( hour => 14, minute => 37 ),
    Clock->new( hour => 15, minute => 37 ),
    "Compare two clocks for equality: clocks an hour apart",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 10, minute => 37 ),
    Clock->new( hour => 34, minute => 37 ),
    "Compare two clocks for equality: clocks with hour overflow",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 3,  minute => 11 ),
    Clock->new( hour => 99, minute => 11 ),
    "Compare two clocks for equality: clocks with hour overflow by several days",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 22, minute => 40 ),
    Clock->new( hour => -2, minute => 40 ),
    "Compare two clocks for equality: clocks with negative hour",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 17,  minute => 3 ),
    Clock->new( hour => -31, minute => 3 ),
    "Compare two clocks for equality: clocks with negative hour that wraps",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 13,  minute => 49 ),
    Clock->new( hour => -83, minute => 49 ),
    "Compare two clocks for equality: clocks with negative hour that wraps multiple times",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 0, minute => 1 ),
    Clock->new( hour => 0, minute => 1441 ),
    "Compare two clocks for equality: clocks with minute overflow",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 2, minute => 2 ),
    Clock->new( hour => 2, minute => 4322 ),
    "Compare two clocks for equality: clocks with minute overflow by several days",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 2, minute => 40 ),
    Clock->new( hour => 3, minute => -20 ),
    "Compare two clocks for equality: clocks with negative minute",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 4, minute => 10 ),
    Clock->new( hour => 5, minute => -1490 ),
    "Compare two clocks for equality: clocks with negative minute that wraps",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 6, minute => 15 ),
    Clock->new( hour => 6, minute => -4305 ),
    "Compare two clocks for equality: clocks with negative minute that wraps multiple times",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 7,   minute => 32 ),
    Clock->new( hour => -12, minute => -268 ),
    "Compare two clocks for equality: clocks with negative hours and minutes",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 18,  minute => 7 ),
    Clock->new( hour => -54, minute => -11513 ),
    "Compare two clocks for equality: clocks with negative hours and minutes that wrap",
);
$todo = undef;

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;
is(
    Clock->new( hour => 24, minute => 0 ),
    Clock->new( hour => 0,  minute => 0 ),
    "Compare two clocks for equality: full clock and zeroed clock",
);
$todo = undef;

done_testing;
