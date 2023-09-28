#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Allergies qw<allergic_to list_allergies>;

is( # begin: 17fc7296-2440-4ac4-ad7b-d07c321bc5a0
    allergic_to( "eggs", 0 ),
    DF, # Defined but False
    "testing for eggs allergy: not allergic to anything",
); # end: 17fc7296-2440-4ac4-ad7b-d07c321bc5a0

is( # begin: 07ced27b-1da5-4c2e-8ae2-cb2791437546
    allergic_to( "eggs", 1 ),
    T, # True
    "testing for eggs allergy: allergic only to eggs",
); # end: 07ced27b-1da5-4c2e-8ae2-cb2791437546

is( # begin: 5035b954-b6fa-4b9b-a487-dae69d8c5f96
    allergic_to( "eggs", 3 ),
    T, # True
    "testing for eggs allergy: allergic to eggs and something else",
); # end: 5035b954-b6fa-4b9b-a487-dae69d8c5f96

is( # begin: 64a6a83a-5723-4b5b-a896-663307403310
    allergic_to( "eggs", 2 ),
    DF, # Defined but False
    "testing for eggs allergy: allergic to something, but not eggs",
); # end: 64a6a83a-5723-4b5b-a896-663307403310

is( # begin: 90c8f484-456b-41c4-82ba-2d08d93231c6
    allergic_to( "eggs", 255 ),
    T, # True
    "testing for eggs allergy: allergic to everything",
); # end: 90c8f484-456b-41c4-82ba-2d08d93231c6

is( # begin: d266a59a-fccc-413b-ac53-d57cb1f0db9d
    allergic_to( "peanuts", 0 ),
    DF, # Defined but False
    "testing for peanuts allergy: not allergic to anything",
); # end: d266a59a-fccc-413b-ac53-d57cb1f0db9d

is( # begin: ea210a98-860d-46b2-a5bf-50d8995b3f2a
    allergic_to( "peanuts", 2 ),
    T, # True
    "testing for peanuts allergy: allergic only to peanuts",
); # end: ea210a98-860d-46b2-a5bf-50d8995b3f2a

is( # begin: eac69ae9-8d14-4291-ac4b-7fd2c73d3a5b
    allergic_to( "peanuts", 7 ),
    T, # True
    "testing for peanuts allergy: allergic to peanuts and something else",
); # end: eac69ae9-8d14-4291-ac4b-7fd2c73d3a5b

is( # begin: 9152058c-ce39-4b16-9b1d-283ec6d25085
    allergic_to( "peanuts", 5 ),
    DF, # Defined but False
    "testing for peanuts allergy: allergic to something, but not peanuts",
); # end: 9152058c-ce39-4b16-9b1d-283ec6d25085

is( # begin: d2d71fd8-63d5-40f9-a627-fbdaf88caeab
    allergic_to( "peanuts", 255 ),
    T, # True
    "testing for peanuts allergy: allergic to everything",
); # end: d2d71fd8-63d5-40f9-a627-fbdaf88caeab

is( # begin: b948b0a1-cbf7-4b28-a244-73ff56687c80
    allergic_to( "shellfish", 0 ),
    DF, # Defined but False
    "testing for shellfish allergy: not allergic to anything",
); # end: b948b0a1-cbf7-4b28-a244-73ff56687c80

is( # begin: 9ce9a6f3-53e9-4923-85e0-73019047c567
    allergic_to( "shellfish", 4 ),
    T, # True
    "testing for shellfish allergy: allergic only to shellfish",
); # end: 9ce9a6f3-53e9-4923-85e0-73019047c567

is( # begin: b272fca5-57ba-4b00-bd0c-43a737ab2131
    allergic_to( "shellfish", 14 ),
    T, # True
    "testing for shellfish allergy: allergic to shellfish and something else",
); # end: b272fca5-57ba-4b00-bd0c-43a737ab2131

is( # begin: 21ef8e17-c227-494e-8e78-470a1c59c3d8
    allergic_to( "shellfish", 10 ),
    DF, # Defined but False
    "testing for shellfish allergy: allergic to something, but not shellfish",
); # end: 21ef8e17-c227-494e-8e78-470a1c59c3d8

is( # begin: cc789c19-2b5e-4c67-b146-625dc8cfa34e
    allergic_to( "shellfish", 255 ),
    T, # True
    "testing for shellfish allergy: allergic to everything",
); # end: cc789c19-2b5e-4c67-b146-625dc8cfa34e

is( # begin: 651bde0a-2a74-46c4-ab55-02a0906ca2f5
    allergic_to( "strawberries", 0 ),
    DF, # Defined but False
    "testing for strawberries allergy: not allergic to anything",
); # end: 651bde0a-2a74-46c4-ab55-02a0906ca2f5

