#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use TwoFer qw<two_fer>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 4;

imported_ok qw<two_fer> or bail_out;

for my $case (@test_cases) {
  is $case->{input}{name}
    ? two_fer( $case->{input}{name} )
    : two_fer(),
    $case->{expected}, $case->{description};
}

__DATA__
[
  {
    "description": "no name given",
    "expected": "One for you, one for me.",
    "input": {
      "name": null
    },
    "property": "twoFer"
  },
  {
    "description": "a name given",
    "expected": "One for Alice, one for me.",
    "input": {
      "name": "Alice"
    },
    "property": "twoFer"
  },
  {
    "description": "another name given",
    "expected": "One for Bob, one for me.",
    "input": {
      "name": "Bob"
    },
    "property": "twoFer"
  }
]
