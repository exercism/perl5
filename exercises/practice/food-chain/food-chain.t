#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use FoodChain qw<recite>;

is(
    [ split( /\n/, recite( 1, 1 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        end;
    },
    "fly",
);

is(
    [ split( /\n/, recite( 2, 2 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a spider.";
        item "It wriggled and jiggled and tickled inside her.";
        item "She swallowed the spider to catch the fly.";
        item "I don't know why she swallowed the fly. Perhaps she'll die.";
        end;
    },
    "spider",
);

is(
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
);

is(
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
);

is(
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
);

is(
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
);

is(
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
);

is(
    [ split( /\n/, recite( 8, 8 ) // '' ) ],
    array {
        item "I know an old lady who swallowed a horse.";
        item "She's dead, of course!";
        end;
    },
    "horse",
);

is(
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
);

is(
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
);

done_testing;
