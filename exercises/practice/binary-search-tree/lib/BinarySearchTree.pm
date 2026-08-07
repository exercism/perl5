use v5.44;
use experimental qw<class>;

class BinarySearchTree;

field $root :param;

method add () {

    # $root contains the initial node.
}

method sort () {
    return [];
}

class BinarySearchTree::Node {
    field $data  :reader :param;
    field $left  :reader;
    field $right :reader;
}

1;
