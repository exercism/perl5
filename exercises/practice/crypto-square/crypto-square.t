#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use CryptoSquare qw<cipher>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<cipher> or bail_out;

for my $case (@test_cases) {
  is( cipher( $case->{input}{plaintext} ),
    $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "empty plaintext results in an empty ciphertext",
    "expected": "",
    "input": {
      "plaintext": ""
    },
    "property": "ciphertext"
  },
  {
    "description": "Lowercase",
    "expected": "a",
    "input": {
      "plaintext": "A"
    },
    "property": "ciphertext"
  },
  {
    "description": "Remove spaces",
    "expected": "b",
    "input": {
      "plaintext": "  b "
    },
    "property": "ciphertext"
  },
  {
    "description": "Remove punctuation",
    "expected": "1",
    "input": {
      "plaintext": "@1,%!"
    },
    "property": "ciphertext"
  },
  {
    "description": "9 character plaintext results in 3 chunks of 3 characters",
    "expected": "tsf hiu isn",
    "input": {
      "plaintext": "This is fun!"
    },
    "property": "ciphertext"
  },
  {
    "description": "8 character plaintext results in 3 chunks, the last one with a trailing space",
    "expected": "clu hlt io ",
    "input": {
      "plaintext": "Chill out."
    },
    "property": "ciphertext"
  },
  {
    "description": "54 character plaintext results in 7 chunks, the last two with trailing spaces",
    "expected": "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ",
    "input": {
      "plaintext": "If man was meant to stay on the ground, god would have given us roots."
    },
    "property": "ciphertext"
  }
]
