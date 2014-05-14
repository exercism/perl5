use strict;
use warnings;

use Test::More;

my $extension_cases = 0;
# $extension_cases = 5; # uncomment if you implement extensions

plan tests => 11 + $extension_cases;

my $module = $ENV{EXERCISM} ? 'Example' : 'Word';

ok -e "$module.pm", "Missing $module.pm" or BAIL_OUT "You need to create file: $module.pm";
eval "use $module";
ok !$@, "Cannot load $module" or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";
can_ok $module, "new"   or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "score" or BAIL_OUT "Missing package $module; or missing sub score()";


is $module->new("")->score, 0, "empty word scores zero";
is $module->new(" \t\n")->score, 0, "whitespaces scores zero";
is $module->new("a")->score, 1, "'a' scores 1";
is $module->new("f")->score, 4, "'f' scores 4";
is $module->new("street")->score, 6, "'street' scores 6";
is $module->new("quirky")->score, 22, "'quirky' scores 22";
is $module->new("MULTIBILLIONAIRE")->score, 20, "'MULTIBILLIONAIRE' scores 20";


SKIP: {
    skip "only if extensions are enabled. double and triple", $extension_cases unless $extension_cases;
    is $module->new("quirky")->score( double => 1 ), 44, "'quirky x2' scores 44 (double)";
    is $module->new("quirky")->score( double => 2 ), 88, "'quirky x2 x2' scores 88 (double-double)";
    is $module->new("quirky")->score( triple => 1 ), 66, "'quirky x3' scores 66 (triple)";
    is $module->new("quirky")->score( triple => 2 ), 198, "'quirky x3 x3' scores 198 (triple-triple)";
    is $module->new("quirky")->score( double => 1, triple => 1 ), 132, "'quirky x2 x3' scores 132 (double-triple)";
}
