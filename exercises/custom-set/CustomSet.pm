package CustomSet;
use strict;
use warnings;
our @EXPORT_OK = qw(
    new add remove is_empty
    is_member size to_list
    union intersect difference
    is_disjoint is_equal is_subset
);

sub new {
    my ($class, @members) = @_;
    die "You need to implement this.";
}

sub add {
    my ($self, $member) = @_;
    die "You need to implement this.";
}

sub remove {
    my ($self, $member) = @_;
    die "You need to implement this.";
}

sub is_empty {
    my ($self) = @_;
    die "You need to implement this.";
}

sub is_member {
    my ($self, $member) = @_;
    die "You need to implement this.";
}

sub size {
    my ($self) = @_;
    die "You need to implement this.";
}

sub to_list {
    my ($self) = @_;
    die "You need to implement this.";
}

sub union {
    my ($self, $other) = @_;
    die "You need to implement this.";
}

sub intersect {
    my ($self, $other) = @_;
    die "You need to implement this.";
}

sub difference {
    my ($self, $other) = @_;
    die "You need to implement this.";
}

sub is_disjoint {
    my ($self, $other) = @_;
    die "You need to implement this.";
}

sub is_subset {
    my ($self, $other) = @_;
    die "You need to implement this.";
}

sub is_equal {
    my ($self, $other) = @_;
    die "You need to implement this.";
}

1;
