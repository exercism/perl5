#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Gigasecond qw<add_gigasecond>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 6;

imported_ok qw<add_gigasecond> or bail_out;

for my $case (@test_cases) {
  is add_gigasecond( $case->{input}{moment} ), $case->{expected},
    $case->{description};
}

__DATA__
[
  {
    "description": "date only specification of time",
    "expected": "2043-01-01T01:46:40",
    "input": {
      "moment": "2011-04-25"
    },
    "property": "add"
  },
  {
    "description": "second test for date only specification of time",
    "expected": "2009-02-19T01:46:40",
    "input": {
      "moment": "1977-06-13"
    },
    "property": "add"
  },
  {
    "description": "third test for date only specification of time",
    "expected": "1991-03-27T01:46:40",
    "input": {
      "moment": "1959-07-19"
    },
    "property": "add"
  },
  {
    "description": "full time specified",
    "expected": "2046-10-02T23:46:40",
    "input": {
      "moment": "2015-01-24T22:00:00"
    },
    "property": "add"
  },
  {
    "description": "full time with day roll-over",
    "expected": "2046-10-03T01:46:39",
    "input": {
      "moment": "2015-01-24T23:59:59"
    },
    "property": "add"
  }
]
