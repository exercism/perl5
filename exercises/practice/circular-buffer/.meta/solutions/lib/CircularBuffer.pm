use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;
use Feature::Compat::Class;

class CircularBuffer;

field $capacity :reader :param;
field @data = (); # kind of cheating to use a non-fixed size array.

method _isFull  { scalar @data == $capacity; }
method _isEmpty { scalar @data == 0; }

method write ($item) {
    die 'buffer full' if $self->_isFull;
    push @data, $item;
}

method read () {
    die 'buffer empty' if $self->_isEmpty;
    return shift @data;
}

method clear () {
    @data = ();
}

method overwrite ($item) {
    $self->read() if $self->_isFull;
    $self->write($item);
}

1;
