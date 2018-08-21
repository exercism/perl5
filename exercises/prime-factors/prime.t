#!/usr/bin/env perl
use strict;
use warnings;

my $module = 'Prime';

use Test::More;
use JSON::PP qw(decode_json);
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $cases;
{
    local $/ = undef;
    $cases = decode_json scalar <DATA>;
}

#plan tests => 3 + @$cases;
#diag explain $cases;

ok -e "$Bin/$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm with a constructor called factors.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ? ($@)");

can_ok($module, 'factors') or BAIL_OUT("Missing package $module; or missing sub factors()");

my $sub = $module . '::factors';

foreach my $c (@$cases) {
    no strict 'refs';
    is_deeply $sub->($c->{input}), $c->{expected}, $c->{name}
}


done_testing();

__DATA__
[
  {
     "input" : 1,
     "expected" : [],
     "name" : "test_1"
  },
  {
     "input" : 2,
     "expected" : [2],
     "name" : "test_2"
  },
  {
     "input" : 3,
     "expected" : [3],
     "name" : "test_3"
  },
  {
    "input" : 4,
    "expected" : [2, 2],
    "name" : "test_4"
  },
  {
    "input" : 6,
    "expected" : [2, 3],
    "name" : "test_6"
  },
  {
    "input" : 8,
    "expected" : [2, 2, 2],
    "name" : "test_8"
  },
  {
    "input" : 9,
    "expected" : [3, 3],
    "name" : "test_9"
  },
  {
    "input" : 27,
    "expected" : [3, 3, 3],
    "name" : "test_27"
  },
  {
    "input" : 625,
    "expected" : [5, 5, 5, 5],
    "name" : "test_625"
  },
  {
    "input" : 901255,
    "expected" : [5, 17, 23, 461],
    "name" : "test_901255"
  },
  {
    "input" : 93819012551,
    "expected" : [11, 9539, 894119],
    "name" : "test_93819012551"
  }
]
