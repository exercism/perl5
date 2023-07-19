#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use TwelveDays qw<recite>;

is( # begin: c0b5a5e6-c89d-49b1-a6b2-9f523bff33f7
    recite( 1, 1 ),
    "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.",
    "verse: first day a partridge in a pear tree",
); # end: c0b5a5e6-c89d-49b1-a6b2-9f523bff33f7

is( # begin: 1c64508a-df3d-420a-b8e1-fe408847854a
    recite( 2, 2 ),
    "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.",
    "verse: second day two turtle doves",
); # end: 1c64508a-df3d-420a-b8e1-fe408847854a

is( # begin: a919e09c-75b2-4e64-bb23-de4a692060a8
    recite( 3, 3 ),
    "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    "verse: third day three french hens",
); # end: a919e09c-75b2-4e64-bb23-de4a692060a8

is( # begin: 9bed8631-ec60-4894-a3bb-4f0ec9fbe68d
    recite( 4, 4 ),
    "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    "verse: fourth day four calling birds",
); # end: 9bed8631-ec60-4894-a3bb-4f0ec9fbe68d

is( # begin: cf1024f0-73b6-4545-be57-e9cea565289a
    recite( 5, 5 ),
    "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    "verse: fifth day five gold rings",
); # end: cf1024f0-73b6-4545-be57-e9cea565289a

is( # begin: 50bd3393-868a-4f24-a618-68df3d02ff04
    recite( 6, 6 ),
    "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    "verse: sixth day six geese-a-laying",
); # end: 50bd3393-868a-4f24-a618-68df3d02ff04

is( # begin: 8f29638c-9bf1-4680-94be-e8b84e4ade83
    recite( 7, 7 ),
    "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    "verse: seventh day seven swans-a-swimming",
); # end: 8f29638c-9bf1-4680-94be-e8b84e4ade83

is( # begin: 7038d6e1-e377-47ad-8c37-10670a05bc05
    recite( 8, 8 ),
    "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    "verse: eighth day eight maids-a-milking",
); # end: 7038d6e1-e377-47ad-8c37-10670a05bc05

is( # begin: 37a800a6-7a56-4352-8d72-0f51eb37cfe8
    recite( 9, 9 ),
    "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    "verse: ninth day nine ladies dancing",
); # end: 37a800a6-7a56-4352-8d72-0f51eb37cfe8

is( # begin: 10b158aa-49ff-4b2d-afc3-13af9133510d
    recite( 10, 10 ),
    "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    "verse: tenth day ten lords-a-leaping",
); # end: 10b158aa-49ff-4b2d-afc3-13af9133510d

is( # begin: 08d7d453-f2ba-478d-8df0-d39ea6a4f457
    recite( 11, 11 ),
    "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    "verse: eleventh day eleven pipers piping",
); # end: 08d7d453-f2ba-478d-8df0-d39ea6a4f457

is( # begin: 0620fea7-1704-4e48-b557-c05bf43967f0
    recite( 12, 12 ),
    "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
    "verse: twelfth day twelve drummers drumming",
); # end: 0620fea7-1704-4e48-b557-c05bf43967f0

is( # begin: da8b9013-b1e8-49df-b6ef-ddec0219e398
    [ split /\n/, recite( 1, 3 ) // '' ],
    [ "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.", "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.", "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree." ],
    "lyrics: recites first three verses of the song",
); # end: da8b9013-b1e8-49df-b6ef-ddec0219e398

is( # begin: c095af0d-3137-4653-ad32-bfb899eda24c
    [ split /\n/, recite( 4, 6 ) // '' ],
    [ "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.", "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.", "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree." ],
    "lyrics: recites three verses from the middle of the song",
); # end: c095af0d-3137-4653-ad32-bfb899eda24c

is( # begin: 20921bc9-cc52-4627-80b3-198cbbfcf9b7
    [ split /\n/, recite( 1, 12 ) // '' ],
    [ "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.", "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.", "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.", "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.", "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.", "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.", "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.", "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.", "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.", "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.", "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.", "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree." ],
    "lyrics: recites the whole song",
); # end: 20921bc9-cc52-4627-80b3-198cbbfcf9b7

done_testing;
