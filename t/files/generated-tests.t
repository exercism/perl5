#!/usr/bin/env perl
use Test2::V0;

use Path::Tiny;
use YAML qw<LoadFile>;

use lib::gitroot qw<:lib :once>;
use Exercism::Generator;

use constant BASE_DIR => path(GIT_ROOT);

if (!path(
        $ENV{HOME}, '.cache',
        'exercism', 'configlet',
        'problem-specifications'
    )->is_dir
    )
{
    bail_out 'problem-specifications directory required';
}

for ( sort { $a cmp $b }
    BASE_DIR->child( 'exercises', 'practice' )->children )
{
    if ( $_->child( '.meta', 'template-data.yaml' )->is_file ) {
        $Data::Dmp::OPT_STRINGIFY_NUMBERS = 0;    # Option is used in several exercises, reset to default before running generator.
        is(
            [ split( /\n/, $_->child( $_->basename . '.t' )->slurp_utf8 ) ],
            [   split(
                    /\n/,
                    Exercism::Generator->new( { exercise => $_->basename } )
                        ->test
                )
            ],
            $_->basename . ': test suite matches generated',
        );
    }
}

done_testing;
