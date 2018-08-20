#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 4;
use JSON::PP;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use TwoFer qw(two_fer);

can_ok 'TwoFer', 'import' or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
foreach my $case (@{$C_DATA->{cases}}) {
  is two_fer($case->{input}{name}), $case->{expected}, $case->{description};
}

__DATA__
{
  "exercise": "two-fer",
  "version": "1.2.0",
  "cases": [
    {
      "description": "no name given",
      "property": "twoFer",
      "input": {
        "name": null
      },
      "expected": "One for you, one for me."
    },
    {
      "description": "a name given",
      "property": "twoFer",
      "input": {
        "name": "Alice"
      },
      "expected": "One for Alice, one for me."
    },
    {
      "description": "another name given",
      "property": "twoFer",
      "input": {
        "name": "Bob"
      },
      "expected": "One for Bob, one for me."
    }
  ]
}
