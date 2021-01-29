#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
plan 16;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use Sublist;

my $module = 'Sublist';
my $name   = "check_lists";
my $sub    = join( '::', $module, $name );

can_ok( $module, $name )
  or BAIL_OUT("You need to implement the function '$name'");

my $f = \&{"${module}::$name"};

is( $f->( [], [] ), "equal", "empty lists are equal" );
is( $f->( [], [ 1, 2, 3 ] ),
  "sublist", "empty list is subset of everything" );
is( $f->( [1], [] ),
  "superlist", "non-empty list is always superset of empty set" );
is( $f->( [ 0, 1, 2 ], [ 0, 1, 2 ] ),
  "equal", "non-empty lists are equal" );
is( $f->( [ 0 .. 1000000 ], [ 1 .. 1000001 ] ),
  "unequal", "large list, small difference" );
is( $f->( [ 1, 2, 5 ], [ 0, 1, 2, 3, 1, 2, 5, 6 ] ),
  "sublist", "false start" );
is( $f->( [ 1, 1, 2 ], [ 0, 1, 1, 1, 2, 1, 2 ] ),
  "sublist", "sublist with duplicates" );
is( $f->( [ 0, 1, 2 ], [ 0, 1, 2, 3, 4, 5 ] ),
  "sublist", "sublist at start" );
is( $f->( [ 2, 3, 4 ], [ 0, 1, 2, 3, 4, 5 ] ),
  "sublist", "sublist in middle" );
is( $f->( [ 3, 4, 5 ], [ 0, 1, 2, 3, 4, 5 ] ),
  "sublist", "sublist at end" );
is( $f->( [ 0, 1, 2, 3, 4, 5 ], [ 0, 1, 2 ] ),
  "superlist", "start of superlist" );
is( $f->( [ 0, 1, 2, 3, 4, 5 ], [ 2, 3 ] ),
  "superlist", "middle of superlist" );
is( $f->( [ 0, 1, 2, 3, 4, 5 ], [ 3, 4, 5 ] ),
  "superlist", "end of superlist" );
is( $f->( [ ( 0 .. 999 ) x 100, 1000 .. 1099 ], [ 900 .. 1049 ] ),
  "superlist", "large list" );
is(
  $f->(
    [ grep { !( $_ % 15 ) } 3 .. 200 ],
    [ grep { !( $_ % 3 ) } 3 .. 200 ]
  ),
  "unequal",
  "spread sublist"
);
