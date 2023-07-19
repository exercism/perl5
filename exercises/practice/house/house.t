#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use House qw<recite>;

imported_ok qw<recite> or bail_out;

is(
    recite( 1, 1 ),
    "This is the house that Jack built.",
    "verse one - the house that jack built",
);

is(
    recite( 2, 2 ),
    "This is the malt that lay in the house that Jack built.",
    "verse two - the malt that lay",
);

is(
    recite( 3, 3 ),
    "This is the rat that ate the malt that lay in the house that Jack built.",
    "verse three - the rat that ate",
);

is(
    recite( 4, 4 ),
    "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse four - the cat that killed",
);

is(
    recite( 5, 5 ),
    "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse five - the dog that worried",
);

is(
    recite( 6, 6 ),
    "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse six - the cow with the crumpled horn",
);

is(
    recite( 7, 7 ),
    "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse seven - the maiden all forlorn",
);

is(
    recite( 8, 8 ),
    "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse eight - the man all tattered and torn",
);

is(
    recite( 9, 9 ),
    "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse nine - the priest all shaven and shorn",
);

is(
    recite( 10, 10 ),
    "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse 10 - the rooster that crowed in the morn",
);

is(
    recite( 11, 11 ),
    "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse 11 - the farmer sowing his corn",
);

is(
    recite( 12, 12 ),
    "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse 12 - the horse and the hound and the horn",
);

is(
    [ split( /\n/, recite( 4, 8 ) // '' ) ],
    array {
        item "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        end;
    },
    "multiple verses",
);

is(
    [ split( /\n/, recite( 1, 12 ) // '' ) ],
    array {
        item "This is the house that Jack built.";
        item "This is the malt that lay in the house that Jack built.";
        item "This is the rat that ate the malt that lay in the house that Jack built.";
        item "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        item "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.";
        end;
    },
    "full rhyme",
);

done_testing;
