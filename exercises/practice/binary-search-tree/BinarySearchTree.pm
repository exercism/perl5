package BinarySearchTree;

use Moo;
use feature qw<say>;

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

sub add {
    my ($self) = @_;

    # $self->root contains the initial node.
}

sub sort {
    my ($self) = @_;
    return [];
}

1;
