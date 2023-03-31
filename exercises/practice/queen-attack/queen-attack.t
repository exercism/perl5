#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Queen ();

can_ok 'Queen', qw<row column can_attack> or bail_out;

my %queens;

is(
    lives { Queen->new( row => 2, column => 2 ) },
    T,
    "Test creation of Queens with valid and invalid positions: queen with a valid position",
);

like(
    dies { Queen->new( row => -2, column => 2 ) },
    qr/row not positive/,
    "Test creation of Queens with valid and invalid positions: queen must have positive row",
);

like(
    dies { Queen->new( row => 8, column => 4 ) },
    qr/row not on board/,
    "Test creation of Queens with valid and invalid positions: queen must have row on board",
);

like(
    dies { Queen->new( row => 2, column => -2 ) },
    qr/column not positive/,
    "Test creation of Queens with valid and invalid positions: queen must have positive column",
);

like(
    dies { Queen->new( row => 4, column => 8 ) },
    qr/column not on board/,
    "Test creation of Queens with valid and invalid positions: queen must have column on board",
);

$queens{white} = Queen->new( row => 2, column => 4 );
$queens{black} = Queen->new( row => 6, column => 6 );
is(
    $queens{white}->can_attack( $queens{black} ),
    DF,
    "Test the ability of one queen to attack another: cannot attack",
);

$queens{white} = Queen->new( row => 2, column => 4 );
$queens{black} = Queen->new( row => 2, column => 6 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on same row",
);

$queens{white} = Queen->new( row => 4, column => 5 );
$queens{black} = Queen->new( row => 2, column => 5 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on same column",
);

$queens{white} = Queen->new( row => 2, column => 2 );
$queens{black} = Queen->new( row => 0, column => 4 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on first diagonal",
);

$queens{white} = Queen->new( row => 2, column => 2 );
$queens{black} = Queen->new( row => 3, column => 1 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on second diagonal",
);

$queens{white} = Queen->new( row => 2, column => 2 );
$queens{black} = Queen->new( row => 1, column => 1 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on third diagonal",
);

$queens{white} = Queen->new( row => 1, column => 7 );
$queens{black} = Queen->new( row => 0, column => 6 );
is(
    $queens{white}->can_attack( $queens{black} ),
    T,
    "Test the ability of one queen to attack another: can attack on fourth diagonal",
);

$queens{white} = Queen->new( row => 4, column => 1 );
$queens{black} = Queen->new( row => 2, column => 5 );
is(
    $queens{white}->can_attack( $queens{black} ),
    DF,
    "Test the ability of one queen to attack another: cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal",
);

done_testing;
