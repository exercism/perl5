package CustomSet;

use Moo;
use feature qw<say>;

has elements => (
    is => 'ro',
);

sub is_empty {
    my ($self) = @_;
    return undef;
}

sub contains {
    my ( $self, $element ) = @_;
    return undef;
}

sub is_subset_of {
    my ( $self, $other ) = @_;
    return undef;
}

sub is_disjoint_of {
    my ( $self, $other ) = @_;
    return undef;
}

sub is_equal_to {
    my ( $self, $other ) = @_;
    return undef;
}

sub add {
    my ( $self, $element ) = @_;
    return undef;
}

sub intersection {
    my ( $self, $other ) = @_;
    return undef;
}

sub difference {
    my ( $self, $other ) = @_;
    return undef;
}

sub union {
    my ( $self, $other ) = @_;
    return undef;
}

1;
