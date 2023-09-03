# Instructions

In this exercise you'll be working on an appointment scheduler for a beauty salon.

You have three tasks, which will all involve appointment dates.

## 1. Check if an appointment has already passed

Implement the `appointment_has_passed` subroutine that takes a date string and checks if the appointment was somewhere in the past:

```perl
appointment_has_passed("2019-07-25T13:45:00")
// => true
```

Date strings will be passed in ISO 8601 datetime format: `YYYY-mm-ddTHH:MM:SS`

You will need to implement the private `_parse_datetime` subroutine.
A couple of modules are suggested for you:

- [Time::Piece][time-piece] is a core Perl module.
- [DateTime::Tiny][datetime-tiny] is available from CPAN.

## 2. Check if appointment is in the afternoon

Implement the `is_afternoon_appointment` function that takes a date string and checks if the appointment is in the afternoon (>= 12:00 and < 18:00):

```perl
is_afternoon_appointment("2019-07-25T13:45:00")
// => true
```

## 3. Describe the time and date of the appointment

Implement the `describe_appointment` function that takes a date string and returns a description of that date and time:

```perl
describe_appointment("2019-07-25T13:45:00")
// => "You have an appointment on 07/25/2019 1:45 PM"
```

Note the hour is in the range 0-12 and does not have a leading zero or space.

[time-piece]: https://perldoc.pl/Time::Piece
[datetime-tiny]: https://metacpan.org/pod/DateTime::Tiny