is( # begin: b649a750-9703-4f5f-b7f7-91da2c160ece
    allergic_to( "strawberries", 8 ),
    T, # True
    "testing for strawberries allergy: allergic only to strawberries",
); # end: b649a750-9703-4f5f-b7f7-91da2c160ece

is( # begin: 50f5f8f3-3bac-47e6-8dba-2d94470a4bc6
    allergic_to( "strawberries", 28 ),
    T, # True
    "testing for strawberries allergy: allergic to strawberries and something else",
); # end: 50f5f8f3-3bac-47e6-8dba-2d94470a4bc6

is( # begin: 23dd6952-88c9-48d7-a7d5-5d0343deb18d
    allergic_to( "strawberries", 20 ),
    DF, # Defined but False
    "testing for strawberries allergy: allergic to something, but not strawberries",
); # end: 23dd6952-88c9-48d7-a7d5-5d0343deb18d

is( # begin: 74afaae2-13b6-43a2-837a-286cd42e7d7e
    allergic_to( "strawberries", 255 ),
    T, # True
    "testing for strawberries allergy: allergic to everything",
); # end: 74afaae2-13b6-43a2-837a-286cd42e7d7e

is( # begin: c49a91ef-6252-415e-907e-a9d26ef61723
    allergic_to( "tomatoes", 0 ),
    DF, # Defined but False
    "testing for tomatoes allergy: not allergic to anything",
); # end: c49a91ef-6252-415e-907e-a9d26ef61723

is( # begin: b69c5131-b7d0-41ad-a32c-e1b2cc632df8
    allergic_to( "tomatoes", 16 ),
    T, # True
    "testing for tomatoes allergy: allergic only to tomatoes",
); # end: b69c5131-b7d0-41ad-a32c-e1b2cc632df8

is( # begin: 1ca50eb1-f042-4ccf-9050-341521b929ec
    allergic_to( "tomatoes", 56 ),
    T, # True
    "testing for tomatoes allergy: allergic to tomatoes and something else",
); # end: 1ca50eb1-f042-4ccf-9050-341521b929ec

is( # begin: e9846baa-456b-4eff-8025-034b9f77bd8e
    allergic_to( "tomatoes", 40 ),
    DF, # Defined but False
    "testing for tomatoes allergy: allergic to something, but not tomatoes",
); # end: e9846baa-456b-4eff-8025-034b9f77bd8e

is( # begin: b2414f01-f3ad-4965-8391-e65f54dad35f
    allergic_to( "tomatoes", 255 ),
    T, # True
    "testing for tomatoes allergy: allergic to everything",
); # end: b2414f01-f3ad-4965-8391-e65f54dad35f

is( # begin: 978467ab-bda4-49f7-b004-1d011ead947c
    allergic_to( "chocolate", 0 ),
    DF, # Defined but False
    "testing for chocolate allergy: not allergic to anything",
); # end: 978467ab-bda4-49f7-b004-1d011ead947c

is( # begin: 59cf4e49-06ea-4139-a2c1-d7aad28f8cbc
    allergic_to( "chocolate", 32 ),
    T, # True
    "testing for chocolate allergy: allergic only to chocolate",
); # end: 59cf4e49-06ea-4139-a2c1-d7aad28f8cbc

is( # begin: b0a7c07b-2db7-4f73-a180-565e07040ef1
    allergic_to( "chocolate", 112 ),
    T, # True
    "testing for chocolate allergy: allergic to chocolate and something else",
); # end: b0a7c07b-2db7-4f73-a180-565e07040ef1

is( # begin: f5506893-f1ae-482a-b516-7532ba5ca9d2
    allergic_to( "chocolate", 80 ),
    DF, # Defined but False
    "testing for chocolate allergy: allergic to something, but not chocolate",
); # end: f5506893-f1ae-482a-b516-7532ba5ca9d2

is( # begin: 02debb3d-d7e2-4376-a26b-3c974b6595c6
    allergic_to( "chocolate", 255 ),
    T, # True
    "testing for chocolate allergy: allergic to everything",
); # end: 02debb3d-d7e2-4376-a26b-3c974b6595c6

is( # begin: 17f4a42b-c91e-41b8-8a76-4797886c2d96
    allergic_to( "pollen", 0 ),
    DF, # Defined but False
    "testing for pollen allergy: not allergic to anything",
); # end: 17f4a42b-c91e-41b8-8a76-4797886c2d96

is( # begin: 7696eba7-1837-4488-882a-14b7b4e3e399
    allergic_to( "pollen", 64 ),
    T, # True
    "testing for pollen allergy: allergic only to pollen",
); # end: 7696eba7-1837-4488-882a-14b7b4e3e399

