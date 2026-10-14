use v5.40;
use experimental qw<class>;

class BinarySearchTree;

field $root :param;

method add ($data) {
    $root->set($data);
}

method sort () {
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
    $sub->($root);
    return [@sorted];
}

class BinarySearchTree::Node {
    field $data  :reader :param;
    field $left  :reader;
    field $right :reader;

    method set ($new_data) {
        if ( $new_data > $data ) {
            if ($right) {
                $right->set($new_data);
            }
            else {
                $right = BinarySearchTree::Node->new( data => $new_data );
            }
        }
        elsif ($left) {
            $left->set($new_data);
        }
        else {
            $left = BinarySearchTree::Node->new( data => $new_data );
        }
    }
}

1;
