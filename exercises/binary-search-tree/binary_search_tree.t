#!/usr/bin/env perl
use warnings;
use strict;

use Test2::Bundle::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use BinarySearchTree;

sub new_bst {
  no strict 'refs';
  BinarySearchTree->new(@_);
}

for (1) {
  is new_bst(4)->data, 4, 'data is retained';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert(4);
  is $bst->data, 4, 'inserting same';
  is $bst->left->data, 4, 'inserting same';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert(2);
  is $bst->data, 4, 'inserting less';
  is $bst->left->data, 2, 'inserting less';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert(5);
  is $bst->data, 4, 'inserting more';
  is $bst->right->data, 5, 'inserting more';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert($_) for 2, 6, 1, 3, 7, 5;

  is $bst->data, 4, 'complex tree';
  is $bst->left->data, 2, 'complex tree';
  is $bst->left->left->data,  1, 'complex tree';
  is $bst->left->right->data, 3, 'complex tree';
  is $bst->right->data, 6, 'complex tree';
  is $bst->right->left->data,  5, 'complex tree';
  is $bst->right->right->data, 7, 'complex tree';
}

sub record_all_data($) {
  my $bst      = shift;
  my $all_data = [];

  $bst->each(
    sub {
      my $data = shift;
      push @$all_data, $data;
    }
  );

  return $all_data;
}

for (1) {
  my $bst = new_bst(4);
  is_deeply record_all_data $bst, [4], 'iterating one element';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert(2);
  is_deeply record_all_data $bst, [ 2, 4 ],
    'iterating over smaller element';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert(5);
  is_deeply record_all_data $bst, [ 4, 5 ],
    'iterating over larger element';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert($_) for 2, 6, 1, 3, 7, 5;

  is_deeply record_all_data $bst, [ 1 .. 7 ],
    'iterating over complex tree';
}

done_testing;
