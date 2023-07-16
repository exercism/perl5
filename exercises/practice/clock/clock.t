#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Clock ();

can_ok 'Clock', qw<new time add_minutes subtract_minutes> or bail_out;

my $todo;

is(    # begin: a577bacc-106b-496e-9792-b3083ea8705e
    Clock->new( hour => 8, minute => 0 )->time,
    "08:00",
    "Create a new clock with an initial time: on the hour",
);     # end: a577bacc-106b-496e-9792-b3083ea8705e

is(    # begin: b5d0c360-3b88-489b-8e84-68a1c7a4fa23
    Clock->new( hour => 11, minute => 9 )->time,
    "11:09",
    "Create a new clock with an initial time: past the hour",
);     # end: b5d0c360-3b88-489b-8e84-68a1c7a4fa23

is(    # begin: 473223f4-65f3-46ff-a9f7-7663c7e59440
    Clock->new( hour => 24, minute => 0 )->time,
    "00:00",
    "Create a new clock with an initial time: midnight is zero hours",
);     # end: 473223f4-65f3-46ff-a9f7-7663c7e59440

is(    # begin: ca95d24a-5924-447d-9a96-b91c8334725c
    Clock->new( hour => 25, minute => 0 )->time,
    "01:00",
    "Create a new clock with an initial time: hour rolls over",
);     # end: ca95d24a-5924-447d-9a96-b91c8334725c

is(    # begin: f3826de0-0925-4d69-8ac8-89aea7e52b78
    Clock->new( hour => 100, minute => 0 )->time,
    "04:00",
    "Create a new clock with an initial time: hour rolls over continuously",
);     # end: f3826de0-0925-4d69-8ac8-89aea7e52b78

is(    # begin: a02f7edf-dfd4-4b11-b21a-86de3cc6a95c
    Clock->new( hour => 1, minute => 60 )->time,
    "02:00",
    "Create a new clock with an initial time: sixty minutes is next hour",
);     # end: a02f7edf-dfd4-4b11-b21a-86de3cc6a95c

is(    # begin: 8f520df6-b816-444d-b90f-8a477789beb5
    Clock->new( hour => 0, minute => 160 )->time,
    "02:40",
    "Create a new clock with an initial time: minutes roll over",
);     # end: 8f520df6-b816-444d-b90f-8a477789beb5

is(    # begin: c75c091b-47ac-4655-8d40-643767fc4eed
    Clock->new( hour => 0, minute => 1723 )->time,
    "04:43",
    "Create a new clock with an initial time: minutes roll over continuously",
);     # end: c75c091b-47ac-4655-8d40-643767fc4eed

is(    # begin: 06343ecb-cf39-419d-a3f5-dcbae0cc4c57
    Clock->new( hour => 25, minute => 160 )->time,
    "03:40",
    "Create a new clock with an initial time: hour and minutes roll over",
);     # end: 06343ecb-cf39-419d-a3f5-dcbae0cc4c57

is(    # begin: be60810e-f5d9-4b58-9351-a9d1e90e660c
    Clock->new( hour => 201, minute => 3001 )->time,
    "11:01",
    "Create a new clock with an initial time: hour and minutes roll over continuously",
);     # end: be60810e-f5d9-4b58-9351-a9d1e90e660c

is(    # begin: 1689107b-0b5c-4bea-aad3-65ec9859368a
    Clock->new( hour => 72, minute => 8640 )->time,
    "00:00",
    "Create a new clock with an initial time: hour and minutes roll over to exactly midnight",
);     # end: 1689107b-0b5c-4bea-aad3-65ec9859368a

is(    # begin: d3088ee8-91b7-4446-9e9d-5e2ad6219d91
    Clock->new( hour => -1, minute => 15 )->time,
    "23:15",
    "Create a new clock with an initial time: negative hour",
);     # end: d3088ee8-91b7-4446-9e9d-5e2ad6219d91

is(    # begin: 77ef6921-f120-4d29-bade-80d54aa43b54
    Clock->new( hour => -25, minute => 0 )->time,
    "23:00",
    "Create a new clock with an initial time: negative hour rolls over",
);     # end: 77ef6921-f120-4d29-bade-80d54aa43b54

is(    # begin: 359294b5-972f-4546-bb9a-a85559065234
    Clock->new( hour => -91, minute => 0 )->time,
    "05:00",
    "Create a new clock with an initial time: negative hour rolls over continuously",
);     # end: 359294b5-972f-4546-bb9a-a85559065234

