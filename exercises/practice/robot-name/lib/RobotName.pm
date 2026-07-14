use v5.42;
use experimental qw<class>;

class RobotName;

field $name :reader;

method reset_name () {
    return undef;
}

1;
