#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use BinarySearchTree ();

can_ok 'BinarySearchTree', qw<add sort> or bail_out;

my $bst;
my $init;

$init = 1;
for my $data (2) {
    if ($init) {
        $bst = BinarySearchTree->new(
            root => BinarySearchTree::Node->new( data => $data ) );
        $init = 0;
        next;
    }
    $bst->add($data);
}
is(
    $bst->sort,
    [2],
    "can sort data: can sort single number",
);

$init = 1;
for my $data ( 2, 1 ) {
    if ($init) {
        $bst = BinarySearchTree->new(
            root => BinarySearchTree::Node->new( data => $data ) );
        $init = 0;
        next;
    }
    $bst->add($data);
}
is(
    $bst->sort,
    [ 1, 2 ],
    "can sort data: can sort if second number is smaller than first",
);

$init = 1;
for my $data ( 2, 2 ) {
    if ($init) {
        $bst = BinarySearchTree->new(
            root => BinarySearchTree::Node->new( data => $data ) );
        $init = 0;
        next;
    }
    $bst->add($data);
}
is(
    $bst->sort,
    [ 2, 2 ],
    "can sort data: can sort if second number is same as first",
);

$init = 1;
for my $data ( 2, 3 ) {
    if ($init) {
        $bst = BinarySearchTree->new(
            root => BinarySearchTree::Node->new( data => $data ) );
        $init = 0;
        next;
    }
    $bst->add($data);
}
is(
    $bst->sort,
    [ 2, 3 ],
    "can sort data: can sort if second number is greater than first",
);

$init = 1;
for my $data ( 2, 1, 3, 6, 7, 5 ) {
    if ($init) {
        $bst = BinarySearchTree->new(
            root => BinarySearchTree::Node->new( data => $data ) );
        $init = 0;
        next;
    }
    $bst->add($data);
}
is(
    $bst->sort,
    [ 1, 2, 3, 5, 6, 7 ],
    "can sort data: can sort complex tree",
);

done_testing;
