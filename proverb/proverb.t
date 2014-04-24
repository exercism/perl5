use strict;
use warnings;

use Test::More;
use JSON qw(from_json);
my $module = $ENV{EXERCISM} ? 'Example' : 'Proverb';
my $sub = 'proverb';

my $cases_file = 'cases.json';
my $cases;
if (open my $fh, '<', $cases_file) {
    local $/ = undef;
    $cases = from_json scalar <$fh>;
} else {
    die "Could not open '$cases_file' $!";
}

plan tests => 3 + @$cases;

ok -e "$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ?");

can_ok($module, 'proverb') or BAIL_OUT("Missing package $module; or missing sub proverb()");

$sub = "${module}::proverb";

foreach my $c (@$cases) {
    no strict 'refs';
    my $expected = join "" => @{$c->{expected}};
    is $sub->($c->{param}, $c->{qualifier} || ""), $expected, $c->{name};
}