is( # begin: 9a49aec5-fa1f-405d-889e-4dfc420db2b6
    allergic_to( "pollen", 224 ),
    T, # True
    "testing for pollen allergy: allergic to pollen and something else",
); # end: 9a49aec5-fa1f-405d-889e-4dfc420db2b6

is( # begin: 3cb8e79f-d108-4712-b620-aa146b1954a9
    allergic_to( "pollen", 160 ),
    DF, # Defined but False
    "testing for pollen allergy: allergic to something, but not pollen",
); # end: 3cb8e79f-d108-4712-b620-aa146b1954a9

is( # begin: 1dc3fe57-7c68-4043-9d51-5457128744b2
    allergic_to( "pollen", 255 ),
    T, # True
    "testing for pollen allergy: allergic to everything",
); # end: 1dc3fe57-7c68-4043-9d51-5457128744b2

is( # begin: d3f523d6-3d50-419b-a222-d4dfd62ce314
    allergic_to( "cats", 0 ),
    DF, # Defined but False
    "testing for cats allergy: not allergic to anything",
); # end: d3f523d6-3d50-419b-a222-d4dfd62ce314

is( # begin: eba541c3-c886-42d3-baef-c048cb7fcd8f
    allergic_to( "cats", 128 ),
    T, # True
    "testing for cats allergy: allergic only to cats",
); # end: eba541c3-c886-42d3-baef-c048cb7fcd8f

is( # begin: ba718376-26e0-40b7-bbbe-060287637ea5
    allergic_to( "cats", 192 ),
    T, # True
    "testing for cats allergy: allergic to cats and something else",
); # end: ba718376-26e0-40b7-bbbe-060287637ea5

is( # begin: 3c6dbf4a-5277-436f-8b88-15a206f2d6c4
    allergic_to( "cats", 64 ),
    DF, # Defined but False
    "testing for cats allergy: allergic to something, but not cats",
); # end: 3c6dbf4a-5277-436f-8b88-15a206f2d6c4

is( # begin: 1faabb05-2b98-4995-9046-d83e4a48a7c1
    allergic_to( "cats", 255 ),
    T, # True
    "testing for cats allergy: allergic to everything",
); # end: 1faabb05-2b98-4995-9046-d83e4a48a7c1

is( # begin: f9c1b8e7-7dc5-4887-aa93-cebdcc29dd8f
    list_allergies(0),
    bag {
        end;
    },
    "list when: no allergies",
); # end: f9c1b8e7-7dc5-4887-aa93-cebdcc29dd8f

is( # begin: 9e1a4364-09a6-4d94-990f-541a94a4c1e8
    list_allergies(1),
    bag {
        item "eggs";
        end;
    },
    "list when: just eggs",
); # end: 9e1a4364-09a6-4d94-990f-541a94a4c1e8

is( # begin: 8851c973-805e-4283-9e01-d0c0da0e4695
    list_allergies(2),
    bag {
        item "peanuts";
        end;
    },
    "list when: just peanuts",
); # end: 8851c973-805e-4283-9e01-d0c0da0e4695

is( # begin: 2c8943cb-005e-435f-ae11-3e8fb558ea98
    list_allergies(8),
    bag {
        item "strawberries";
        end;
    },
    "list when: just strawberries",
); # end: 2c8943cb-005e-435f-ae11-3e8fb558ea98

is( # begin: 6fa95d26-044c-48a9-8a7b-9ee46ec32c5c
    list_allergies(3),
    bag {
        item "eggs";
        item "peanuts";
        end;
    },
    "list when: eggs and peanuts",
); # end: 6fa95d26-044c-48a9-8a7b-9ee46ec32c5c

is( # begin: 19890e22-f63f-4c5c-a9fb-fb6eacddfe8e
    list_allergies(5),
    bag {
        item "eggs";
        item "shellfish";
        end;
    },
    "list when: more than eggs but not peanuts",
); # end: 19890e22-f63f-4c5c-a9fb-fb6eacddfe8e

is( # begin: 4b68f470-067c-44e4-889f-c9fe28917d2f
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
); # end: 4b68f470-067c-44e4-889f-c9fe28917d2f

is( # begin: 0881b7c5-9efa-4530-91bd-68370d054bc7
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
); # end: 0881b7c5-9efa-4530-91bd-68370d054bc7

is( # begin: 12ce86de-b347-42a0-ab7c-2e0570f0c65b
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
); # end: 12ce86de-b347-42a0-ab7c-2e0570f0c65b

is( # begin: 93c2df3e-4f55-4fed-8116-7513092819cd
    list_allergies(257),
    bag {
        item "eggs";
        end;
    },
    "list when: no allergen score parts without highest valid score",
); # end: 93c2df3e-4f55-4fed-8116-7513092819cd

done_testing;
