use v5.44;
use experimental qw<class>;

class Robot;

field $x         :reader :param;
field $y         :reader :param;
field $direction :reader :param;

method enact ($instructions) {
    return $self;
}

1;
