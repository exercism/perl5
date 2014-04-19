use strict;
use warnings;

use Test::More;

my $module = $ENV{EXERCISM} ? 'Example' : 'Beer';

use JSON qw(from_json);

my $cases_file = 'cases.json';
my $cases;
if (open my $fh, '<', $cases_file) {
    local $/ = undef;
    $cases = from_json scalar <$fh>;
} else {
    die "Could not open '$cases_file' $!";
}

#diag explain $cases;
plan tests => 4 + @$cases;

ok -e "$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ?");

can_ok($module, 'verse') or BAIL_OUT("Missing package $module; or missing sub verse()");
can_ok($module, 'sing') or BAIL_OUT("Missing package $module; or missing sub sing()");

foreach my $c (@$cases) {
    no strict 'refs';
    my $sub = $module . '::' . $c->{sub};
    my $expected = join '' => @{$c->{expected}}; 

    if ($c->{sub} eq 'verse') {
        is_deeply $sub->($c->{input}) , $expected, $c->{name}
    }
    if ($c->{sub} eq 'sing') {
        is_deeply $sub->( @{ $c->{input} }), $expected, $c->{name}
    }
}
