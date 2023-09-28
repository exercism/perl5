package BinarySearchTree;

use Moo;
use experimental qw<signatures postderef postderef_qq>;

package BinarySearchTree::Node {
    use Moo;
    no warnings qw<experimental::signatures>;

    has data => (
        is => 'ro',
    );
    has [qw<left right>] => (
        is => 'rw',
    );

    sub set ( $self, $data ) {
        if ( $data > $self->data ) {
            if ( $self->right ) {
                $self->right->set($data);
            }
            else {
                $self->right( BinarySearchTree::Node->new( data => $data ) );
            }
        }
        elsif ( $self->left ) {
            $self->left->set($data);
        }
        else {
            $self->left( BinarySearchTree::Node->new( data => $data ) );
        }
    }
};

has root => (
    is => 'rw',
);

sub add ( $self, $data ) {
    $self->root->set($data);
}

sub sort ($self) {
    my @sorted;
    my $sub;
    $sub = sub {
        my ($node) = @_;
        if ( $node->left ) {
            $sub->( $node->left );
        }

        push @sorted, $node->data;

        if ( $node->right ) {
            $sub->( $node->right );
        }
    };
    $sub->( $self->root );
    return [@sorted];
}

1;
