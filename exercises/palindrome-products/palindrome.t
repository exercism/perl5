#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Palindrome';

plan 15;

ok -e "$Bin/$module.pm", "Missing $module.pm"
  or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";
ok !$@, "Cannot load $module"
  or BAIL_OUT
  "Cannot load $module. Does it compile? Does it end with 1;?";

can_ok $module, "new"
  or BAIL_OUT "Missing package $module or missing sub new()";
can_ok $module, "largest"
  or BAIL_OUT "Missing package $module or missing sub largest()";
can_ok $module, "smallest"
  or BAIL_OUT "Missing package $module or missing sub smallest()";

my $palindrome;
my ( $largest, $smallest );

$palindrome = $module->new( { max_factor => 9 } );
$largest    = $palindrome->largest;
is $largest->{value}, 9,
  "largest palindrome value from single digit factors";
is_deeply(
  $largest->{factors},
  [ [ 1, 9 ], [ 3, 3 ] ],
  "largest single digit palindrome factors"
) or diag explain $largest->{factors};

$palindrome = $module->new( { max_factor => 99, min_factor => 10 } );
$largest    = $palindrome->largest;
is $largest->{value}, 9009,
  "largest palindrome value from double digit factors";
is_deeply(
  [ sort @{ $largest->{factors} } ],
  [ [ 91, 99 ] ],
  "largest double digit palindrome factors"
) or diag explain $largest->{factors};

$palindrome
  = $module->new( { max_factor => 999, min_factor => 100 } );
$largest = $palindrome->largest;
is $largest->{value}, 906609,
  "largest palindrome value from triple digit factors";
is_deeply(
  $largest->{factors},
  [ [ 913, 993 ] ],
  "largest triple digit palindrome factors"
) or diag explain $largest->{factors};

$palindrome = $module->new( { max_factor => 99, min_factor => 10 } );
$smallest   = $palindrome->smallest;
is $smallest->{value}, 121,
  "smallest palindrome value from double digit factors";
is_deeply(
  $smallest->{factors},
  [ [ 11, 11 ] ],
  "smallest double digit palindrome factors"
) or diag explain $smallest->{factors};

$palindrome
  = $module->new( { max_factor => 999, min_factor => 100 } );
$smallest = $palindrome->smallest;
is $smallest->{value}, 10201,
  "smallest palindrome value from triple digit factors";
is_deeply(
  $smallest->{factors},
  [ [ 101, 101 ] ],
  "smallest triple digit palindrome factors"
) or diag explain $smallest->{factors};
