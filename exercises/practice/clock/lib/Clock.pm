use v5.44;
use experimental qw<class>;

class Clock;

field $hour   :reader :param;
field $minute :reader :param;

method time () {
    return undef;
}

method add_minutes ($amount) {
    return $self;
}

method subtract_minutes ($amount) {
    return $self;
}

1;
