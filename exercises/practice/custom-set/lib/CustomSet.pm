package CustomSet;

use v5.40;
use Moo;

has elements => (
    is => 'ro',

   #coerce => sub {...},
   # If you wish, one way of normalizing your objects
   # e.g. making (elements => [1, 2, 3]) and (elements => [3, 2, 1]) identical
   # would be to use the 'coerce' option: https://metacpan.org/pod/Moo#coerce
);

sub is_empty ($self) {
    return undef;
}

sub contains ( $self, $element ) {
    return undef;
}

sub is_subset_of ( $self, $other ) {
    return undef;
}

sub is_disjoint_of ( $self, $other ) {
    return undef;
}

sub is_equal_to ( $self, $other ) {
    return undef;
}

sub add ( $self, $element ) {
    return undef;
}

sub intersection ( $self, $other ) {
    return undef;
}

sub difference ( $self, $other ) {
    return undef;
}

sub union ( $self, $other ) {
    return undef;
}

1;
