use strict;
use warnings;
use Test::More;

my $module = $ENV{EXERCISM} ? 'Example' : 'Leap';

my @cases = (
    # input expected output  title
    [1996,  1,               'Is a leap year'],
    [1997,  0,               'Is not a leap year'],
    [1900,  0,               'Is not a leap year'],
    [2400,  1,               'Is a leap year'],
);

plan tests => 3 + @cases;

ok -e "$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a module called $module.pm with a function called is_leap() that gets one parameter: the year.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ?");

can_ok($module, 'is_leap') or BAIL_OUT("Missing package $module with sub sub is_leap()");

my $sub = $module . '::is_leap';

foreach my $c (@cases) {
    my $title = $c->[2] ? "$c->[2]: $c->[0]" : $c->[0];
    no strict 'refs';
    is $sub->($c->[0]), $c->[1], $title;
}

