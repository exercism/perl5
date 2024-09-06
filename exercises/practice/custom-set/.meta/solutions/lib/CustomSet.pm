use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;
use Feature::Compat::Class;

class CustomSet;

field $elements : param = [];
field $set : reader(elements);

ADJUST {
    $set = { map { $_ => 1 } $elements->@* }
}

method _keys () {
    keys %{ $self->elements };
}

method is_empty () {
    !$self->_keys;
}

method contains ($element) {
    return !!$self->elements->{$element};
}

method is_subset_of ($other) {
    for my $key ( $self->_keys ) {
        return 0 unless $other->contains($key);
    }
    return 1;
}

method is_disjoint_of ($other) {
    for my $key ( $self->_keys ) {
        return 0 if $other->contains($key);
    }
    return 1;
}

method is_equal_to ($other) {
    return 0 if $self->_keys != $other->_keys;
    for my $key ( $self->_keys ) {
        return 0 unless $other->contains($key);
    }
    return 1;
}

method add ($element) {
    return $self->new( elements => [ $self->_keys, $element ] );
}

method intersection ($other) {
    return $self->new(
        elements => [
            grep { $self->contains($_) && $other->contains($_) } $self->_keys, $other->_keys
        ]
    );
}

method difference ($other) {
    return $self->new(
        elements => [
            grep { $self->contains($_) && !$other->contains($_) } $self->_keys, $other->_keys
        ]
    );
}

method union ($other) {
    return $self->new( elements => [ $self->_keys, $other->_keys ] );
}

1;
