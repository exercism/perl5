#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Path::Tiny;
use YAML 'LoadFile';
use FindBin;
use lib "$FindBin::Bin/../lib";
use Exercism::Generator 'BASE_DIR';

if (!BASE_DIR->child('problem-specifications')->is_dir) {
  BAIL_OUT 'problem-specifications directory required';
}

foreach (sort {$a cmp $b} BASE_DIR->child('exercises')->children) {
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
