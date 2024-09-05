use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;
use Feature::Compat::Class;

class Clock;

use POSIX qw<floor>;

field $hour : reader : param   = 0;
field $minute : reader : param = 0;

method time () {
    return sprintf '%02d:%02d', $hour, $minute;
}

method add_minutes ($amount) {
    return $self->_set_time( $hour * 60 + $minute + $amount );
}

method subtract_minutes ($amount) {
    return $self->add_minutes( -$amount );
}

ADJUST {
    $self->_set_time( $hour * 60 + $minute );
}

method _set_time ($amount) {
    $hour   = floor( $amount / 60 ) % 24;
    $minute = $amount % 60;
    return $self;
}

1;
