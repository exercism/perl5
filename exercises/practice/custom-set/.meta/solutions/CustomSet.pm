package CustomSet;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK
    = qw<is_empty_set set_contains is_subset is_disjoint_set is_equal_set add_set_element set_intersection set_difference set_union>;

sub is_empty_set {
    my ($set) = @_;
    return !@{$set};
}

sub set_contains {
    my ( $set, $element ) = @_;
    my %set = ( map { $_ => 1 } @{$set} );
    return $set{$element} // 0;
}

sub is_subset {
    my ( $subset, $set ) = @_;
    my %set    = ( map { $_ => 1 } @{$set} );
    my %subset = ( map { $_ => 1 } @{$subset} );
    for my $key ( keys %subset ) {
        return 0 unless $set{$key};
    }
    return 1;
}

sub is_disjoint_set {
    my ( $set1, $set2 ) = @_;
    my %set1 = ( map { $_ => 1 } @{$set1} );
    my %set2 = ( map { $_ => 1 } @{$set2} );
    for my $key ( keys %set1 ) {
        return 0 if $set2{$key};
    }
    return 1;
}

sub is_equal_set {
    my ( $set1, $set2 ) = @_;
    return 0 if @{$set1} != @{$set2};
    my %set1 = ( map { $_ => 1 } @{$set1} );
    my %set2 = ( map { $_ => 1 } @{$set2} );
    for my $key ( keys %set1 ) {
        return 0 unless $set2{$key};
    }
    return 1;
}

sub add_set_element {
    my ( $set, $element ) = @_;
    return [ keys %{ { map { $_ => 1 } @{$set}, $element } } ];
}

sub set_intersection {
    my ( $set1, $set2 ) = @_;
    my %set1 = ( map { $_ => 1 } @{$set1} );
    my %set2 = ( map { $_ => 1 } @{$set2} );
    return [ grep { $set1{$_} && $set2{$_} } keys %{ { %set1, %set2 } } ];
}

sub set_difference {
    my ( $set1, $set2 ) = @_;
    my %set1 = ( map { $_ => 1 } @{$set1} );
    my %set2 = ( map { $_ => 1 } @{$set2} );
    return [ grep { $set1{$_} && !$set2{$_} } keys %{ { %set1, %set2 } } ];
}

sub set_union {
    my ( $set1, $set2 ) = @_;
    return [ keys %{ { map { $_ => 1 } @{$set1}, @{$set2} } } ];
}

1;