is(    # begin: 509db8b7-ac19-47cc-bd3a-a9d2f30b03c0
    Clock->new( hour => 1, minute => -40 )->time,
    "00:20",
    "Create a new clock with an initial time: negative minutes",
);     # end: 509db8b7-ac19-47cc-bd3a-a9d2f30b03c0

is(    # begin: 5d6bb225-130f-4084-84fd-9e0df8996f2a
    Clock->new( hour => 1, minute => -160 )->time,
    "22:20",
    "Create a new clock with an initial time: negative minutes roll over",
);     # end: 5d6bb225-130f-4084-84fd-9e0df8996f2a

is(    # begin: d483ceef-b520-4f0c-b94a-8d2d58cf0484
    Clock->new( hour => 1, minute => -4820 )->time,
    "16:40",
    "Create a new clock with an initial time: negative minutes roll over continuously",
);     # end: d483ceef-b520-4f0c-b94a-8d2d58cf0484

is(    # begin: 1cd19447-19c6-44bf-9d04-9f8305ccb9ea
    Clock->new( hour => 2, minute => -60 )->time,
    "01:00",
    "Create a new clock with an initial time: negative sixty minutes is previous hour",
);     # end: 1cd19447-19c6-44bf-9d04-9f8305ccb9ea

is(    # begin: 9d3053aa-4f47-4afc-bd45-d67a72cef4dc
    Clock->new( hour => -25, minute => -160 )->time,
    "20:20",
    "Create a new clock with an initial time: negative hour and minutes both roll over",
);     # end: 9d3053aa-4f47-4afc-bd45-d67a72cef4dc

is(    # begin: 51d41fcf-491e-4ca0-9cae-2aa4f0163ad4
    Clock->new( hour => -121, minute => -5810 )->time,
    "22:10",
    "Create a new clock with an initial time: negative hour and minutes both roll over continuously",
);     # end: 51d41fcf-491e-4ca0-9cae-2aa4f0163ad4

is(    # begin: d098e723-ad29-4ef9-997a-2693c4c9d89a
    Clock->new( hour => 10, minute => 0 )->add_minutes(3)->time,
    "10:03",
    "Add minutes: add minutes",
);     # end: d098e723-ad29-4ef9-997a-2693c4c9d89a

is(    # begin: b6ec8f38-e53e-4b22-92a7-60dab1f485f4
    Clock->new( hour => 6, minute => 41 )->add_minutes(0)->time,
    "06:41",
    "Add minutes: add no minutes",
);     # end: b6ec8f38-e53e-4b22-92a7-60dab1f485f4

is(    # begin: efd349dd-0785-453e-9ff8-d7452a8e7269
    Clock->new( hour => 0, minute => 45 )->add_minutes(40)->time,
    "01:25",
    "Add minutes: add to next hour",
);     # end: efd349dd-0785-453e-9ff8-d7452a8e7269

is(    # begin: 749890f7-aba9-4702-acce-87becf4ef9fe
    Clock->new( hour => 10, minute => 0 )->add_minutes(61)->time,
    "11:01",
    "Add minutes: add more than one hour",
);     # end: 749890f7-aba9-4702-acce-87becf4ef9fe

is(    # begin: da63e4c1-1584-46e3-8d18-c9dc802c1713
    Clock->new( hour => 0, minute => 45 )->add_minutes(160)->time,
    "03:25",
    "Add minutes: add more than two hours with carry",
);     # end: da63e4c1-1584-46e3-8d18-c9dc802c1713

is(    # begin: be167a32-3d33-4cec-a8bc-accd47ddbb71
    Clock->new( hour => 23, minute => 59 )->add_minutes(2)->time,
    "00:01",
    "Add minutes: add across midnight",
);     # end: be167a32-3d33-4cec-a8bc-accd47ddbb71

is(    # begin: 6672541e-cdae-46e4-8be7-a820cc3be2a8
    Clock->new( hour => 5, minute => 32 )->add_minutes(1500)->time,
    "06:32",
    "Add minutes: add more than one day (1500 min = 25 hrs)",
);     # end: 6672541e-cdae-46e4-8be7-a820cc3be2a8

is(    # begin: 1918050d-c79b-4cb7-b707-b607e2745c7e
    Clock->new( hour => 1, minute => 1 )->add_minutes(3500)->time,
    "11:21",
    "Add minutes: add more than two days",
);     # end: 1918050d-c79b-4cb7-b707-b607e2745c7e

