package BinarySearchTree;

use Moo;
use feature      qw<say>;
use experimental qw<signatures postderef_qq>;

package BinarySearchTree::Node {
    use Moo;

    has data => (
        is => 'ro',
    );
    has [qw<left right>] => (
        is => 'rw',
    );

    sub set {
        my ( $self, $data ) = @_;
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

sub add {
    my ( $self, $data ) = @_;
    $self->root->set($data);
}

sub sort {
    my ($self) = @_;
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
