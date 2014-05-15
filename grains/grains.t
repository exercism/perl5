use strict;
use warnings;

use Test::More;
use JSON qw(from_json);

my $cases_file = 'cases.json';
my $cases;

if (open my $fh, '<', $cases_file) {
    local $/ = undef;
    $cases = from_json scalar <$fh>;
} else {
    die "Could not open '$cases_file' $!";
}

plan tests => 4 + @$cases;

my $module = $ENV{EXERCISM} ? 'Example' : 'Grains';

ok  -e "$module.pm", "Missing $module.pm" or BAIL_OUT "You need to create a class called $module.pm";

eval "use $module";

ok !$@, "Cannot load $module.pm"
    or BAIL_OUT "Does $module.pm compile? Does it end with 1;?";

can_ok $module, "square" or BAIL_OUT "Missing package $module; or missing sub square()";
can_ok $module, "total"  or BAIL_OUT "Missing package $module; or missing sub total()";

foreach my $c (@$cases) {
    no strict 'refs';
    my $sub = "${module}::" . $c->{sub};

    if ($c->{sub} eq 'square') {
        is $sub->($c->{input}), $c->{expected}, $c->{name};
    }
    if ($c->{sub} eq 'total') {
        is $sub->(), $c->{expected}, $c->{name};
    }
}