is(    # begin: 37336cac-5ede-43a5-9026-d426cbe40354
    Clock->new( hour => 10, minute => 3 )->subtract_minutes(3)->time,
    "10:00",
    "Subtract minutes: subtract minutes",
);     # end: 37336cac-5ede-43a5-9026-d426cbe40354

is(    # begin: 0aafa4d0-3b5f-4b12-b3af-e3a9e09c047b
    Clock->new( hour => 10, minute => 3 )->subtract_minutes(30)->time,
    "09:33",
    "Subtract minutes: subtract to previous hour",
);     # end: 0aafa4d0-3b5f-4b12-b3af-e3a9e09c047b

is(    # begin: 9b4e809c-612f-4b15-aae0-1df0acb801b9
    Clock->new( hour => 10, minute => 3 )->subtract_minutes(70)->time,
    "08:53",
    "Subtract minutes: subtract more than an hour",
);     # end: 9b4e809c-612f-4b15-aae0-1df0acb801b9

is(    # begin: 8b04bb6a-3d33-4e6c-8de9-f5de6d2c70d6
    Clock->new( hour => 0, minute => 3 )->subtract_minutes(4)->time,
    "23:59",
    "Subtract minutes: subtract across midnight",
);     # end: 8b04bb6a-3d33-4e6c-8de9-f5de6d2c70d6

is(    # begin: 07c3bbf7-ce4d-4658-86e8-4a77b7a5ccd9
    Clock->new( hour => 0, minute => 0 )->subtract_minutes(160)->time,
    "21:20",
    "Subtract minutes: subtract more than two hours",
);     # end: 07c3bbf7-ce4d-4658-86e8-4a77b7a5ccd9

is(    # begin: 90ac8a1b-761c-4342-9c9c-cdc3ed5db097
    Clock->new( hour => 6, minute => 15 )->subtract_minutes(160)->time,
    "03:35",
    "Subtract minutes: subtract more than two hours with borrow",
);     # end: 90ac8a1b-761c-4342-9c9c-cdc3ed5db097

is(    # begin: 2149f985-7136-44ad-9b29-ec023a97a2b7
    Clock->new( hour => 5, minute => 32 )->subtract_minutes(1500)->time,
    "04:32",
    "Subtract minutes: subtract more than one day (1500 min = 25 hrs)",
);     # end: 2149f985-7136-44ad-9b29-ec023a97a2b7

