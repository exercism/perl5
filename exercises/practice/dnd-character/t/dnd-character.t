#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use DndCharacter ();

is( # begin: 1e9ae1dc-35bd-43ba-aa08-e4b94c20fa37
    DndCharacter->modifier(3),
    -4,
    "ability modifier: ability modifier for score 3 is -4"
); # end: 1e9ae1dc-35bd-43ba-aa08-e4b94c20fa37

is( # begin: cc9bb24e-56b8-4e9e-989d-a0d1a29ebb9c
    DndCharacter->modifier(4),
    -3,
    "ability modifier: ability modifier for score 4 is -3"
); # end: cc9bb24e-56b8-4e9e-989d-a0d1a29ebb9c

is( # begin: 5b519fcd-6946-41ee-91fe-34b4f9808326
    DndCharacter->modifier(5),
    -3,
    "ability modifier: ability modifier for score 5 is -3"
); # end: 5b519fcd-6946-41ee-91fe-34b4f9808326

is( # begin: dc2913bd-6d7a-402e-b1e2-6d568b1cbe21
    DndCharacter->modifier(6),
    -2,
    "ability modifier: ability modifier for score 6 is -2"
); # end: dc2913bd-6d7a-402e-b1e2-6d568b1cbe21

is( # begin: 099440f5-0d66-4b1a-8a10-8f3a03cc499f
    DndCharacter->modifier(7),
    -2,
    "ability modifier: ability modifier for score 7 is -2"
); # end: 099440f5-0d66-4b1a-8a10-8f3a03cc499f

is( # begin: cfda6e5c-3489-42f0-b22b-4acb47084df0
    DndCharacter->modifier(8),
    -1,
    "ability modifier: ability modifier for score 8 is -1"
); # end: cfda6e5c-3489-42f0-b22b-4acb47084df0

is( # begin: c70f0507-fa7e-4228-8463-858bfbba1754
    DndCharacter->modifier(9),
    -1,
    "ability modifier: ability modifier for score 9 is -1"
); # end: c70f0507-fa7e-4228-8463-858bfbba1754

is( # begin: 6f4e6c88-1cd9-46a0-92b8-db4a99b372f7
    DndCharacter->modifier(10),
    0,
    "ability modifier: ability modifier for score 10 is 0"
); # end: 6f4e6c88-1cd9-46a0-92b8-db4a99b372f7

is( # begin: e00d9e5c-63c8-413f-879d-cd9be9697097
    DndCharacter->modifier(11),
    0,
    "ability modifier: ability modifier for score 11 is 0"
); # end: e00d9e5c-63c8-413f-879d-cd9be9697097

is( # begin: eea06f3c-8de0-45e7-9d9d-b8cab4179715
    DndCharacter->modifier(12),
    1,
    "ability modifier: ability modifier for score 12 is +1"
); # end: eea06f3c-8de0-45e7-9d9d-b8cab4179715

is( # begin: 9c51f6be-db72-4af7-92ac-b293a02c0dcd
    DndCharacter->modifier(13),
    1,
    "ability modifier: ability modifier for score 13 is +1"
); # end: 9c51f6be-db72-4af7-92ac-b293a02c0dcd

is( # begin: 94053a5d-53b6-4efc-b669-a8b5098f7762
    DndCharacter->modifier(14),
    2,
    "ability modifier: ability modifier for score 14 is +2"
); # end: 94053a5d-53b6-4efc-b669-a8b5098f7762

is( # begin: 8c33e7ca-3f9f-4820-8ab3-65f2c9e2f0e2
    DndCharacter->modifier(15),
    2,
    "ability modifier: ability modifier for score 15 is +2"
); # end: 8c33e7ca-3f9f-4820-8ab3-65f2c9e2f0e2

is( # begin: c3ec871e-1791-44d0-b3cc-77e5fb4cd33d
    DndCharacter->modifier(16),
    3,
    "ability modifier: ability modifier for score 16 is +3"
); # end: c3ec871e-1791-44d0-b3cc-77e5fb4cd33d

is( # begin: 3d053cee-2888-4616-b9fd-602a3b1efff4
    DndCharacter->modifier(17),
    3,
    "ability modifier: ability modifier for score 17 is +3"
); # end: 3d053cee-2888-4616-b9fd-602a3b1efff4

is( # begin: bafd997a-e852-4e56-9f65-14b60261faee
    DndCharacter->modifier(18),
    4,
    "ability modifier: ability modifier for score 18 is +4"
); # end: bafd997a-e852-4e56-9f65-14b60261faee

ok( # begin: 4f28f19c-2e47-4453-a46a-c0d365259c14
    lives {
        for my $i ( 1 .. 100 ) {
            my $score = DndCharacter->ability();
            die if $score < 3 || $score > 18;
        }
    },
    "random ability is within range"
); # end: 4f28f19c-2e47-4453-a46a-c0d365259c14

ok( # begin: 385d7e72-864f-4e88-8279-81a7d75b04ad
    lives {
        for my $i ( 1 .. 100 ) {
            my $character = DndCharacter->new();
            die if $character->strength < 3     || $character->strength > 18;
            die if $character->dexterity < 3    || $character->dexterity > 18;
            die if $character->constitution < 3 || $character->constitution > 18;
            die if $character->intelligence < 3 || $character->intelligence > 18;
            die if $character->wisdom < 3       || $character->wisdom > 18;
            die if $character->charisma < 3     || $character->charisma > 18;
            die if $character->hitpoints != 10 + DndCharacter->modifier( $character->constitution );
        }
    },
    "random character is valid"
); # end: 385d7e72-864f-4e88-8279-81a7d75b04ad

ok( # begin: dca2b2ec-f729-4551-84b9-078876bb4808
    lives {
        for my $i ( 1 .. 100 ) {
            my $character = DndCharacter->new();
            die if $character->strength != $character->strength;
            die if $character->dexterity != $character->dexterity;
            die if $character->constitution != $character->constitution;
            die if $character->intelligence != $character->intelligence;
            die if $character->wisdom != $character->wisdom;
            die if $character->charisma != $character->charisma;
        }
    },
    "each ability is only calculated once"
); # end: dca2b2ec-f729-4551-84b9-078876bb4808

done_testing;
