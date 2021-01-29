#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";    # Find modules in the same dir as this file.

use Leap qw(is_leap_year);

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 10;                                 # This is how many tests we expect to run.

imported_ok qw<is_leap_year> or bail_out;

for my $case (@test_cases) {
  is(
    is_leap_year( $case->{input}{year} ),
    $case->{expected} ? T : DF,          # Check if True, or Defined but False
    $case->{description}
  );
}

__DATA__
[
   {
      "description": "year not divisible by 4 in common year",
      "expected": false,
      "input": {
         "year": 2015
      },
      "property": "leapYear"
   },
   {
      "description": "year divisible by 2, not divisible by 4 in common year",
      "expected": false,
      "input": {
         "year": 1970
      },
      "property": "leapYear"
   },
   {
      "description": "year divisible by 4, not divisible by 100 in leap year",
      "expected": true,
      "input": {
         "year": 1996
      },
      "property": "leapYear"
   },
   {
      "description": "year divisible by 4 and 5 is still a leap year",
      "expected": true,
      "input": {
         "year": 1960
      },
      "property": "leapYear"
   },
   {
      "description": "year divisible by 100, not divisible by 400 in common year",
      "expected": false,
      "input": {
         "year": 2100
      },
      "property": "leapYear"
   },
   {
      "description": "year divisible by 100 but not by 3 is still not a leap year",
      "expected": false,
      "input": {
         "year": 1900
      },
      "property": "leapYear"
   },
   {
      "description": "year divisible by 400 in leap year",
      "expected": true,
      "input": {
         "year": 2000
      },
      "property": "leapYear"
   },
   {
      "description": "year divisible by 400 but not by 125 is still a leap year",
      "expected": true,
      "input": {
         "year": 2400
      },
      "property": "leapYear"
   },
   {
      "description": "year divisible by 200, not divisible by 400 in common year",
      "expected": false,
      "input": {
         "year": 1800
      },
      "property": "leapYear"
   }
]
