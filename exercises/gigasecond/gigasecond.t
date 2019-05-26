#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use Gigasecond qw(add_gigasecond);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 6;

imported_ok qw(add_gigasecond) or bail_out;

for my $case ( map @{ $_->{cases} }, @{ $C_DATA->{cases} } ) {
  is add_gigasecond( $case->{input}{moment} ), $case->{expected},
    $case->{description};
}

__DATA__
{
  "exercise": "gigasecond",
  "version": "2.0.0",
  "comments": [
    "The basic test is to add one gigasecond to a few ordinary dates.",
    "Most test programs currently check only the date and ignore the time.",
    "For languages with a native date-time type though, expected times",
    "here show the correct seconds, ignoring leap seconds.",
    "The date and time formats here are per",
    "http://www.ecma-international.org/ecma-262/5.1/#sec-15.9.1.15.",
    "",
    "Finally, as a demonstration but not really a test,",
    "some languages demonstrate the add function by inviting the",
    "solver to include their birthdate in either the solution code",
    "or test program.  The test program then shows or tests their",
    "gigasecond anniversary."
  ],
  "cases": [
    {
      "description": "Add one gigasecond to the input.",
      "cases": [
        {
          "description": "date only specification of time",
          "property": "add",
          "input": {
            "moment": "2011-04-25"
          },
          "expected": "2043-01-01T01:46:40"
        },
        {
          "description": "second test for date only specification of time",
          "property": "add",
          "input": {
            "moment": "1977-06-13"
          },
          "expected": "2009-02-19T01:46:40"
        },
        {
          "description": "third test for date only specification of time",
          "property": "add",
          "input": {
            "moment": "1959-07-19"
          },
          "expected": "1991-03-27T01:46:40"
        },
        {
          "description": "full time specified",
          "property": "add",
          "input": {
            "moment": "2015-01-24T22:00:00"
          },
          "expected": "2046-10-02T23:46:40"
        },
        {
          "description": "full time with day roll-over",
          "property": "add",
          "input": {
            "moment": "2015-01-24T23:59:59"
          },
          "expected": "2046-10-03T01:46:39"
        }
      ]
    }
  ]
}
