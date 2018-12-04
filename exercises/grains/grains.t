#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 13;
use JSON::PP;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use Grains qw(grains_on_square total_grains);

can_ok 'Grains', 'import' or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
my @exception_cases;

foreach (@{$C_DATA->{cases}}) {
  if (exists $_->{cases}) {
    foreach my $case (@{$_->{cases}}) {
      if ($case->{property} eq 'square') {
        if ($case->{expected} == -1) {
          push @exception_cases, $case;
        }
        else {
          cmp_ok grains_on_square($case->{input}{square}), 'eq', $case->{expected}, 'square no. ' . $case->{description};
        }
      }
    }
  }
  elsif ($_->{property} eq 'total') {
    cmp_ok total_grains(), 'eq', $_->{expected}, $_->{description};
  }
}

unlike total_grains(), qr/e\+/, "Using '**' without 'use bignum;' uses doubles that are too imprecise for this result.";

SKIP: {
  eval { require Test::Fatal };
  skip 'Test::Fatal not loaded', scalar @exception_cases if $@;
  eval q{
    use Test::Fatal qw(exception);
    isnt exception {grains_on_square $_->{input}{square}}, undef, $_->{description} foreach @exception_cases;
  };
}

__DATA__
{
  "exercise": "grains",
  "version": "1.1.0",
  "comments": [
    "The final tests of square test error conditions",
    "The expectation for these tests is -1, indicating an error",
    "In these cases you should expect an error as is idiomatic for your language"
  ],
  "cases": [
    {
      "description": "returns the number of grains on the square",
      "cases": [
        {
          "description": "1",
          "property": "square",
          "input": {
            "square": 1
          },
          "expected": 1
        },
        {
          "description": "2",
          "property": "square",
          "input": {
            "square": 2
          },
          "expected": 2
        },
        {
          "description": "3",
          "property": "square",
          "input": {
            "square": 3
          },
          "expected": 4
        },
        {
          "description": "4",
          "property": "square",
          "input": {
            "square": 4
          },
          "expected": 8
        },
        {
          "description": "16",
          "property": "square",
          "input": {
            "square": 16
          },
          "expected": 32768
        },
        {
          "description": "32",
          "property": "square",
          "input": {
            "square": 32
          },
          "expected": 2147483648
        },
        {
          "description": "64",
          "property": "square",
          "input": {
            "square": 64
          },
          "expected": 9223372036854775808
        },
        {
          "description": "square 0 raises an exception",
          "property": "square",
          "input": {
            "square": 0
          },
          "expected": -1
        },
        {
          "description": "negative square raises an exception",
          "property": "square",
          "input": {
            "square": -1
          },
          "expected": -1
        },
        {
          "description": "square greater than 64 raises an exception",
          "property": "square",
          "input": {
            "square": 65
          },
          "expected": -1
        }
      ]
    },
    {
      "description": "returns the total number of grains on the board",
      "property": "total",
      "input": {},
      "expected": 18446744073709551615
    }
  ]
}
