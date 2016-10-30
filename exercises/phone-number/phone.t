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

plan tests => 6 + @$cases;

my $module = $ENV{EXERCISM} ? 'Example' : 'Phone';

ok -e "$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm with a constructor called new.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ? ($@)");

can_ok($module, 'new')       or BAIL_OUT("Missing package $module; or missing sub new()");
can_ok($module, 'number')    or BAIL_OUT("Missing package $module; or missing sub number()");
can_ok($module, 'area_code') or BAIL_OUT("Missing package $module; or missing sub area_code()");
can_ok($module, 'pretty')    or BAIL_OUT("Missing package $module; or missing sub pretty()");


foreach my $c (@$cases) {
    my $sub = $c->{sub};
    is $module->new($c->{param})->$sub,
       $c->{expected},
       $c->{name};
}
