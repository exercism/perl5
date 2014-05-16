use strict;
use warnings;

use Test::More;

my $module = $ENV{EXERCISM} ? 'Example' : 'Hamming';

plan tests => 11;

ok -e "$module.pm", "Missing $module.pm" or BAIL_OUT "You need to create file: $module.pm";
eval "use $module";
ok !$@, "Cannot load $module" or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";
can_ok $module, 'compute' or BAIL_OUT "Missing package $module; or missing sub compute()?";

my $sub = \&{"$module" . "::compute"}; 
is $sub->('A', 'A'), 0, "identical strands";
is $sub->('AG', 'CT'), 2, "completely different strands";
is $sub->('AT', 'CT'), 1, "one hamming distance";
is $sub->('GGACG', 'GGTCG'), 1, "one hamming distance, longer strands";
is $sub->('AAAG', 'AAA'), 0, "ignore extra length on 1st strand";
is $sub->('AAA', 'AAAG'), 0, "ignore extra length on 2nd strand";
is $sub->('GATACA', 'GCATAA'), 4, "4 hamming distance";
is $sub->('GGACGGATTCTG', 'AGGACGGATTCT'), 9, "9 hamming distance"
