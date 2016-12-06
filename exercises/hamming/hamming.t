#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = $ENV{EXERCISM} ? 'Example' : 'Hamming';

plan tests => 12;

ok -e "${dir}${module}.pm", "Missing $module.pm" or BAIL_OUT "You need to create file: $module.pm";
eval "use $module";
ok !$@, "Cannot load $module" or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";
can_ok $module, 'compute' or BAIL_OUT "Missing package $module; or missing sub compute()?";

sub dies_like(&$$) {
    my( $code, $expected, $message ) = @_;
    eval { $code->() };
    like $@ => $expected, $message;
}

my $sub = \&{"$module" . "::compute"}; 
is $sub->('A', 'A'), 0, "identical strands";
is $sub->('A', 'G'), 1, "different strands";
is $sub->('AG', 'CT'), 2, "completely different strands";
is $sub->('AT', 'CT'), 1, "one hamming distance";
is $sub->('GGACG', 'GGTCG'), 1, "one hamming distance, longer strands";
is $sub->('GATACA', 'GCATAA'), 4, "4 hamming distance";
is $sub->('GGACGGATTCTG', 'AGGACGGATTCT'), 9, "9 hamming distance";

dies_like { $sub->('AAAG', 'AAA') } 
    qr/DNA strands must be of equal length/, 
    "extra length on 1st strand";

dies_like { $sub->('AAA', 'AAAG') } 
    qr/DNA strands must be of equal length/, 
    "extra length on 2nd strand";
