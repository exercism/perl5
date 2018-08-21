#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use JSON::PP qw(decode_json);
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Allergies';

my $cases;
{
    local $/ = undef;
    $cases = decode_json scalar <DATA>;
}

plan tests => 4 + @$cases;

ok -e "$Bin/$module.pm" or BAIL_OUT "missing $module.pm";

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ?");

can_ok $module, "allergic_to" or BAIL_OUT("Missing package $module; or missing sub allergic_to()");
can_ok $module, "list"        or BAIL_OUT("Missing package $module; or missing sub list()");

foreach my $c (@$cases) {
    if ($c->{sub} eq 'allergic_to'){
        my $allergy = $module->new($c->{input}->[0]);
        is $allergy->allergic_to($c->{input}->[1]),  $c->{expected}, $c->{name};
    }
    if ($c->{sub} eq 'list'){
        my $allergy = $module->new($c->{input});
        is_deeply $allergy->list(), $c->{expected}, $c->{name};
    }
}

__DATA__
[
    {
        "sub"     : "allergic_to",
        "input"   : [0, "peanuts"],
        "expected": false,
        "name"    : "score 0 is not allergic_to peanuts"
    },
    {
        "sub"     : "allergic_to",
        "input"   : [0, "cats"],
        "expected": false,
        "name"    : "score 0 is not allergic_to cats"
    },
    {
        "sub"     : "allergic_to",
        "input"   : [0, "strawberries"],
        "expected": false,
        "name"    : "score 0 is not allergic_to strawberries"
    },
    {
        "sub"     : "allergic_to",
        "input"   : [1, "eggs"],
        "expected": true,
        "name"    : "score 1 is allergic_to eggs"
    },
    {
        "sub"     : "allergic_to",
        "input"   : [5, "eggs"],
        "expected": true,
        "name"    : "score 5 is allergic_to eggs"
    },
    {
        "sub"     : "allergic_to",
        "input"   : [5, "shellfish"],
        "expected": true,
        "name"    : "score 5 is allergic_to shellfish"
    },
    {
        "sub"     : "allergic_to",
        "input"   : [5, "strawberries"],
        "expected": false,
        "name"    : "score 5 is not allergic_to strawberries"
    },
    {
        "sub"     : "list",
        "input"   : 0,
        "expected": [],
        "name"    : "score 0 has empty allergens"
    },
    {
        "sub"     : "list",
        "input"   : 2,
        "expected": ["peanuts"],
        "name"    : "score 2 has one allergen"
    },
    {
        "sub"     : "list",
        "input"   : 255,
        "expected": ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"],
        "name"    : "score 255 is allergic to everything"
    },
    {
        "sub"     : "list",
        "input"   : 509,
        "expected": ["eggs", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"],
        "name"    : "score 509 ignores non allergen score parts"
    }
]

