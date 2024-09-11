use v5.40;
use experimental qw<class>;

class Queen;

field $row :reader :param;
field $column :reader :param;

method can_attack ($other) {
    return undef;
}

1;
