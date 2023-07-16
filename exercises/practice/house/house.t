#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use House qw<recite>;

imported_ok qw<recite> or bail_out;

is( # begin: 28a540ff-f765-4348-9d57-ae33f25f41f2
    recite( 1, 1 ),
    "This is the house that Jack built.",
    "verse one - the house that jack built",
); # end: 28a540ff-f765-4348-9d57-ae33f25f41f2

is( # begin: ebc825ac-6e2b-4a5e-9afd-95732191c8da
    recite( 2, 2 ),
    "This is the malt that lay in the house that Jack built.",
    "verse two - the malt that lay",
); # end: ebc825ac-6e2b-4a5e-9afd-95732191c8da

is( # begin: 1ed8bb0f-edb8-4bd1-b6d4-b64754fe4a60
    recite( 3, 3 ),
    "This is the rat that ate the malt that lay in the house that Jack built.",
    "verse three - the rat that ate",
); # end: 1ed8bb0f-edb8-4bd1-b6d4-b64754fe4a60

is( # begin: 64b0954e-8b7d-4d14-aad0-d3f6ce297a30
    recite( 4, 4 ),
    "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse four - the cat that killed",
); # end: 64b0954e-8b7d-4d14-aad0-d3f6ce297a30

is( # begin: 1e8d56bc-fe31-424d-9084-61e6111d2c82
    recite( 5, 5 ),
    "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse five - the dog that worried",
); # end: 1e8d56bc-fe31-424d-9084-61e6111d2c82

is( # begin: 6312dc6f-ab0a-40c9-8a55-8d4e582beac4
    recite( 6, 6 ),
    "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse six - the cow with the crumpled horn",
); # end: 6312dc6f-ab0a-40c9-8a55-8d4e582beac4

is( # begin: 68f76d18-6e19-4692-819c-5ff6a7f92feb
    recite( 7, 7 ),
    "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse seven - the maiden all forlorn",
); # end: 68f76d18-6e19-4692-819c-5ff6a7f92feb

is( # begin: 73872564-2004-4071-b51d-2e4326096747
    recite( 8, 8 ),
    "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse eight - the man all tattered and torn",
); # end: 73872564-2004-4071-b51d-2e4326096747

is( # begin: 0d53d743-66cb-4351-a173-82702f3338c9
    recite( 9, 9 ),
    "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse nine - the priest all shaven and shorn",
); # end: 0d53d743-66cb-4351-a173-82702f3338c9

is( # begin: 452f24dc-8fd7-4a82-be1a-3b4839cfeb41
    recite( 10, 10 ),
    "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse 10 - the rooster that crowed in the morn",
); # end: 452f24dc-8fd7-4a82-be1a-3b4839cfeb41

is( # begin: 97176f20-2dd3-4646-ac72-cffced91ea26
    recite( 11, 11 ),
    "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse 11 - the farmer sowing his corn",
); # end: 97176f20-2dd3-4646-ac72-cffced91ea26

is( # begin: 09824c29-6aad-4dcd-ac98-f61374a6a8b7
    recite( 12, 12 ),
    "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.",
    "verse 12 - the horse and the hound and the horn",
); # end: 09824c29-6aad-4dcd-ac98-f61374a6a8b7

is( # begin: d2b980d3-7851-49e1-97ab-1524515ec200
    [ split( /\n/, recite( 4, 8 ) // '' ) ],
    [ "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." ],
    "multiple verses",
); # end: d2b980d3-7851-49e1-97ab-1524515ec200

is( # begin: 0311d1d0-e085-4f23-8ae7-92406fb3e803
    [ split( /\n/, recite( 1, 12 ) // '' ) ],
    [ "This is the house that Jack built.", "This is the malt that lay in the house that Jack built.", "This is the rat that ate the malt that lay in the house that Jack built.", "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.", "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built." ],
    "full rhyme",
); # end: 0311d1d0-e085-4f23-8ae7-92406fb3e803

done_testing;
