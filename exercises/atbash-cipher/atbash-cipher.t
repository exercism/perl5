#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

use AtbashCipher qw(encode_atbash decode_atbash);

my $C_DATA = do { local $/; decode_json(<DATA>); };
plan 15;

imported_ok qw(encode_atbash decode_atbash) or bail_out;

for my $case_set ( @{ $C_DATA->{cases} } ) {
  is(
    $case_set->{description} eq 'encode'
    ? encode_atbash( $_->{input}{phrase} )
    : decode_atbash( $_->{input}{phrase} ),
    $_->{expected}, $_->{description}
  ) for @{ $case_set->{cases} };
}

__DATA__
{
  "exercise": "atbash-cipher",
  "version": "1.2.0",
  "comments": [
    "The tests are divided into two groups: ",
    "* Encoding from English to atbash cipher",
    "* Decoding from atbash cipher to all-lowercase-mashed-together English"
  ],
  "cases": [
    {
      "description": "encode",
      "comments": [ "Test encoding from English to atbash" ],
      "cases": [
        {
          "description": "encode yes",
          "property": "encode",
          "input": {
            "phrase": "yes"
          },
          "expected": "bvh"
        },
        {
          "description": "encode no",
          "property": "encode",
          "input": {
            "phrase": "no"
          },
          "expected": "ml"
        },
        {
          "description": "encode OMG",
          "property": "encode",
          "input": {
            "phrase": "OMG"
          },
          "expected": "lnt"
        },
        {
          "description": "encode spaces",
          "property": "encode",
          "input": {
            "phrase": "O M G"
          },
          "expected": "lnt"
        },
        {
          "description": "encode mindblowingly",
          "property": "encode",
          "input": {
            "phrase": "mindblowingly"
          },
          "expected": "nrmwy oldrm tob"
        },
        {
          "description": "encode numbers",
          "property": "encode",
          "input": {
            "phrase": "Testing,1 2 3, testing."
          },
          "expected": "gvhgr mt123 gvhgr mt"
        },
        {
          "description": "encode deep thought",
          "property": "encode",
          "input": {
            "phrase": "Truth is fiction."
          },
          "expected": "gifgs rhurx grlm"
        },
        {
          "description": "encode all the letters",
          "property": "encode",
          "input": {
            "phrase": "The quick brown fox jumps over the lazy dog."
          },
          "expected": "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
        }
      ]
    },
    {
      "description": "decode",
      "comments": [ "Test decoding from atbash to English" ],
      "cases": [
        {
          "description": "decode exercism",
          "property": "decode",
          "input": {
            "phrase": "vcvix rhn"
          },
          "expected": "exercism"
        },
        {
          "description": "decode a sentence",
          "property": "decode",
          "input": {
            "phrase": "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
          },
          "expected": "anobstacleisoftenasteppingstone"
        },
        {
          "description": "decode numbers",
          "property": "decode",
          "input": {
            "phrase": "gvhgr mt123 gvhgr mt"
          },
          "expected": "testing123testing"
        },
        {
          "description": "decode all the letters",
          "property": "decode",
          "input": {
            "phrase": "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
          },
          "expected": "thequickbrownfoxjumpsoverthelazydog"
        },
        {
          "description": "decode with too many spaces",
          "property": "decode",
          "input": {
            "phrase": "vc vix    r hn"
          },
          "expected": "exercism"
        },
        {
          "description": "decode with no spaces",
          "property": "decode",
          "input": {
            "phrase": "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
          },
          "expected": "anobstacleisoftenasteppingstone"
        }
      ]
    }
  ]
}