is(    # begin: ba11dbf0-ac27-4acb-ada9-3b853ec08c97
    Clock->new( hour => 2, minute => 20 )->subtract_minutes(3000)->time,
    "00:20",
    "Subtract minutes: subtract more than two days",
);     # end: ba11dbf0-ac27-4acb-ada9-3b853ec08c97

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: f2fdad51-499f-4c9b-a791-b28c9282e311
is(
    Clock->new( hour => 15, minute => 37 ),
    Clock->new( hour => 15, minute => 37 ),
    "Compare two clocks for equality: clocks with same time",
);
$todo = undef;                                              # end: f2fdad51-499f-4c9b-a791-b28c9282e311

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: 5d409d4b-f862-4960-901e-ec430160b768
isnt(
    Clock->new( hour => 15, minute => 36 ),
    Clock->new( hour => 15, minute => 37 ),
    "Compare two clocks for equality: clocks a minute apart",
);
$todo = undef;                                              # end: 5d409d4b-f862-4960-901e-ec430160b768

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: a6045fcf-2b52-4a47-8bb2-ef10a064cba5
isnt(
    Clock->new( hour => 14, minute => 37 ),
    Clock->new( hour => 15, minute => 37 ),
    "Compare two clocks for equality: clocks an hour apart",
);
$todo = undef;                                              # end: a6045fcf-2b52-4a47-8bb2-ef10a064cba5

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: 66b12758-0be5-448b-a13c-6a44bce83527
is(
    Clock->new( hour => 10, minute => 37 ),
    Clock->new( hour => 34, minute => 37 ),
    "Compare two clocks for equality: clocks with hour overflow",
);
$todo = undef;                                              # end: 66b12758-0be5-448b-a13c-6a44bce83527

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: 2b19960c-212e-4a71-9aac-c581592f8111
is(
    Clock->new( hour => 3,  minute => 11 ),
    Clock->new( hour => 99, minute => 11 ),
    "Compare two clocks for equality: clocks with hour overflow by several days",
);
$todo = undef;                                              # end: 2b19960c-212e-4a71-9aac-c581592f8111

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: 6f8c6541-afac-4a92-b0c2-b10d4e50269f
is(
    Clock->new( hour => 22, minute => 40 ),
    Clock->new( hour => -2, minute => 40 ),
    "Compare two clocks for equality: clocks with negative hour",
);
$todo = undef;                                              # end: 6f8c6541-afac-4a92-b0c2-b10d4e50269f

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: bb9d5a68-e324-4bf5-a75e-0e9b1f97a90d
is(
    Clock->new( hour => 17,  minute => 3 ),
    Clock->new( hour => -31, minute => 3 ),
    "Compare two clocks for equality: clocks with negative hour that wraps",
);
$todo = undef;                                              # end: bb9d5a68-e324-4bf5-a75e-0e9b1f97a90d

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: 56c0326d-565b-4d19-a26f-63b3205778b7
is(
    Clock->new( hour => 13,  minute => 49 ),
    Clock->new( hour => -83, minute => 49 ),
    "Compare two clocks for equality: clocks with negative hour that wraps multiple times",
);
$todo = undef;                                              # end: 56c0326d-565b-4d19-a26f-63b3205778b7

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: c90b9de8-ddff-4ffe-9858-da44a40fdbc2
is(
    Clock->new( hour => 0, minute => 1 ),
    Clock->new( hour => 0, minute => 1441 ),
    "Compare two clocks for equality: clocks with minute overflow",
);
$todo = undef;                                              # end: c90b9de8-ddff-4ffe-9858-da44a40fdbc2

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: 533a3dc5-59a7-491b-b728-a7a34fe325de
is(
    Clock->new( hour => 2, minute => 2 ),
    Clock->new( hour => 2, minute => 4322 ),
    "Compare two clocks for equality: clocks with minute overflow by several days",
);
$todo = undef;                                              # end: 533a3dc5-59a7-491b-b728-a7a34fe325de

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: fff49e15-f7b7-4692-a204-0f6052d62636
is(
    Clock->new( hour => 2, minute => 40 ),
    Clock->new( hour => 3, minute => -20 ),
    "Compare two clocks for equality: clocks with negative minute",
);
$todo = undef;                                              # end: fff49e15-f7b7-4692-a204-0f6052d62636

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: 605c65bb-21bd-43eb-8f04-878edf508366
is(
    Clock->new( hour => 4, minute => 10 ),
    Clock->new( hour => 5, minute => -1490 ),
    "Compare two clocks for equality: clocks with negative minute that wraps",
);
$todo = undef;                                              # end: 605c65bb-21bd-43eb-8f04-878edf508366

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: b87e64ed-212a-4335-91fd-56da8421d077
is(
    Clock->new( hour => 6, minute => 15 ),
    Clock->new( hour => 6, minute => -4305 ),
    "Compare two clocks for equality: clocks with negative minute that wraps multiple times",
);
$todo = undef;                                              # end: b87e64ed-212a-4335-91fd-56da8421d077

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: 822fbf26-1f3b-4b13-b9bf-c914816b53dd
is(
    Clock->new( hour => 7,   minute => 32 ),
    Clock->new( hour => -12, minute => -268 ),
    "Compare two clocks for equality: clocks with negative hours and minutes",
);
$todo = undef;                                              # end: 822fbf26-1f3b-4b13-b9bf-c914816b53dd

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: e787bccd-cf58-4a1d-841c-ff80eaaccfaa
is(
    Clock->new( hour => 18,  minute => 7 ),
    Clock->new( hour => -54, minute => -11513 ),
    "Compare two clocks for equality: clocks with negative hours and minutes that wrap",
);
$todo = undef;                                              # end: e787bccd-cf58-4a1d-841c-ff80eaaccfaa

$todo = todo 'experimental feature'
    if Clock->new( hour => 0, minute => 0 ) =~ /OBJECT/;    # begin: 96969ca8-875a-48a1-86ae-257a528c44f5
is(
    Clock->new( hour => 24, minute => 0 ),
    Clock->new( hour => 0,  minute => 0 ),
    "Compare two clocks for equality: full clock and zeroed clock",
);
$todo = undef;                                              # end: 96969ca8-875a-48a1-86ae-257a528c44f5

done_testing;
