#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use House qw<recite>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<recite> or bail_out;

for my $case (@test_cases) {
  is( recite( $case->{input} ),
    $case->{expected}, $case->{description}, );
}

done_testing;

__DATA__
[
  {
    "description": "verse one - the house that jack built",
    "expected": [
      "This is the house that Jack built."
    ],
    "input": {
      "endVerse": 1,
      "startVerse": 1
    },
    "property": "recite"
  },
  {
    "description": "verse two - the malt that lay",
    "expected": [
      "This is the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 2,
      "startVerse": 2
    },
    "property": "recite"
  },
  {
    "description": "verse three - the rat that ate",
    "expected": [
      "This is the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 3,
      "startVerse": 3
    },
    "property": "recite"
  },
  {
    "description": "verse four - the cat that killed",
    "expected": [
      "This is the cat that killed the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 4,
      "startVerse": 4
    },
    "property": "recite"
  },
  {
    "description": "verse five - the dog that worried",
    "expected": [
      "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 5,
      "startVerse": 5
    },
    "property": "recite"
  },
  {
    "description": "verse six - the cow with the crumpled horn",
    "expected": [
      "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 6,
      "startVerse": 6
    },
    "property": "recite"
  },
  {
    "description": "verse seven - the maiden all forlorn",
    "expected": [
      "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 7,
      "startVerse": 7
    },
    "property": "recite"
  },
  {
    "description": "verse eight - the man all tattered and torn",
    "expected": [
      "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 8,
      "startVerse": 8
    },
    "property": "recite"
  },
  {
    "description": "verse nine - the priest all shaven and shorn",
    "expected": [
      "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 9,
      "startVerse": 9
    },
    "property": "recite"
  },
  {
    "description": "verse 10 - the rooster that crowed in the morn",
    "expected": [
      "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 10,
      "startVerse": 10
    },
    "property": "recite"
  },
  {
    "description": "verse 11 - the farmer sowing his corn",
    "expected": [
      "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 11,
      "startVerse": 11
    },
    "property": "recite"
  },
  {
    "description": "verse 12 - the horse and the hound and the horn",
    "expected": [
      "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 12,
      "startVerse": 12
    },
    "property": "recite"
  },
  {
    "description": "multiple verses",
    "expected": [
      "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 8,
      "startVerse": 4
    },
    "property": "recite"
  },
  {
    "description": "full rhyme",
    "expected": [
      "This is the house that Jack built.",
      "This is the malt that lay in the house that Jack built.",
      "This is the rat that ate the malt that lay in the house that Jack built.",
      "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
      "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    ],
    "input": {
      "endVerse": 12,
      "startVerse": 1
    },
    "property": "recite"
  }
]
