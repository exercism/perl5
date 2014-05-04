use strict;
use warnings;

use Test::More;

my @cases = (
    {
        input    => "apple",
        expected => "appleay"
    },
    {
        input    => "pig",
        expected => "igpay"
    },
    {
        input    => "koala",
        expected => "oalakay"
    },
    {
        input    => "chair",
        expected => "airchay"
    },
    {
        input    => "queen",
        expected => "eenquay"
    },
    {
        input    => "square",
        expected => "aresquay"
    },
    {
        input    => "therapy",
        expected => "erapythay"
    },
    {
        input    => "thrush",
        expected => "ushthray"
    },
    {
        input    => "school",
        expected => "oolschay"
    },
    {
        input    => "quick fast run",
        expected => "ickquay astfay unray"
    },
    {
        input    => "yellow",
        expected => "ellowyay"
    },
    {
        input    => "yttria",
        expected => "yttriaay"
    },
    {
        input    => "xenon",
        expected => "enonxay"
    },
    {
        input    => "xray",
        expected => "xrayay"
    }
);

my $module = $ENV{EXERCISM} ? 'Example' : 'PigLatin';

plan tests => 3 + @cases;

ok -e "$module.pm", "Missing file $module.pm",
        or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";

ok !$@, "Cannot load $module.pm",
        or BAIL_OUT "Does $module.pm compile? Does it end with 1;?"; 

can_ok $module, "translate" or BAIL_OUT "Missing packge $module; or missing sub translate()";

foreach my $c ( @cases ) {
    no strict 'refs';
    my $sub = "${module}::translate";
    is $sub->($c->{input}), $c->{expected}, "translate " . $c->{input} . " to " . $c->{expected};
}
