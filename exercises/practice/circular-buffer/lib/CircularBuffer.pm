use v5.40;
use experimental qw<class>;

class CircularBuffer;

field $capacity :reader :param;

method write ($item) {
    return undef;
}

method read () {
    return undef;
}

method clear () {
    return undef;
}

method overwrite ($item) {
    return undef;
}

1;
