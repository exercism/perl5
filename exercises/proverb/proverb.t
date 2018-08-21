#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use JSON::PP qw(decode_json);
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Proverb';
my $sub = 'proverb';

my $cases;
{
    local $/ = undef;
    $cases = decode_json scalar <DATA>;
}

plan tests => 3 + @$cases;

ok -e "$Bin/$module.pm", "missing $module.pm"
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

__DATA__
[
    {
        "param"     : ["nail", "shoe"],
        "expected"  : ["For want of a nail the shoe was lost.\n",
                      "And all for the want of a nail."],
        "name"      : "one consequence"
    },
    {
        "param"     : ["nail", "shoe", "horse"],
        "expected"  : ["For want of a nail the shoe was lost.\n",
                       "For want of a shoe the horse was lost.\n",
                       "And all for the want of a nail."],
        "name"      : "two consequences"
    },
    {
        "param"     : ["nail", "shoe", "horse", "rider"],
        "expected"  : ["For want of a nail the shoe was lost.\n",
                       "For want of a shoe the horse was lost.\n",
                       "For want of a horse the rider was lost.\n",
                       "And all for the want of a nail."],
        "name"      : "three consequences"
    },
    {
        "param"     : ["key", "value"],
        "expected"  : ["For want of a key the value was lost.\n",
                      "And all for the want of a key."],
        "name"      : "one consequence, new items"
    },
    {
        "param"     : ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"],
        "expected"  : ["For want of a nail the shoe was lost.\n",
                       "For want of a shoe the horse was lost.\n",
                       "For want of a horse the rider was lost.\n",
                       "For want of a rider the message was lost.\n",
                       "For want of a message the battle was lost.\n",
                       "For want of a battle the kingdom was lost.\n",
                       "And all for the want of a nail."],
        "name"      : "whole proverb"
    },
    {
        "param"     : ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"],
        "qualifier" : "horseshoe",
        "expected"  : ["For want of a nail the shoe was lost.\n",
                       "For want of a shoe the horse was lost.\n",
                       "For want of a horse the rider was lost.\n",
                       "For want of a rider the message was lost.\n",
                       "For want of a message the battle was lost.\n",
                       "For want of a battle the kingdom was lost.\n",
                       "And all for the want of a horseshoe nail."],
        "name"      : "whole proverb with qualifier"
    }
]
