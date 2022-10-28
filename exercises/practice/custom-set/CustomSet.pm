package CustomSet;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK
    = qw<is_empty_set set_contains is_subset is_disjoint_set is_equal_set add_set_element set_intersection set_difference set_union>;

sub is_empty_set {
    my ($set) = @_;
    return undef;
}

sub set_contains {
    my ( $set, $element ) = @_;
    return undef;
}

sub is_subset {
    my ( $subset, $set ) = @_;
    return undef;
}

sub is_disjoint_set {
    my ( $set1, $set2 ) = @_;
    return undef;
}

sub is_equal_set {
    my ( $set1, $set2 ) = @_;
    return undef;
}

sub add_set_element {
    my ( $set, $element ) = @_;
    return undef;
}

sub set_intersection {
    my ( $set1, $set2 ) = @_;
    return undef;
}

sub set_difference {
    my ( $set1, $set2 ) = @_;
    return undef;
}

sub set_union {
    my ( $set1, $set2 ) = @_;
    return undef;
}

1;
