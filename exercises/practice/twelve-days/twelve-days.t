#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use TwelveDays qw<recite>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 16;

imported_ok qw<recite> or bail_out;

for my $case (@test_cases) {
  is [
    split(
      /\n/,
      recite(
        { start => $case->{input}{startVerse},
          end   => $case->{input}{endVerse},
        }
      )
    )
    ],
    $case->{expected}, $case->{description};
}

__DATA__
[
  {
    "description": "verse: first day a partridge in a pear tree",
    "expected": [
      "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 1,
      "startVerse": 1
    },
    "property": "recite"
  },
  {
    "description": "verse: second day two turtle doves",
    "expected": [
      "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 2,
      "startVerse": 2
    },
    "property": "recite"
  },
  {
    "description": "verse: third day three french hens",
    "expected": [
      "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 3,
      "startVerse": 3
    },
    "property": "recite"
  },
  {
    "description": "verse: fourth day four calling birds",
    "expected": [
      "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 4,
      "startVerse": 4
    },
    "property": "recite"
  },
  {
    "description": "verse: fifth day five gold rings",
    "expected": [
      "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 5,
      "startVerse": 5
    },
    "property": "recite"
  },
  {
    "description": "verse: sixth day six geese-a-laying",
    "expected": [
      "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 6,
      "startVerse": 6
    },
    "property": "recite"
  },
  {
    "description": "verse: seventh day seven swans-a-swimming",
    "expected": [
      "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 7,
      "startVerse": 7
    },
    "property": "recite"
  },
  {
    "description": "verse: eighth day eight maids-a-milking",
    "expected": [
      "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 8,
      "startVerse": 8
    },
    "property": "recite"
  },
  {
    "description": "verse: ninth day nine ladies dancing",
    "expected": [
      "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 9,
      "startVerse": 9
    },
    "property": "recite"
  },
  {
    "description": "verse: tenth day ten lords-a-leaping",
    "expected": [
      "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 10,
      "startVerse": 10
    },
    "property": "recite"
  },
  {
    "description": "verse: eleventh day eleven pipers piping",
    "expected": [
      "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 11,
      "startVerse": 11
    },
    "property": "recite"
  },
  {
    "description": "verse: twelfth day twelve drummers drumming",
    "expected": [
      "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 12,
      "startVerse": 12
    },
    "property": "recite"
  },
  {
    "description": "lyrics: recites first three verses of the song",
    "expected": [
      "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.",
      "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 3,
      "startVerse": 1
    },
    "property": "recite"
  },
  {
    "description": "lyrics: recites three verses from the middle of the song",
    "expected": [
      "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 6,
      "startVerse": 4
    },
    "property": "recite"
  },
  {
    "description": "lyrics: recites the whole song",
    "expected": [
      "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.",
      "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
      "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ],
    "input": {
      "endVerse": 12,
      "startVerse": 1
    },
    "property": "recite"
  }
]
