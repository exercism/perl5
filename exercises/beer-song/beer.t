#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Beer';

use JSON::PP qw(decode_json);

my $cases;
{
    local $/ = undef;
    $cases = decode_json scalar <DATA>;
}

#diag explain $cases;
plan tests => 4 + @$cases;

ok -e "$Bin/$module.pm", "missing $module.pm"
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

__DATA__
[
    {
        "sub"       : "verse",
        "input"     : 8,
        "name"      : "test verse 8",
        "expected"  : [
            "8 bottles of beer on the wall, 8 bottles of beer.\n",
            "Take one down and pass it around, 7 bottles of beer on the wall.\n"
        ]
    },
    {
        "sub"       : "verse",
        "input"     : 1,
        "name"      : "test verse 1",
        "expected"  : [
            "1 bottle of beer on the wall, 1 bottle of beer.\n",
            "Take it down and pass it around, no more bottles of beer on the wall.\n"
        ]
    },
    {
        "sub"       : "verse",
        "input"     : 2,
        "name"      : "test verse 2",
        "expected"  : [
            "2 bottles of beer on the wall, 2 bottles of beer.\n",
            "Take one down and pass it around, 1 bottle of beer on the wall.\n"
        ]
    },
    {
        "sub"       : "verse",
        "input"     : 0,
        "name"      : "test verse zero, no more bottles",
        "expected"  : [
            "No more bottles of beer on the wall, no more bottles of beer.\n",
            "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
        ]
    },
    {
        "sub"       : "sing",
        "input"     : [8, 6],
        "name"      : "test sing from N bottle to N bottle",
        "expected"  : [
            "8 bottles of beer on the wall, 8 bottles of beer.\n",
            "Take one down and pass it around, 7 bottles of beer on the wall.\n",
            "\n",
            "7 bottles of beer on the wall, 7 bottles of beer.\n",
            "Take one down and pass it around, 6 bottles of beer on the wall.\n",
            "\n",
            "6 bottles of beer on the wall, 6 bottles of beer.\n",
            "Take one down and pass it around, 5 bottles of beer on the wall.\n",
            "\n"
        ]
    },
    {
        "sub"       : "sing",
        "input"     : [3],
        "name"      : "test sing from N bottles to no more",
        "expected"  : [
            "3 bottles of beer on the wall, 3 bottles of beer.\n",
            "Take one down and pass it around, 2 bottles of beer on the wall.\n",
            "\n",
            "2 bottles of beer on the wall, 2 bottles of beer.\n",
            "Take one down and pass it around, 1 bottle of beer on the wall.\n",
            "\n",
            "1 bottle of beer on the wall, 1 bottle of beer.\n",
            "Take it down and pass it around, no more bottles of beer on the wall.\n",
            "\n",
            "No more bottles of beer on the wall, no more bottles of beer.\n",
            "Go to the store and buy some more, 99 bottles of beer on the wall.\n",
            "\n"
        ]
    }

]
