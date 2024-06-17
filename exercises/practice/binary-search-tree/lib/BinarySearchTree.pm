package BinarySearchTree;

use v5.40;
use Moo;

package BinarySearchTree::Node {
    use Moo;

    has data => (
        is => 'ro',
    );
    has [qw<left right>] => (
        is => 'rw',
    );
};

has root => (
    is => 'rw',
);

sub add ($self) {

    # $self->root contains the initial node.
}

sub sort ($self) {
    return [];
}

1;
