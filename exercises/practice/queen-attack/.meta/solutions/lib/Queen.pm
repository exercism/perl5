use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;
use Feature::Compat::Class;

class Queen;

field $row : reader : param;
field $column : reader : param;

ADJUST {
    die 'row not on board'    if $row < 0    || $row > 7;
    die 'column not on board' if $column < 0 || $column > 7;
}

method can_attack ($other) {

    # Same row or column
    return 1 if $row == $other->row || $column == $other->column;

    # Same diagonal
    return 1 if abs( $row - $other->row ) == abs( $column - $other->column );

    return 0;
}

1;
