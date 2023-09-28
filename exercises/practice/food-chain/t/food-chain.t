#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use FoodChain qw<recite>;

is( # begin: 751dce68-9412-496e-b6e8-855998c56166
    [ split( /\n/, recite( 1, 1 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        end;
    },
    "fly",
); # end: 751dce68-9412-496e-b6e8-855998c56166

is( # begin: 6c56f861-0c5e-4907-9a9d-b2efae389379
    [ split( /\n/, recite( 2, 2 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a spider.";
        item "It wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        end;
    },
    "spider",
); # end: 6c56f861-0c5e-4907-9a9d-b2efae389379

is( # begin: 3edf5f33-bef1-4e39-ae67-ca5eb79203fa
    [ split( /\n/, recite( 3, 3 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a bird.";
        item "How absurd to swallow a bird!";
        item "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        end;
    },
    "bird",
); # end: 3edf5f33-bef1-4e39-ae67-ca5eb79203fa

is( # begin: e866a758-e1ff-400e-9f35-f27f28cc288f
    [ split( /\n/, recite( 4, 4 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a cat.";
        item "Imagine that, to swallow a cat!";
        item "She swallowed the cat to catch the bird.";
        item "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        end;
    },
    "cat",
); # end: e866a758-e1ff-400e-9f35-f27f28cc288f

is( # begin: 3f02c30e-496b-4b2a-8491-bc7e2953cafb
    [ split( /\n/, recite( 5, 5 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a dog.";
        item "What a hog, to swallow a dog!";
        item "She swallowed the dog to catch the cat.";
        item "She swallowed the cat to catch the bird.";
        item "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        end;
    },
    "dog",
); # end: 3f02c30e-496b-4b2a-8491-bc7e2953cafb

is( # begin: 4b3fd221-01ea-46e0-825b-5734634fbc59
    [ split( /\n/, recite( 6, 6 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a goat.";
        item "Just opened her throat and swallowed a goat!";
        item "She swallowed the goat to catch the dog.";
        item "She swallowed the dog to catch the cat.";
        item "She swallowed the cat to catch the bird.";
        item "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        end;
    },
    "goat",
); # end: 4b3fd221-01ea-46e0-825b-5734634fbc59

is( # begin: 1b707da9-7001-4fac-941f-22ad9c7a65d4
    [ split( /\n/, recite( 7, 7 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a cow.";
        item "I don't know how she swallowed a cow!";
        item "She swallowed the cow to catch the goat.";
        item "She swallowed the goat to catch the dog.";
        item "She swallowed the dog to catch the cat.";
        item "She swallowed the cat to catch the bird.";
        item "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        end;
    },
    "cow",
); # end: 1b707da9-7001-4fac-941f-22ad9c7a65d4

is( # begin: 3cb10d46-ae4e-4d2c-9296-83c9ffc04cdc
    [ split( /\n/, recite( 8, 8 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a horse.";
        item "She's dead, of course!";
        end;
    },
    "horse",
); # end: 3cb10d46-ae4e-4d2c-9296-83c9ffc04cdc

is( # begin: 22b863d5-17e4-4d1e-93e4-617329a5c050
    [ split( /\n/, recite( 1, 3 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        item "";
        item "I know an old lady who swallowed a spider.";
        item "It wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        item "";
        item "I know an old lady who swallowed a bird.";
        item "How absurd to swallow a bird!";
        item "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        end;
    },
    "multiple verses",
); # end: 22b863d5-17e4-4d1e-93e4-617329a5c050

is( # begin: e626b32b-745c-4101-bcbd-3b13456893db
    [ split( /\n/, recite( 1, 8 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        item "";
        item "I know an old lady who swallowed a spider.";
        item "It wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        item "";
        item "I know an old lady who swallowed a bird.";
        item "How absurd to swallow a bird!";
        item "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        item "";
        item "I know an old lady who swallowed a cat.";
        item "Imagine that, to swallow a cat!";
        item "She swallowed the cat to catch the bird.";
        item "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        item "";
        item "I know an old lady who swallowed a dog.";
        item "What a hog, to swallow a dog!";
        item "She swallowed the dog to catch the cat.";
        item "She swallowed the cat to catch the bird.";
        item "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        item "";
        item "I know an old lady who swallowed a goat.";
        item "Just opened her throat and swallowed a goat!";
        item "She swallowed the goat to catch the dog.";
        item "She swallowed the dog to catch the cat.";
        item "She swallowed the cat to catch the bird.";
        item "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        item "";
        item "I know an old lady who swallowed a cow.";
        item "I don't know how she swallowed a cow!";
        item "She swallowed the cow to catch the goat.";
        item "She swallowed the goat to catch the dog.";
        item "She swallowed the dog to catch the cat.";
        item "She swallowed the cat to catch the bird.";
        item "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        item "";
        item "I know an old lady who swallowed a horse.";
        item "She's dead, of course!";
        end;
    },
    "full song",
); # end: e626b32b-745c-4101-bcbd-3b13456893db

done_testing;
