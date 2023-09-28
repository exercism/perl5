#!/usr/bin/env perl

use Test2::V0;

use Time::Piece;
use Time::Seconds;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use BookingUpForBeauty qw<
    appointment_has_passed
    is_afternoon_appointment
    describe_appointment
>;

is( # begin: years-past task: 1
    appointment_has_passed( ( Time::Piece->gmtime - ONE_YEAR + ONE_HOUR * 2 )->datetime ),
    T,
    'Date last year is in the past',
); # end: years-past

is( # begin: months-past task: 1
    appointment_has_passed( ( Time::Piece->gmtime - ONE_MONTH * 8 )->datetime ),
    T,
    'Date months ago is in the past',
); # end: months-past

is( # begin: days-past task: 1
    appointment_has_passed( ( Time::Piece->gmtime - ONE_DAY * 23 )->datetime ),
    T,
    'Date days ago is in the past',
); # end: days-past

is( # begin: hours-past task: 1
    appointment_has_passed( ( Time::Piece->gmtime - ONE_HOUR * 12 )->datetime ),
    T,
    'Date hours ago is in the past',
); # end: hours-past

is( # begin: minutes-past task: 1
    appointment_has_passed( ( Time::Piece->gmtime - ONE_MINUTE * 55 )->datetime ),
    T,
    'Date minutes ago is in the past',
); # end: minutes-past

is( # begin: one-minute-past task: 1
    appointment_has_passed( ( Time::Piece->gmtime - ONE_MINUTE )->datetime ),
    T,
    'Date one minute ago is in the past',
); # end: one-minute-past

is( # begin: one-minute-future task: 1
    appointment_has_passed( ( Time::Piece->gmtime + ONE_MINUTE )->datetime ),
    DF,
    'Date one minute from now is not in the past',
); # end: one-minute-future

is( # begin: minutes-future task: 1
    appointment_has_passed( ( Time::Piece->gmtime + ONE_MINUTE * 5 )->datetime ),
    DF,
    'Date minutes from now is not in the past',
); # end: minutes-future

is( # begin: days-future task: 1
    appointment_has_passed( ( Time::Piece->gmtime + ONE_DAY * 19 )->datetime ),
    DF,
    'Date days from now is not in the past',
); # end: days-future

is( # begin: months-future task: 1
    appointment_has_passed( ( Time::Piece->gmtime + ONE_MONTH * 10 )->datetime ),
    DF,
    'Date months from now is not in the past',
); # end: months-future

is( # begin: years-future task: 1
    appointment_has_passed( ( Time::Piece->gmtime + ONE_YEAR * 2 + ONE_MONTH * 3 + ONE_DAY * 6 )->datetime ),
    DF,
    'Date years from now is not in the past',
); # end: years-future

is( # begin: early-morning-afternoon task: 2
    is_afternoon_appointment('2019-06-17T08:15:00'),
    DF,
    'Early morning appointment is not in the afternoon',
); # end: early-morning-afternoon

is( # begin: late-morning-afternoon task: 2
    is_afternoon_appointment('2019-02-23T11:59:59'),
    DF,
    'Late morning appointment is not in the afternoon',
); # end: late-morning-afternoon

is( # begin: noon-afternoon task: 2
    is_afternoon_appointment('2019-08-09T12:00:00'),
    T,
    'Noon appointment is in the afternoon',
); # end: noon-afternoon

is( # begin: early-afternoon-afternoon task: 2
    is_afternoon_appointment('2017-08-09T12:00:01'),
    T,
    'Early afternoon appointment is in the afternoon',
); # end: early-afternoon-afternoon

is( # begin: late-afternoon-afternoon task: 2
    is_afternoon_appointment('2019-09-01T17:59:59'),
    T,
    'Late afternoon appointment is in the afternoon',
); # end: late-afternoon-afternoon

is( # begin: early-evening-afternoon task: 2
    is_afternoon_appointment('2016-09-01T18:00:00'),
    DF,
    'Early evening appointment is not in the afternoon',
); # end: early-evening-afternoon

is( # begin: late-evening-afternoon task: 2
    is_afternoon_appointment('2019-09-01T23:59:59'),
    DF,
    'Late evening appointment is not in the afternoon',
); # end: late-evening-afternoon

is( # begin: describe-morning task: 3
    describe_appointment('2017-07-04T08:25:07'),
    'You have an appointment on 07/04/2017 8:25 AM',
    'Description of an appointment in the morning',
); # end: describe-morning

is( # begin: describe-afternoon task: 3
    describe_appointment('2020-11-18T14:32:35'),
    'You have an appointment on 11/18/2020 2:32 PM',
    'Description of an appointment in the afternoon',
); # end: describe-afternoon

is( # begin: describe-evening task: 3
    describe_appointment('2019-03-29T22:05:42'),
    'You have an appointment on 03/29/2019 10:05 PM',
    'Description of an appointment at night',
); # end: describe-evening

is( # begin: describe-midnight task: 3
    describe_appointment('2019-05-25T00:42:12'),
    'You have an appointment on 05/25/2019 12:42 AM',
    'Description of an appointment after midnight',
); # end: describe-midnight

done_testing;
