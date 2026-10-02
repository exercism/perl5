use v5.40;
use experimental qw<class>;

class RobotName;

field $name :reader;

ADJUST {
    $name = $self->reset_name();
}

method reset_name () {
    $name = _rand_letter() . _rand_letter() . _suffix();
    return $name;
}

sub _rand_letter () {
    my @letters = 'A' .. 'Z';
    return $letters[ int rand $#letters ];
}

sub _suffix () {
    return sprintf( '%03d', int rand 1000 );
}

1;
