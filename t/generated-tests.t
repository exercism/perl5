#!/usr/bin/env perl
use Test::More;
use Path::Tiny;
use YAML 'LoadFile';
use FindBin;
use lib "$FindBin::Bin/../lib";
use Exercism::Generator;

my $base_dir = path(__FILE__)->realpath->parent->parent;

if (!$base_dir->child('problem-specifications')->is_dir) {
  BAIL_OUT 'problem-specifications directory required';
}

foreach (sort {$a cmp $b} $base_dir->child('exercises')->children) {
  if ($_->child('.meta/exercise-data.yaml')->is_file) {
    TODO: {
      local $TODO = '#';
      is $_->child($_->basename.'.t')->slurp,
        Exercism::Generator->new({data => LoadFile($_->child('.meta/exercise-data.yaml')), exercise => $_->basename})->test,
        $_->basename.': test suite matches generated';
    }
  }
}

done_testing;
