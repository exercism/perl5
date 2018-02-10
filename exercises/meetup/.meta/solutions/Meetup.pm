package Meetup;
use strict;
use warnings;
use DateTime;
use List::MoreUtils 'any';

my @days_of_week = qw[monday tuesday wednesday thursday friday saturday sunday];

sub _weekday_number {
    my $weekday = lc shift;

    for (0..$#days_of_week) {
        return $_ + 1 if $days_of_week[$_] eq $weekday;
    }
}

sub _days_until{
    my ($weekday, $day) = @_;
    (_weekday_number($weekday) - $day->dow) % 7;
}

sub _days_in_month {
    my ($year, $month_number) = @_;

    my $date = DateTime->new(year => $year);

    if    (any { $month_number == $_ } qw/1 3 5 7 8 10 12/) { return 31 }
    elsif (any { $month_number == $_ } qw/4 6 9 11/) { return 30 }
    else { return $date->is_leap_year ? 29 : 28 } #february
}

sub new {
    my ($class, $month, $year) = @_;

    bless { year        => $year,
            month       => $month,
            first       => DateTime->new(year => $year, month => $month, day => 1),
            eighth      => DateTime->new(year => $year, month => $month, day => 8),
            thirteenth  => DateTime->new(year => $year, month => $month, day => 13),
            fifteenth   => DateTime->new(year => $year, month => $month, day => 15),
            twentysecond=> DateTime->new(year => $year, month => $month, day => 22),
            last        => DateTime->new(year => $year, month => $month, day => _days_in_month($year, $month)),
          }, $class;
}

sub day {
    my ($self, $weekday, $schedule) = @_;
    if ($schedule eq 'teenth') {
        $self->{thirteenth}->add( days => _days_until($weekday, $self->{thirteenth}));
    }
    elsif ($schedule eq 'first') {
        $self->{first}->add( days => _days_until($weekday, $self->{first}));
    }
    elsif ($schedule eq 'second') {
        $self->{eighth}->add( days => _days_until($weekday, $self->{eighth}));
    }
    elsif ($schedule eq 'third') {
        $self->{fifteenth}->add( days => _days_until($weekday, $self->{fifteenth}));
    }
    elsif ($schedule eq 'fourth') {
        $self->{twentysecond}->add( days => _days_until($weekday, $self->{twentysecond}));
    }
    elsif ($schedule eq 'last') {
       $self->{last}->subtract( days => (7 - (_weekday_number($weekday) - $self->{last}->dow)) % 7);
    }
}

1;

