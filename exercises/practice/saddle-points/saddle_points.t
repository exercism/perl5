#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Matrix';

plan 16;

ok -e "$Bin/$module.pm", "Missing $module.pm"
  or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";
ok !$@, "Cannot load $module"
  or BAIL_OUT
  "Cannot load $module; Does it compile? Does it end with 1;?";

can_ok $module, "new"
  or BAIL_OUT "Missing package $module; or missing sub new()";

can_ok $module, "rows"
  or BAIL_OUT "Missing package $module; or missing sub rows()";

can_ok $module, "columns"
  or BAIL_OUT "Missing package $module; or missing sub columns()";

can_ok $module, "saddle_points"
  or BAIL_OUT
  "Missing package $module; or missing sub saddle_points()";

my $matrix;

# test rows & columns
$matrix = $module->new("1 2\n10 20");
is_deeply $matrix->rows(0), [ 1, 2 ], "extract a row"
  or diag explain $matrix->rows(0);

$matrix = $module->new("9 7\n8 6");
is_deeply $matrix->rows(0), [ 9, 7 ], "extract a row"
  or diag explain $matrix->rows(0);

$matrix = $module->new("9 8 7\n19 18 17");
is_deeply $matrix->rows(1), [ 19, 18, 17 ], "extract other row"
  or diag explain $matrix->rows(1);

$matrix = $module->new("1 4 9\n16 25 36");
is_deeply $matrix->rows(1), [ 16, 25, 36 ], "extract other row"
  or diag explain $matrix->rows(1);

$matrix = $module->new("1 2 3\n4 5 6\n7 8 9\n8 7 6");
is_deeply $matrix->columns(0), [ 1, 4, 7, 8 ], "extract a column"
  or diag explain $matrix->columns(0);

$matrix = $module->new("89 1903 3\n18 3 1\n9 4 800");
is_deeply $matrix->columns(1), [ 1903, 3, 4 ],
  "extract another column"
  or diag explain $matrix->columns(1);

# test saddle-points
$matrix = $module->new("2 1\n1 2");
is_deeply $matrix->saddle_points, [], "no saddle-point"
  or diag explain $matrix->saddle_points;

$matrix = $module->new("1 2\n3 4");
is_deeply $matrix->saddle_points, [ [ 0, 1 ] ], "one saddle-point"
  or diag explain $matrix->saddle_points;

$matrix = $module->new("18 3 39 19 91\n38 10 8 77 320\n3 4 8 6 7");
is_deeply $matrix->saddle_points, [ [ 2, 2 ] ], "another saddle-point"
  or diag explain $matrix->saddle_points;

$matrix = $module->new("4 5 4\n3 5 5\n1 5 4");
is_deeply $matrix->saddle_points, [ [ 0, 1 ], [ 1, 1 ], [ 2, 1 ] ],
  "multiple saddle-point"
  or diag explain $matrix->saddle_points;
