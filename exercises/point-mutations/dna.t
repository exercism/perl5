#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use JSON::PP qw(decode_json);
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'DNA';

my $cases;
{
  local $/ = undef;
  $cases = decode_json scalar <DATA>;
}

plan tests => 4 + @$cases;

ok -e "$Bin/$module.pm", "missing $module.pm"
  or BAIL_OUT("You need to create a class called $module.pm with a constructor called new.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
  or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ? ($@)");

can_ok( $module, 'new' ) or BAIL_OUT("Missing package $module; or missing sub new()");
can_ok( $module, 'hamming_distance' ) or BAIL_OUT(
  "Missing package $module; or

missing sub hamming_distance()"
);

foreach my $c (@$cases) {
  is $module->new( $c->{strand} )->hamming_distance( $c->{input} ), $c->{expected}, $c->{name};
}

__DATA__
[
    {
        "strand"   : "",
        "input"    : "",
        "expected" : 0,
        "name"     : "empty strands"
    },
    {
        "strand"   : "GGACGTA",
        "input"    : "GGACGTA",
        "expected" : 0,
        "name"     : "identical strands"
    },
    {
        "strand"   : "ACT",
        "input"    : "GGA",
        "expected" : 3,
        "name"     : "small strands"
    },
    {
        "strand"   : "GGACGGATTCTGACCTGGACTAATTTTGGGG",
        "input"    : "AGGACGGATTCTGACCTGGACTAATTTTGGGG",
        "expected" : 19,
        "name"     : "input strand is longer by one"
    },
    {
        "strand"   : "GGACG",
        "input"    : "GGTCG",
        "expected" : 1,
        "name"     : "distance in the middle"
    },
    {
        "strand"   : "ACCAGGG",
        "input"    : "ACTATGG",
        "expected" : 2,
        "name"     : "longer strands of same length"

    },
    {
        "strand"   : "AAACTAGGGG",
        "input"    : "AGGCTAGCGGTAGGAC",
        "expected" : 3,
        "name"     : "input strand is longer"
    },
    {
        "strand"   : "GACTACGGACAGGGTAGGGAAT",
        "input"    : "GACATCGCACACC",
        "expected" : 5,
        "name"     : "original strand is longer"
    },
    {
        "strand"   : "AGACAACAGCCAGCCGCCGGATT",
        "input"    : "AGGCAA",
        "expected" : 1,
        "name"     : "does not shorten original strand test 1"
    },
    {
        "strand"   : "AGACAACAGCCAGCCGCCGGATT",
        "input"    : "AGACATCTTTCAGCCGCCGGATTAGGCAA",
        "expected" : 4,
        "name"     : "does not shorten original strand test 2"
    },
    {
        "strand"   : "AGACAACAGCCAGCCGCCGGATT",
        "input"    : "AGG",
        "expected" : 1,
        "name"     : "does not shorten original strand test 3"
    }
]
