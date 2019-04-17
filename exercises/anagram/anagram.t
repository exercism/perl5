#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use JSON::PP qw(decode_json);
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Anagram';

my $cases;
{
    local $/ = undef;
    $cases = decode_json scalar <DATA>;
}

plan tests => 3 + @$cases;
#diag explain $cases;

ok -e "$Bin/$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm with an function called match() that gets the original word as the first parameter and a reference to a list of word to check. It should return a referene to a list of words.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ?");

can_ok($module, 'match') or BAIL_OUT("Missing package $module; or missing sub match()");

my $sub = $module . '::match';

foreach my $c (@$cases) {
    no strict 'refs';
    is_deeply $sub->($c->{word}, @{ $c->{words} }), $c->{expected}, $c->{name};
}

__DATA__
[
  {
    "word"     : "diaper",
    "words"    : ["hello", "world", "zombies", "pants"],
    "expected" : [],
    "name"     : "no matches"
  },
  {
    "word"     : "ant",
    "words"    : ["tan", "stand", "at"],
    "expected" : ["tan"],
    "name"     : "detect_simple_anagram"
  },
  {
    "word"     : "master",
    "words"    : ["stream", "pigeon", "maters"],
    "expected" : ["stream", "maters"],
    "name"     : "multiple_anagrams"
  },
  {
    "word"     : "galea",
    "words"    : ["eagle"],
    "expected" : [],
    "name"     : "does_not_confuse_different_duplicates"
  },
  {
    "word"     : "good",
    "words"    : ["dog", "goody"],
    "expected" : [],
    "name"     : "eliminate_anagram_subsets"
  },
  {
    "word"     : "listen",
    "words"    : ["enlists", "google", "inlets", "banana"],
    "expected" : ["inlets"],
    "name"     : "detect_anagram"
  },
  {
    "word"     : "allergy",
    "words"    : ["gallery", "ballerina", "regally", "clergy", "largely", "leading"],
    "expected" : ["gallery", "regally", "largely"],
    "name"     : "multiple_anagrams"
  },
  {
    "word"     : "Orchestra",
    "words"    : ["cashregister", "Carthorse", "radishes"],
    "expected" : ["Carthorse"],
    "name"     : "anagrams_are_case_insensitive"
  },
  {
    "word"     : "banana",
    "words"    : ["banana"],
    "expected" : [],
    "name"     : "same_word_isnt_anagram"
  }
]
