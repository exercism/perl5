#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Cipher';

use JSON::PP qw(decode_json);

my $cases;
{
    local $/ = undef;
    $cases = decode_json scalar <DATA>;
}

plan tests => 4 + @$cases;

ok -e "$Bin/$module.pm", "Missing $module.pm",
    or BAIL_OUT "You need to create a class called $module.pm";

eval "use $module";

ok !$@, "Cannot load $module.pm"
    or BAIL_OUT "Does $module.pm compile? Does it end with 1;?";

can_ok $module, "encode" or BAIL_OUT "Missing package $module; or missing sub encode()";
can_ok $module, "decode" or BAIL_OUT "Missing package $module; or missing sub decode()";

foreach my $c (@$cases) {
    no strict 'refs';
    my $sub = "${module}::" . $c->{sub};
    is $sub->($c->{input}), $c->{expected}, $c->{name};
}

__DATA__
[
    {
        "sub"      : "encode",
        "input"    : "no",
        "expected" : "ml",
        "name"     : "encode no"
    },
    {
        "sub"      : "encode",
        "input"    : "yes",
        "expected" : "bvh",
        "name"     : "encode yes"
    },
    {
        "sub"      : "encode",
        "input"    : "OMG",
        "expected" : "lnt",
        "name"     : "not case-sensitve"
    },
    {
        "sub"      : "encode",
        "input"    : "O M G",
        "expected" : "lnt",
        "name"     : "ignore spaces"
    },
    {
        "sub"      : "encode",
        "input"    : "mindblowingly",
        "expected" : "nrmwy oldrm tob",
        "name"     : "splits into 5-letter words"
    },
    {
        "sub"      : "encode",
        "input"    : "Testing, 1 2 3, testing",
        "expected" : "gvhgr mt123 gvhgr mt",
        "name"     : "does not substitute numbers"
    },
    {
        "sub"      : "encode",
        "input"    : "Truth is fiction.",
        "expected" : "gifgs rhurx grlm",
        "name"     : "removes not alpha-numeric characters"

    },
    {
        "sub"      : "encode",
        "input"    : "The quick brown fox jumps over the lazy dog.",
        "expected" : "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt",
        "name"     : "all characters in alphabet"
    },
    {
        "sub"      : "decode",
        "input"    : "vcvix rhn",
        "expected" : "exercism",
        "name"     : "removes spaces"
    },
    {
        "sub"      : "decode",
        "input"    : "zmlyh gzxov rhlug vmzhg vkkrm thglm v",
        "expected" : "anobstacleisoftenasteppingstone",
        "name"     : "a long sentence"
    },
    {
        "sub"      : "decode",
        "input"    : "gvhgr mt123 gvhgr mt",
        "expected" : "testing123testing",
        "name"     : "does not substitue numbers"
    },
    {
        "sub"      : "decode",
        "input"    : "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt",
        "expected" : "thequickbrownfoxjumpsoverthelazydog",
        "name"     : "all characters in alphabet"
    }
]
