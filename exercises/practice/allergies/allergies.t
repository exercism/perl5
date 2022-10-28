#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Allergies qw<allergic_to list_allergies>;

imported_ok qw<allergic_to list_allergies> or bail_out;

is(
    allergic_to( "eggs", 0 ),
    DF,    # Defined but False
    "testing for eggs allergy: not allergic to anything",
);

is(
    allergic_to( "eggs", 1 ),
    T,     # True
    "testing for eggs allergy: allergic only to eggs",
);

is(
    allergic_to( "eggs", 3 ),
    T,     # True
    "testing for eggs allergy: allergic to eggs and something else",
);

is(
    allergic_to( "eggs", 2 ),
    DF,    # Defined but False
    "testing for eggs allergy: allergic to something, but not eggs",
);

is(
    allergic_to( "eggs", 255 ),
    T,     # True
    "testing for eggs allergy: allergic to everything",
);

is(
    allergic_to( "peanuts", 0 ),
    DF,    # Defined but False
    "testing for peanuts allergy: not allergic to anything",
);

is(
    allergic_to( "peanuts", 2 ),
    T,     # True
    "testing for peanuts allergy: allergic only to peanuts",
);

is(
    allergic_to( "peanuts", 7 ),
    T,     # True
    "testing for peanuts allergy: allergic to peanuts and something else",
);

is(
    allergic_to( "peanuts", 5 ),
    DF,    # Defined but False
    "testing for peanuts allergy: allergic to something, but not peanuts",
);

is(
    allergic_to( "peanuts", 255 ),
    T,     # True
    "testing for peanuts allergy: allergic to everything",
);

is(
    allergic_to( "shellfish", 0 ),
    DF,    # Defined but False
    "testing for shellfish allergy: not allergic to anything",
);

is(
    allergic_to( "shellfish", 4 ),
    T,     # True
    "testing for shellfish allergy: allergic only to shellfish",
);

is(
    allergic_to( "shellfish", 14 ),
    T,     # True
    "testing for shellfish allergy: allergic to shellfish and something else",
);

is(
    allergic_to( "shellfish", 10 ),
    DF,    # Defined but False
    "testing for shellfish allergy: allergic to something, but not shellfish",
);

is(
    allergic_to( "shellfish", 255 ),
    T,     # True
    "testing for shellfish allergy: allergic to everything",
);

is(
    allergic_to( "strawberries", 0 ),
    DF,    # Defined but False
    "testing for strawberries allergy: not allergic to anything",
);

is(
    allergic_to( "strawberries", 8 ),
    T,     # True
    "testing for strawberries allergy: allergic only to strawberries",
);

is(
    allergic_to( "strawberries", 28 ),
    T,     # True
    "testing for strawberries allergy: allergic to strawberries and something else",
);

is(
    allergic_to( "strawberries", 20 ),
    DF,    # Defined but False
    "testing for strawberries allergy: allergic to something, but not strawberries",
);

is(
    allergic_to( "strawberries", 255 ),
    T,     # True
    "testing for strawberries allergy: allergic to everything",
);

is(
    allergic_to( "tomatoes", 0 ),
    DF,    # Defined but False
    "testing for tomatoes allergy: not allergic to anything",
);

is(
    allergic_to( "tomatoes", 16 ),
    T,     # True
    "testing for tomatoes allergy: allergic only to tomatoes",
);

is(
    allergic_to( "tomatoes", 56 ),
    T,     # True
    "testing for tomatoes allergy: allergic to tomatoes and something else",
);

is(
    allergic_to( "tomatoes", 40 ),
    DF,    # Defined but False
    "testing for tomatoes allergy: allergic to something, but not tomatoes",
);

is(
    allergic_to( "tomatoes", 255 ),
    T,     # True
    "testing for tomatoes allergy: allergic to everything",
);

is(
    allergic_to( "chocolate", 0 ),
    DF,    # Defined but False
    "testing for chocolate allergy: not allergic to anything",
);

is(
    allergic_to( "chocolate", 32 ),
    T,     # True
    "testing for chocolate allergy: allergic only to chocolate",
);

is(
    allergic_to( "chocolate", 112 ),
    T,     # True
    "testing for chocolate allergy: allergic to chocolate and something else",
);

is(
    allergic_to( "chocolate", 80 ),
    DF,    # Defined but False
    "testing for chocolate allergy: allergic to something, but not chocolate",
);

is(
    allergic_to( "chocolate", 255 ),
    T,     # True
    "testing for chocolate allergy: allergic to everything",
);

is(
    allergic_to( "pollen", 0 ),
    DF,    # Defined but False
    "testing for pollen allergy: not allergic to anything",
);

is(
    allergic_to( "pollen", 64 ),
    T,     # True
    "testing for pollen allergy: allergic only to pollen",
);

is(
    allergic_to( "pollen", 224 ),
    T,     # True
    "testing for pollen allergy: allergic to pollen and something else",
);

is(
    allergic_to( "pollen", 160 ),
    DF,    # Defined but False
    "testing for pollen allergy: allergic to something, but not pollen",
);

is(
    allergic_to( "pollen", 255 ),
    T,     # True
    "testing for pollen allergy: allergic to everything",
);

is(
    allergic_to( "cats", 0 ),
    DF,    # Defined but False
    "testing for cats allergy: not allergic to anything",
);

is(
    allergic_to( "cats", 128 ),
    T,     # True
    "testing for cats allergy: allergic only to cats",
);

is(
    allergic_to( "cats", 192 ),
    T,     # True
    "testing for cats allergy: allergic to cats and something else",
);

is(
    allergic_to( "cats", 64 ),
    DF,    # Defined but False
    "testing for cats allergy: allergic to something, but not cats",
);

is(
    allergic_to( "cats", 255 ),
    T,     # True
    "testing for cats allergy: allergic to everything",
);

is(
    list_allergies(0),
    bag { end; },
    "list when: no allergies",
);

is(
    list_allergies(1),
    bag { item "eggs"; end; },
    "list when: just eggs",
);

is(
    list_allergies(2),
    bag { item "peanuts"; end; },
    "list when: just peanuts",
);

is(
    list_allergies(8),
    bag { item "strawberries"; end; },
    "list when: just strawberries",
);

is(
    list_allergies(3),
    bag { item "eggs"; item "peanuts"; end; },
    "list when: eggs and peanuts",
);

is(
    list_allergies(5),
    bag { item "eggs"; item "shellfish"; end; },
    "list when: more than eggs but not peanuts",
);

is(
    list_allergies(248),
    bag {
        item "strawberries";
        item "tomatoes";
        item "chocolate";
        item "pollen";
        item "cats";
        end;
    },
    "list when: lots of stuff",
);

is(
    list_allergies(255),
    bag {
        item "eggs";
        item "peanuts";
        item "shellfish";
        item "strawberries";
        item "tomatoes";
        item "chocolate";
        item "pollen";
        item "cats";
        end;
    },
    "list when: everything",
);

is(
    list_allergies(509),
    bag {
        item "eggs";
        item "shellfish";
        item "strawberries";
        item "tomatoes";
        item "chocolate";
        item "pollen";
        item "cats";
        end;
    },
    "list when: no allergen score parts",
);

is(
    list_allergies(257),
    bag { item "eggs"; end; },
    "list when: no allergen score parts without highest valid score",
);

done_testing;
