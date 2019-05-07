package CustomSet;
use strict;
use warnings;
our @EXPORT_OK = qw(
    new add remove is_empty
    is_member size to_list
    union intersect difference
    is_disjoint is_equal is_subset
);

# Replace `...` with a correct implementation.
# https://perldoc.pl/perlsyn#The-Ellipsis-Statement

sub new {
    my ($class, @members) = @_;
    ...;
}

sub add {
    my ($self, $member) = @_;
    ...;
}

sub remove {
    my ($self, $member) = @_;
    ...;
}

sub is_empty {
    my ($self) = @_;
    ...;
}

sub is_member {
    my ($self, $member) = @_;
    ...;
}

sub size {
    my ($self) = @_;
    ...;
}

sub to_list {
    my ($self) = @_;
    ...;
}

sub union {
    my ($self, $other) = @_;
    ...;
}

sub intersect {
    my ($self, $other) = @_;
    ...;
}

sub difference {
    my ($self, $other) = @_;
    ...;
}

sub is_disjoint {
    my ($self, $other) = @_;
    ...;
}

sub is_subset {
    my ($self, $other) = @_;
    ...;
}

sub is_equal {
    my ($self, $other) = @_;
    ...;
}

1;
