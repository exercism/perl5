#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use FoodChain qw<recite>;

imported_ok qw<recite> or bail_out;

is( [ split( /\n/, recite( 1, 1 ) // '' ) ],
    [   "I know an old lady who swallowed a fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die."
    ],
    "fly",
);

is( [ split( /\n/, recite( 2, 2 ) // '' ) ],
    [   "I know an old lady who swallowed a spider.",
        "It wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die."
    ],
    "spider",
);

is( [ split( /\n/, recite( 3, 3 ) // '' ) ],
    [   "I know an old lady who swallowed a bird.",
        "How absurd to swallow a bird!",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die."
    ],
    "bird",
);

is( [ split( /\n/, recite( 4, 4 ) // '' ) ],
    [   "I know an old lady who swallowed a cat.",
        "Imagine that, to swallow a cat!",
        "She swallowed the cat to catch the bird.",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die."
    ],
    "cat",
);

is( [ split( /\n/, recite( 5, 5 ) // '' ) ],
    [   "I know an old lady who swallowed a dog.",
        "What a hog, to swallow a dog!",
        "She swallowed the dog to catch the cat.",
        "She swallowed the cat to catch the bird.",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die."
    ],
    "dog",
);

is( [ split( /\n/, recite( 6, 6 ) // '' ) ],
    [   "I know an old lady who swallowed a goat.",
        "Just opened her throat and swallowed a goat!",
        "She swallowed the goat to catch the dog.",
        "She swallowed the dog to catch the cat.",
        "She swallowed the cat to catch the bird.",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die."
    ],
    "goat",
);

is( [ split( /\n/, recite( 7, 7 ) // '' ) ],
    [   "I know an old lady who swallowed a cow.",
        "I don't know how she swallowed a cow!",
        "She swallowed the cow to catch the goat.",
        "She swallowed the goat to catch the dog.",
        "She swallowed the dog to catch the cat.",
        "She swallowed the cat to catch the bird.",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die."
    ],
    "cow",
);

is( [ split( /\n/, recite( 8, 8 ) // '' ) ],
    [ "I know an old lady who swallowed a horse.", "She's dead, of course!" ],
    "horse",
);

is( [ split( /\n/, recite( 1, 3 ) // '' ) ],
    [   "I know an old lady who swallowed a fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "",
        "I know an old lady who swallowed a spider.",
        "It wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "",
        "I know an old lady who swallowed a bird.",
        "How absurd to swallow a bird!",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die."
    ],
    "multiple verses",
);

is( [ split( /\n/, recite( 1, 8 ) // '' ) ],
    [   "I know an old lady who swallowed a fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "",
        "I know an old lady who swallowed a spider.",
        "It wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "",
        "I know an old lady who swallowed a bird.",
        "How absurd to swallow a bird!",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "",
        "I know an old lady who swallowed a cat.",
        "Imagine that, to swallow a cat!",
        "She swallowed the cat to catch the bird.",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "",
        "I know an old lady who swallowed a dog.",
        "What a hog, to swallow a dog!",
        "She swallowed the dog to catch the cat.",
        "She swallowed the cat to catch the bird.",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "",
        "I know an old lady who swallowed a goat.",
        "Just opened her throat and swallowed a goat!",
        "She swallowed the goat to catch the dog.",
        "She swallowed the dog to catch the cat.",
        "She swallowed the cat to catch the bird.",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "",
        "I know an old lady who swallowed a cow.",
        "I don't know how she swallowed a cow!",
        "She swallowed the cow to catch the goat.",
        "She swallowed the goat to catch the dog.",
        "She swallowed the dog to catch the cat.",
        "She swallowed the cat to catch the bird.",
        "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
        "She swallowed the spider to catch the fly.",
        "I don't know why she swallowed the fly. Perhaps she'll die.",
        "",
        "I know an old lady who swallowed a horse.",
        "She's dead, of course!"
    ],
    "full song",
);

done_testing;
