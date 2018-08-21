#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Matrix';

plan tests => 11;

ok -e "$Bin/$module.pm", "Missing $module.pm" or BAIL_OUT "You need to create the file: $module.pm";
eval "use $module";
ok !$@, "Cannot load $module" or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";
can_ok $module, "new"     or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "rows"    or BAIL_OUT "Missing package $module; or missing sub rows()";
can_ok $module, "columns" or BAIL_OUT "Missing package $module; or missing sub columns()";

is_deeply $module->new("1 2\n10 20")->rows(0), [1, 2], "extract a row";
is_deeply $module->new("9 7\n8 6")->rows(0), [9, 7], "extract another row";
is_deeply $module->new("9 8 7\n19 18 17")->rows(1), [19, 18, 17], "extract 2nd row";
is_deeply $module->new("1 4 9\n16 25 36")->rows(1), [16, 25, 36], "extract 2nd row";
is_deeply $module->new("1 2 3\n4 5 6\n7 8 9\n8 7 6")->columns(0), [1, 4, 7, 8], "extract a column";
is_deeply $module->new("89 1903 3\n18 3 1\n9 4 800")->columns(1), [1903, 3, 4], "extract another column";
