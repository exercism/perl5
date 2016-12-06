#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = $ENV{EXERCISM} ? 'Example' : 'DNA';

my @cases = (
   ['C', 'G',  'cytosine unchanged'],
   ['G', 'C',  'guanine unchanged'],
   ['T', 'A',  'adenine unchanged'],
   ['A', 'U',  'thymine to uracil'],
   ['ACGTGGTCTTAA', 'UGCACCAGAAUU', 'transcribes all occurences'],
);

plan tests => 3 + @cases;

ok -e "${dir}${module}.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a module called $module.pm with a function called to_rna() that gets one parameter: a DNA sequence");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with some true value?");

can_ok($module, 'to_rna') or BAIL_OUT("Missing package $module; or missing sub to_rna");

my $sub = $module . '::to_rna';

foreach my $c (@cases) {
    no strict 'refs';
    is $sub->($c->[0]), $c->[1], "$c->[2]: $c->[0]   => $c->[1]";
}


