#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use BinarySearchTree ();

can_ok 'BinarySearchTree', qw<add sort> or bail_out;

my $bst;
my $init;

$init = 1;    # begin: 9e0c06ef-aeca-4202-b8e4-97f1ed057d56
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
);    # end: 9e0c06ef-aeca-4202-b8e4-97f1ed057d56

$init = 1;    # begin: 425e6d07-fceb-4681-a4f4-e46920e380bb
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
);    # end: 425e6d07-fceb-4681-a4f4-e46920e380bb

$init = 1;    # begin: bd7532cc-6988-4259-bac8-1d50140079ab
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
);    # end: bd7532cc-6988-4259-bac8-1d50140079ab

$init = 1;    # begin: b6d1b3a5-9d79-44fd-9013-c83ca92ddd36
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
);    # end: b6d1b3a5-9d79-44fd-9013-c83ca92ddd36

$init = 1;    # begin: d00ec9bd-1288-4171-b968-d44d0808c1c8
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
);    # end: d00ec9bd-1288-4171-b968-d44d0808c1c8

done_testing;
