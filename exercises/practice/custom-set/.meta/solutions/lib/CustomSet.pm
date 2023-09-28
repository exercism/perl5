package CustomSet;

use Moo;
use experimental qw<signatures postderef postderef_qq>;

use Types::Common qw<-types>;
use namespace::clean;

has elements => (
    is  => 'ro',
    isa => ( HashRef [Bool] )->plus_coercions(
        ArrayRef, sub { +{ map { $_ => 1 } @{ $_[0] } } },
    ),
    coerce => 1,
);

sub _keys {
    keys %{ $_[0]->elements };
}

sub is_empty {
    !$_[0]->_keys;
}

sub contains ( $self, $element ) {
    return !!$self->elements->{$element};
}

sub is_subset_of ( $self, $other ) {
    for my $key ( $self->_keys ) {
        return 0 unless $other->contains($key);
    }
    return 1;
}

sub is_disjoint_of ( $self, $other ) {
    for my $key ( $self->_keys ) {
        return 0 if $other->contains($key);
    }
    return 1;
}

sub is_equal_to ( $self, $other ) {
    return 0 if $self->_keys != $other->_keys;
    for my $key ( $self->_keys ) {
        return 0 unless $other->contains($key);
    }
    return 1;
}

sub add ( $self, $element ) {
    return __PACKAGE__->new( elements => [ $self->_keys, $element ] );
}

sub intersection ( $self, $other ) {
    return __PACKAGE__->new(
        elements => [
            grep { $self->contains($_) && $other->contains($_) } $self->_keys, $other->_keys
        ]
    );
}

sub difference ( $self, $other ) {
    return __PACKAGE__->new(
        elements => [
            grep { $self->contains($_) && !$other->contains($_) } $self->_keys, $other->_keys
        ]
    );
}

sub union ( $self, $other ) {
    return __PACKAGE__->new( elements => [ $self->_keys, $other->_keys ] );
}

1;
