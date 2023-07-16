#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Queen ();

can_ok 'Queen', qw<row column can_attack> or bail_out;

my %queens;

is(    # begin: 3ac4f735-d36c-44c4-a3e2-316f79704203
    lives { Queen->new( row => 2, column => 2 ) },
    T,
    "Test creation of Queens with valid and invalid positions: queen with a valid position",
);     # end: 3ac4f735-d36c-44c4-a3e2-316f79704203

like(  # begin: 4e812d5d-b974-4e38-9a6b-8e0492bfa7be
    dies { Queen->new( row => -2, column => 2 ) },
    qr/row not on board/,
    "Test creation of Queens with valid and invalid positions: queen must have on board row",
);     # end: 4e812d5d-b974-4e38-9a6b-8e0492bfa7be

like(  # begin: f07b7536-b66b-4f08-beb9-4d70d891d5c8
    dies { Queen->new( row => 8, column => 4 ) },
    qr/row not on board/,
    "Test creation of Queens with valid and invalid positions: queen must have row on board",
);     # end: f07b7536-b66b-4f08-beb9-4d70d891d5c8

like(  # begin: 15a10794-36d9-4907-ae6b-e5a0d4c54ebe
    dies { Queen->new( row => 2, column => -2 ) },
    qr/column not on board/,
    "Test creation of Queens with valid and invalid positions: queen must have on board column",
);     # end: 15a10794-36d9-4907-ae6b-e5a0d4c54ebe

like(  # begin: 6907762d-0e8a-4c38-87fb-12f2f65f0ce4
    dies { Queen->new( row => 4, column => 8 ) },
    qr/column not on board/,
    "Test creation of Queens with valid and invalid positions: queen must have column on board",
);     # end: 6907762d-0e8a-4c38-87fb-12f2f65f0ce4

$queens{white} = Queen->new( row => 2, column => 4 );    # begin: 33ae4113-d237-42ee-bac1-e1e699c0c007
$queens{black} = Queen->new( row => 6, column => 6 );
is(
    $queens{white}->can_attack( $queens{black} ),
    DF,
    "Test the ability of one queen to attack another: cannot attack",
);                                                       # end: 33ae4113-d237-42ee-bac1-e1e699c0c007

$queens{white} = Queen->new( row => 2, column => 4 );    # begin: eaa65540-ea7c-4152-8c21-003c7a68c914
$queens{black} = Queen->new( row => 2, column => 6 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on same row",
);                                                       # end: eaa65540-ea7c-4152-8c21-003c7a68c914

$queens{white} = Queen->new( row => 4, column => 5 );    # begin: bae6f609-2c0e-4154-af71-af82b7c31cea
$queens{black} = Queen->new( row => 2, column => 5 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on same column",
);                                                       # end: bae6f609-2c0e-4154-af71-af82b7c31cea

$queens{white} = Queen->new( row => 2, column => 2 );    # begin: 0e1b4139-b90d-4562-bd58-dfa04f1746c7
$queens{black} = Queen->new( row => 0, column => 4 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on first diagonal",
);                                                       # end: 0e1b4139-b90d-4562-bd58-dfa04f1746c7

$queens{white} = Queen->new( row => 2, column => 2 );    # begin: ff9b7ed4-e4b6-401b-8d16-bc894d6d3dcd
$queens{black} = Queen->new( row => 3, column => 1 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on second diagonal",
);                                                       # end: ff9b7ed4-e4b6-401b-8d16-bc894d6d3dcd

$queens{white} = Queen->new( row => 2, column => 2 );    # begin: 0a71e605-6e28-4cc2-aa47-d20a2e71037a
$queens{black} = Queen->new( row => 1, column => 1 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on third diagonal",
);                                                       # end: 0a71e605-6e28-4cc2-aa47-d20a2e71037a

$queens{white} = Queen->new( row => 1, column => 7 );    # begin: 0790b588-ae73-4f1f-a968-dd0b34f45f86
$queens{black} = Queen->new( row => 0, column => 6 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on fourth diagonal",
);                                                       # end: 0790b588-ae73-4f1f-a968-dd0b34f45f86

$queens{white} = Queen->new( row => 4, column => 1 );    # begin: 543f8fd4-2597-4aad-8d77-cbdab63619f8
$queens{black} = Queen->new( row => 2, column => 5 );
is(
    $queens{white}->can_attack( $queens{black} ),
    DF,
    "Test the ability of one queen to attack another: cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal",
);                                                       # end: 543f8fd4-2597-4aad-8d77-cbdab63619f8

done_testing;
