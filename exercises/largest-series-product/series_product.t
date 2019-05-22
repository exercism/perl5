#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use Test2::Tools::Exception qw(dies);

my $module = 'Series';

plan 14;

ok -e "$Bin/$module.pm", "Missing $module.pm"
  or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";
ok !$@, "Cannot load $module"
  or BAIL_OUT
  "Cannot load $module. Does it compile? Does it end with 1;?";
can_ok $module, "new"
  or BAIL_OUT "Missing package $module, or missing sub new()";
can_ok $module, "largest_product"
  or BAIL_OUT
  "Missing package $module, or missing sub largest_product()";

like dies { $module->new('012')->largest_product(4) },
  qr/ArgumentError/,
  "slice length longer than digits length throws exception (largest_product)";

is $module->new('0123456789')->largest_product(2), 72,
  "largest product of 2";
is $module->new('19')->largest_product(2), 9,
  "largest product of 2 on a tiny number";
is $module->new('1027839564')->largest_product(3), 270,
  "largest product of 3";
is $module->new('52677741234314237566414902593461595376319419139427')
  ->largest_product(6), 28350,
  "largest product of 6";
is $module->new('0000')->largest_product(2), 0,
  "test string containing only zeroes";
is $module->new('99099')->largest_product(3), 0,
  "test string where all products are zero";
is $module->new('')->largest_product(0), 1,
  "test identity with empty string";
is $module->new('123')->largest_product(0), 1,
  "test identity with non-empty string";

like dies { $module->new('')->largest_product(1) }, qr/ArgumentError/,
  "non-zero slice length with empty string throws exception";
