#!/usr/bin/env perl
use Test2::V0;

use Path::Tiny;
use YAML qw<LoadFile>;

use lib::gitroot qw<:lib :once>;
use Exercism::Generator;

use constant BASE_DIR => path(GIT_ROOT);

if ( !BASE_DIR->child('.problem-specifications')->is_dir ) {
  bail_out 'problem-specifications directory required';
}

for ( sort { $a cmp $b }
  BASE_DIR->child( 'exercises', 'practice' )->children )
{
  if ( $_->child( '.meta', 'exercise-data.yaml' )->is_file ) {
    is(
      [ split( /\n/, $_->child( $_->basename . '.t' )->slurp_utf8 ) ],
      [ split(
          /\n/,
          Exercism::Generator->new( { exercise => $_->basename } )
            ->test
        )
      ],
      $_->basename . ': test suite matches generated'
    );
  }
}

done_testing;
