package BinarySearchTree;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<tree treeSort>;

sub tree {
    my ($data) = @_;
    my $tree = leaf();
    insert( $tree, $_ ) for @$data;
    return $tree;
}

sub leaf {
    return {
        data  => undef,
        left  => undef,
        right => undef,
    };
}

sub insert {
    my ( $tree, $value ) = @_;
    if ( not defined $tree->{data} ) {
        $tree->{data} = $value;
    }
    elsif ( $value <= $tree->{data} ) {
        $tree->{left} //= leaf();
        insert( $tree->{left}, $value );
    }
    else {
        $tree->{right} //= leaf();
        insert( $tree->{right}, $value );
    }
    return;
}

sub treeSort {
    my ($data) = @_;
    my $tree   = tree($data);
    my @values = ();
    walk( $tree, sub { push @values, (shift)->{data} } );
    return \@values;
}

sub walk {
    my ( $tree, $sub ) = @_;
    walk( $tree->{left}, $sub ) if defined $tree->{left};
    $sub->($tree);
    walk( $tree->{right}, $sub ) if defined $tree->{right};
    return;
}

1;
