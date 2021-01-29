#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
plan 14;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Triplet';
ok -e "$Bin/$module.pm", "Missing $module.pm"
  or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";
ok !$@, "Cannot load $module"
  or BAIL_OUT
  "Cannot load $module. Does it compile? Does it end with 1;?";

can_ok $module, "new",
  or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "is_pythagorean",
  or BAIL_OUT
  "Missing package $module; or missing sub is_pythagorean()";
can_ok $module, "sum",
  or BAIL_OUT "Missing package $module; or missing sub sum()";
can_ok $module, "product",
  or BAIL_OUT "Missing package $module; or missing sub product()";
can_ok $module, "products",
  or BAIL_OUT "Missing package $module; or missing sub products()";

my $triplet;

$triplet = $module->new( 3, 4, 5 );
is $triplet->sum, 12, "test sum";
ok $triplet->is_pythagorean, "test if pythagorean";
is $triplet->product, 60, "test product";

$triplet = $module->new( 5, 6, 7 );
ok !$triplet->is_pythagorean, "test not a pythagorean";

$triplet = $module->new( { max_factor => 10 } );
is_deeply(
  [ sort @{ $triplet->products } ],
  [ sort ( 60, 480 ) ],
  "products of pythagorean_triplets where each number is <= 10"
) or diag explain $triplet->products;

$triplet = $module->new( { min_factor => 11, max_factor => 20 } );
is_deeply( $triplet->products, [3840],
  "products of triplets where factor in 11-20" )
  or diag explain $triplet->products;

$triplet = $module->new( { sum => 180, max_factor => 100 } );

#$triplet = $module->new({sum => 180, min_factor => 20, max_factor => 80});
is_deeply(
  [ sort @{ $triplet->products } ],
  [ 118080, 168480, 202500 ],
  "products of triplets where sum=180 and max_factor is 100"
) or diag explain $triplet->products;
