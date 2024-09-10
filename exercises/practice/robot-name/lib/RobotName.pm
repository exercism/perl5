use v5.40;
use experimental qw<class>;

class RobotName;

field $name :reader;

method reset_name () {
    return undef;
}

1;
