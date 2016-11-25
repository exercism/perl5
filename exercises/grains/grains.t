#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use JSON::PP;
use bigint;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $cases_file = "${dir}cases.json";
my $cases;
my $decoder = JSON::PP->new();
$decoder->allow_bignum(1);

if (open my $fh, '<', $cases_file) {
    local $/ = undef;
    $cases = $decoder->decode( scalar <$fh> );
} else {
    die "Could not open '$cases_file' $!";
}

plan tests => 4 + @$cases;

my $module = $ENV{EXERCISM} ? 'Example' : 'Grains';

ok -e "${dir}${module}.pm", "Missing $module.pm" or BAIL_OUT "You need to create a class called $module.pm";

use_ok($module)
    or BAIL_OUT "Does $module.pm compile? Does it end with 1;?";

can_ok $module, "square" or BAIL_OUT "Missing package $module; or missing sub square()";
can_ok $module, "total"  or BAIL_OUT "Missing package $module; or missing sub total()";

foreach my $c (@$cases) {
    my $sub = $module->can( $c->{sub} );

    if ($c->{sub} eq 'square') {
        cmp_ok $sub->($c->{input}), '==', 0 + $c->{expected}, $c->{name};
    }
    if ($c->{sub} eq 'total') {
        cmp_ok $sub->(), '==', 0 + $c->{expected}, $c->{name};
    }
}
