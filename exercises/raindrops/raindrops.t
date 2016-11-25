#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use JSON qw(from_json);
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = $ENV{EXERCISM} ? 'Example' : 'Raindrops';

my $cases_file = "${dir}cases.json";
my $cases;
if (open my $fh, '<', $cases_file) {
    local $/ = undef;
    $cases = from_json scalar <$fh>;
} else {
    die "Could not open '$cases_file' $!";
}

#plan tests => 3 + @$cases;
#diag explain $cases;

ok -e "${dir}${module}.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm with a constructor called convert.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ? ($@)");

can_ok($module, 'convert') or BAIL_OUT("Missing package $module; or missing sub convert()");

my $sub = $module->can('convert');

foreach my $c (@$cases) {
    is $sub->($c->{input}), $c->{expected}, $c->{name}
}

done_testing();
