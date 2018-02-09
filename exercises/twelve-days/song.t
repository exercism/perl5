#!/usr/bin/env perl
use strict;
use warnings;

use Test::More tests => 20;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = 'TwelveDays';

ok -e "${dir}${module}.pm", "Missing $module.pm"
        or BAIL_OUT "You need to create file $module.pm";

eval "use $module";
ok !$@, "Cannot load $module"
        or BAIL_OUT "Cannot load $module; Does it compile? Does it end with 1;?";

can_ok $module, "new"    or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "verse"  or BAIL_OUT "Missing package $module; or missing sub verse()";
can_ok $module, "verses" or BAIL_OUT "Missing package $module; or missing sub verses()";
can_ok $module, "sing"   or BAIL_OUT "Missing package $module; or missing sub sing()";

my $song = $module->new;

is  $song->verse(1),
    "On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree.\n",
    "a Partridge in a Pear Tree.";

is  $song->verse(2),
    "On the second day of Christmas my true love gave to me, two Turtle Doves, and a Partridge in a Pear Tree.\n",
    "two Turtle Doves...and a Partridge in a Pear Tree.";

is  $song->verse(3),
    "On the third day of Christmas my true love gave to me, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n",
    "three French Hens...and a Partridge in a Pear Tree.";

is  $song->verse(4),
    "On the fourth day of Christmas my true love gave to me, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n",
    "four Calling Birds...and a Partridge in a Pear Tree.";

is  $song->verse(5),
    "On the fifth day of Christmas my true love gave to me, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n",
    "five Gold Rings...and a Partridge in a Pear Tree.";

is  $song->verse(6),
    "On the sixth day of Christmas my true love gave to me, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n",
    "six Geese-a-Laying...and a Partridge in a Pear Tree.";

is  $song->verse(7),
    "On the seventh day of Christmas my true love gave to me, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n",
    "seven Swans-a-Swimming...and a Partridge in a Pear Tree.";

is  $song->verse(8),
    "On the eighth day of Christmas my true love gave to me, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n",
    "eight Maids-a-Milking...and a Partridge in a Pear Tree.";

is  $song->verse(9),
    "On the ninth day of Christmas my true love gave to me, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n",
    "nine Ladies Dancing...and a Partridge in a Pear Tree.";

is  $song->verse(10),
    "On the tenth day of Christmas my true love gave to me, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n",
    "ten Lords-a-Leaping...and a Partridge in a Pear Tree.";

is  $song->verse(11),
    "On the eleventh day of Christmas my true love gave to me, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n",
    "eleven Pipers Piping...and a Partride in a Pear Tree.";

is  $song->verse(12),
    "On the twelfth day of Christmas my true love gave to me, twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n",
    "twelve Drummers Drumming...and a Partridge in a Pear Tree.";

is  $song->verses(1, 3),
    "On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree.\n\n" .
    "On the second day of Christmas my true love gave to me, two Turtle Doves, and a Partridge in a Pear Tree.\n\n" .
    "On the third day of Christmas my true love gave to me, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\n",
    "test multiple verse";

is  $song->sing,
    $song->verses(1, 12),
    "test the whole song";
