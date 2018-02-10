#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use JSON qw(from_json);
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = 'Raindrops';

my $cases;
{
    local $/ = undef;
    $cases = from_json scalar <DATA>;
}

#plan tests => 3 + @$cases;
#diag explain $cases;

ok -e "${dir}${module}.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm with a constructor called convert.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ? ($@)");

can_ok($module, 'convert') or BAIL_OUT("Missing package $module; or missing sub convert()");

my $sub = $module->can('convert');

foreach my $c (@$cases) {
    is $sub->($c->{input}), $c->{expected}, $c->{name}
}

done_testing();

__DATA__
[
  {
    "input"    : 1,
    "expected" : 1,
    "name"     : "test_1"
  },
  {
    "input"    : 3,
    "expected" : "Pling",
    "name"     : "test_3"
  },
  {
    "input"    : 5,
    "expected" : "Plang",
    "name"     : "test_5"
  },
  {
    "input"    : 7,
    "expected" : "Plong",
    "name"     : "test_7"
  },
  {
    "input"    : 6,
    "expected" : "Pling",
    "name"     : "test_6"
  },
  {
    "input"    : 9,
    "expected" : "Pling",
    "name"     : "test_9"
  },
  {
    "input"    : 10,
    "expected" : "Plang",
    "name"     : "test_10"
  },
  {
    "input"    : 14,
    "expected" : "Plong",
    "name"     : "test_14"
  },
  {
    "input"    : 15,
    "expected" : "PlingPlang",
    "name"     : "test_15"
  },
  {
    "input"    : 21,
    "expected" : "PlingPlong",
    "name"     : "test_21"
  },
  {
    "input"    : 25,
    "expected" : "Plang",
    "name"     : "test_25"
  },
  {
    "input"    : 35,
    "expected" : "PlangPlong",
    "name"     : "test_35"
  },
  {
    "input"    : 49,
    "expected" : "Plong",
    "name"     : "test_49"
  },
  {
    "input"    : 52,
    "expected" : 52,
    "name"     : "test_52"
  },
  {
    "input"    : 105,
    "expected" : "PlingPlangPlong",
    "name"     : "test_105"
  },
  {
    "input"    : 12121,
    "expected" : 12121,
    "name"     : "test_12121"
  }
]

