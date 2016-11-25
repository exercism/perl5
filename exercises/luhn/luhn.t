#!/usr/bin/env perl
use strict;
use warnings;

use Test::More tests => 16;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = $ENV{EXERCISM} ? 'Example' : 'Luhn';

ok -e "${dir}${module}.pm", "Missing $module.pm" or BAIL_OUT "You need to create file: $module.pm";
eval "use $module";
ok !$@, "Cannot load $module" or BAIL_OUT "Cannot load $module; Does it compile? Does it end with 1;?";

can_ok $module, "new"      or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "addends"  or BAIL_OUT "Missing package $module; or missing sub addends()";
can_ok $module, "checksum" or BAIL_OUT "Missing package $module; or missing sub checksum()";
can_ok $module, "is_valid"    or BAIL_OUT "Missing package $module; or missing sub is_valid()";
can_ok $module, "create"   or BAIL_OUT "Missing package $module; or missing sub create()";

is_deeply $module->new(12121)->addends, [1, 4, 1, 4, 1],   "add 2 on addends" or diag explain $module->new(12121)->addends;
is_deeply $module->new(8631)->addends,  [7, 6, 6, 1], "subtract 9 on addends" or diag explain $module->new(8631)->addends;
is $module->new(4913)->checksum, 22, "add all addends";
is $module->new(201773)->checksum, 21, "add all addends again";
ok !$module->new(738)->is_valid, "not a Luhn number";
ok  $module->new(8739567)->is_valid, "valid Luhn number";
is $module->new(123)->create, 1230, "add digit to create a valid Luhn";
is $module->new(873956)->create, 8739567, "create a longer Luhn";
is $module->new(837263756)->create, 8372637564, "create an even longer Luhn";
