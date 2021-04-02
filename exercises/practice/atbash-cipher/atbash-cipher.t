#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use AtbashCipher qw<encode_atbash decode_atbash>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 15;

imported_ok qw<encode_atbash decode_atbash> or bail_out;

for my $case (@test_cases) {
  is(
    $case->{property} eq 'encode'
    ? encode_atbash( $case->{input}{phrase} )
    : decode_atbash( $case->{input}{phrase} ),
    $case->{expected}, $case->{description}
  );
}

__DATA__
[
  {
    "description": "encode: encode yes",
    "expected": "bvh",
    "input": {
      "phrase": "yes"
    },
    "property": "encode"
  },
  {
    "description": "encode: encode no",
    "expected": "ml",
    "input": {
      "phrase": "no"
    },
    "property": "encode"
  },
  {
    "description": "encode: encode OMG",
    "expected": "lnt",
    "input": {
      "phrase": "OMG"
    },
    "property": "encode"
  },
  {
    "description": "encode: encode spaces",
    "expected": "lnt",
    "input": {
      "phrase": "O M G"
    },
    "property": "encode"
  },
  {
    "description": "encode: encode mindblowingly",
    "expected": "nrmwy oldrm tob",
    "input": {
      "phrase": "mindblowingly"
    },
    "property": "encode"
  },
  {
    "description": "encode: encode numbers",
    "expected": "gvhgr mt123 gvhgr mt",
    "input": {
      "phrase": "Testing,1 2 3, testing."
    },
    "property": "encode"
  },
  {
    "description": "encode: encode deep thought",
    "expected": "gifgs rhurx grlm",
    "input": {
      "phrase": "Truth is fiction."
    },
    "property": "encode"
  },
  {
    "description": "encode: encode all the letters",
    "expected": "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt",
    "input": {
      "phrase": "The quick brown fox jumps over the lazy dog."
    },
    "property": "encode"
  },
  {
    "description": "decode: decode exercism",
    "expected": "exercism",
    "input": {
      "phrase": "vcvix rhn"
    },
    "property": "decode"
  },
  {
    "description": "decode: decode a sentence",
    "expected": "anobstacleisoftenasteppingstone",
    "input": {
      "phrase": "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
    },
    "property": "decode"
  },
  {
    "description": "decode: decode numbers",
    "expected": "testing123testing",
    "input": {
      "phrase": "gvhgr mt123 gvhgr mt"
    },
    "property": "decode"
  },
  {
    "description": "decode: decode all the letters",
    "expected": "thequickbrownfoxjumpsoverthelazydog",
    "input": {
      "phrase": "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
    },
    "property": "decode"
  },
  {
    "description": "decode: decode with too many spaces",
    "expected": "exercism",
    "input": {
      "phrase": "vc vix    r hn"
    },
    "property": "decode"
  },
  {
    "description": "decode: decode with no spaces",
    "expected": "anobstacleisoftenasteppingstone",
    "input": {
      "phrase": "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
    },
    "property": "decode"
  }
]
