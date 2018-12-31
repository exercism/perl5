#!/usr/bin/env perl
use Test2::V0;
use Path::Tiny;
use YAML 'LoadFile';
use FindBin;
use lib "$FindBin::Bin/../lib";
use Exercism::Generator 'BASE_DIR';

if (!BASE_DIR->child('problem-specifications')->is_dir) {
  bail_out 'problem-specifications directory required';
}

foreach (sort {$a cmp $b} BASE_DIR->child('exercises')->children) {
  if ($_->child('.meta/exercise-data.yaml')->is_file) {
    todo '' => sub {
      is(
        [split(/\n/, $_->child($_->basename.'.t')->slurp)],
        [split(/\n/, Exercism::Generator->new(
          {
            data => LoadFile($_->child('.meta/exercise-data.yaml')),
            exercise => $_->basename,
          }
        )->test)],
        $_->basename.': test suite matches generated'
      );
    }
  }
}

done_testing;
