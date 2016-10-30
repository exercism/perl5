use strict;
use warnings;

use Test::More;
use JSON qw(from_json);

my $module = $ENV{EXERCISM} ? 'Example' : 'Triangle';

my $cases_file = 'cases.json';
my $cases;
if (open my $fh, '<', $cases_file) {
    local $/ = undef;
    $cases = from_json scalar <$fh>;
} else {
    die "Could not open '$cases_file' $!";
}

plan tests => 5 + @$cases;

ok -e "$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm with a constructor called new.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ? ($@)");

foreach my $sub (qw|triangle is_triangle row|) {
    can_ok($module, $sub) or BAIL_OUT("Missing package $module; or missing sub $sub()");
}

foreach my $c (@$cases) {
    no strict 'refs';
    my $sub = "${module}::" . $c->{sub};
    if ($c->{sub} eq "triangle") {
        is_deeply $sub->($c->{param}), $c->{expected}, $c->{name};
    } else {
        is $sub->($c->{param}), $c->{expected}, $c->{name};
    }
}
