package BinarySearchTree;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<tree>;

use lib 'lib';
use Exercism::QuickSolve;

sub tree {
  my ($data) = @_;

  quicksolve(
    input     => $data,
    input_key => 'treeData',
  );
}

1;
