#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use SpaceAge qw<age_on_planet>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<age_on_planet> or bail_out;

for my $case (@test_cases) {
    is( age_on_planet( $case->{input} ),
        $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "age on Earth",
    "expected": 31.69,
    "input": {
      "planet": "Earth",
      "seconds": 1000000000
    },
    "property": "age"
  },
  {
    "description": "age on Mercury",
    "expected": 280.88,
    "input": {
      "planet": "Mercury",
      "seconds": 2134835688
    },
    "property": "age"
  },
  {
    "description": "age on Venus",
    "expected": 9.78,
    "input": {
      "planet": "Venus",
      "seconds": 189839836
    },
    "property": "age"
  },
  {
    "description": "age on Mars",
    "expected": 35.88,
    "input": {
      "planet": "Mars",
      "seconds": 2129871239
    },
    "property": "age"
  },
  {
    "description": "age on Jupiter",
    "expected": 2.41,
    "input": {
      "planet": "Jupiter",
      "seconds": 901876382
    },
    "property": "age"
  },
  {
    "description": "age on Saturn",
    "expected": 2.15,
    "input": {
      "planet": "Saturn",
      "seconds": 2000000000
    },
    "property": "age"
  },
  {
    "description": "age on Uranus",
    "expected": 0.46,
    "input": {
      "planet": "Uranus",
      "seconds": 1210123456
    },
    "property": "age"
  },
  {
    "description": "age on Neptune",
    "expected": 0.35,
    "input": {
      "planet": "Neptune",
      "seconds": 1821023456
    },
    "property": "age"
  }
]
