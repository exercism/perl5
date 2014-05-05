package Example;

use strict;
use warnings;
use overload
    "+"    => "add",
    "-"    => "subtract",
    "eq"   => "equals",
    '""'   => "to_string";

sub new {
    my ($class, $clock) = @_;
    my ($hour, $min) = @$clock;
    $min  = $min || "0";

    my $self = bless { hour => $hour, min => $min } => $class;
    $self->_normalize;

    return $self;
}

sub add {
    my ($self, $min) = @_;
    my $clock = $self->_copy;
    if ($min >= 60) {
        $clock->{hour} = ($clock->{hour} + int($min / 60)) % 24;
    }
    $clock->{min}  = $clock->{min} + $min % 60;
    $clock->_normalize;
    return $clock;
}

sub subtract {
    my ($self, $min) = @_;
    my $clock = $self->_copy;
    if ($min >= 60) {
        $clock->{hour} = $clock->{hour} - (int($min / 60) + 1);
        $clock->{hour} = 25 + $clock->{hour} if $clock->{hour} < 0;
    }
    $clock->{min} = abs $clock->{min} - $min % 60;
    $clock->_normalize;
    return $clock;
}

sub equals {
    my ($self, $other) = @_;
    return $self->to_string eq $other;
}

sub to_string {
    my $self = shift;
    return "$self->{hour}:$self->{min}";
}

sub _copy {
    my $self = shift;
    return Example->new( [$self->{hour}, $self->{min}] );
}

sub _normalize {
    my $self = shift;
    $self->{min}  = "0$self->{min}"   if $self->{min}  < 10;
    $self->{hour} = "0$self->{hour}"  if $self->{hour} < 10;
}

__PACKAGE__;
