use warnings;
use strict;

use Test::More;

my $module = $ENV{EXERCISM} ? 'Example' : 'BinarySearchTree';

use_ok($module) or BAIL_OUT "You need to create a module called $module.pm";

sub new_bst {
  no strict 'refs';
  $module->new(@_);
}

for (1) {
  is 4, new_bst(4)->data, 'data is retained';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert(4);
  is 4, $bst->data, 'inserting same';
  is 4, $bst->left->data, 'inserting same';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert(2);
  is 4, $bst->data, 'inserting less';
  is 2, $bst->left->data, 'inserting less';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert(5);
  is 4, $bst->data, 'inserting more';
  is 5, $bst->right->data, 'inserting more';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert($_) for 2, 6, 1, 3, 7, 5;

  is 4, $bst->data, 'complex tree';
  is 2, $bst->left->data, 'complex tree';
  is 1, $bst->left->left->data, 'complex tree';
  is 3, $bst->left->right->data, 'complex tree';
  is 6, $bst->right->data, 'complex tree';
  is 5, $bst->right->left->data, 'complex tree';
  is 7, $bst->right->right->data, 'complex tree';
}

sub record_all_data($) {
  my $bst = shift;
  my $all_data = [];

  $bst->each(sub {
    my $data = shift;
    push @$all_data, $data;
  });

  return $all_data;
}

for (1) {
  my $bst = new_bst(4);
  is_deeply [4], record_all_data $bst, 'iterating one element';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert(2);
  is_deeply [2, 4], record_all_data $bst, 'iterating over smaller element';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert(5);
  is_deeply [4, 5], record_all_data $bst, 'iterating over larger element';
}

for (1) {
  my $bst = new_bst(4);
  $bst->insert($_) for 2, 6, 1, 3, 7, 5;

  is_deeply [1 .. 7], record_all_data $bst, 'iterating over complex tree';
}

done_testing;
