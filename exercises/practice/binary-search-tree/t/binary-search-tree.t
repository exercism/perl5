#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use BinarySearchTree ();

my $bst;

$bst = BinarySearchTree->new( root => BinarySearchTree::Node->new( data => 2 ) ); # begin: 9e0c06ef-aeca-4202-b8e4-97f1ed057d56
is(
    $bst->sort,
    [2],
    "can sort data: can sort single number",
); # end: 9e0c06ef-aeca-4202-b8e4-97f1ed057d56

$bst = BinarySearchTree->new( root => BinarySearchTree::Node->new( data => 2 ) ); # begin: 425e6d07-fceb-4681-a4f4-e46920e380bb
$bst->add(1);
is(
    $bst->sort,
    [ 1, 2 ],
    "can sort data: can sort if second number is smaller than first",
); # end: 425e6d07-fceb-4681-a4f4-e46920e380bb

$bst = BinarySearchTree->new( root => BinarySearchTree::Node->new( data => 2 ) ); # begin: bd7532cc-6988-4259-bac8-1d50140079ab
$bst->add(2);
is(
    $bst->sort,
    [ 2, 2 ],
    "can sort data: can sort if second number is same as first",
); # end: bd7532cc-6988-4259-bac8-1d50140079ab

$bst = BinarySearchTree->new( root => BinarySearchTree::Node->new( data => 2 ) ); # begin: b6d1b3a5-9d79-44fd-9013-c83ca92ddd36
$bst->add(3);
is(
    $bst->sort,
    [ 2, 3 ],
    "can sort data: can sort if second number is greater than first",
); # end: b6d1b3a5-9d79-44fd-9013-c83ca92ddd36

$bst = BinarySearchTree->new( root => BinarySearchTree::Node->new( data => 2 ) ); # begin: d00ec9bd-1288-4171-b968-d44d0808c1c8
$bst->add(1);
$bst->add(3);
$bst->add(6);
$bst->add(7);
$bst->add(5);
is(
    $bst->sort,
    [ 1, 2, 3, 5, 6, 7 ],
    "can sort data: can sort complex tree",
); # end: d00ec9bd-1288-4171-b968-d44d0808c1c8

done_testing;
