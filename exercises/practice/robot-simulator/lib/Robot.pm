use v5.40;
use experimental qw<class>;

class Robot;

field $x : reader param;
field $y : reader param;
field $direction : reader param;

method enact ($instructions) {
    return $self;
}

1;
