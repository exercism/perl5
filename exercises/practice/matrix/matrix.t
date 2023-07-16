#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Matrix ();

can_ok 'Matrix', qw<row column> or bail_out;

is(    # begin: ca733dab-9d85-4065-9ef6-a880a951dafd
    Matrix->new( string => "1" )->row(1),
    ["1"],
    "extract row from one number matrix",
);     # end: ca733dab-9d85-4065-9ef6-a880a951dafd

is(    # begin: 5c93ec93-80e1-4268-9fc2-63bc7d23385c
    Matrix->new( string => "1 2\n3 4" )->row(2),
    [ "3", "4" ],
    "can extract row",
);     # end: 5c93ec93-80e1-4268-9fc2-63bc7d23385c

is(    # begin: 2f1aad89-ad0f-4bd2-9919-99a8bff0305a
    Matrix->new( string => "1 2\n10 20" )->row(2),
    [ "10", "20" ],
    "extract row where numbers have different widths",
);     # end: 2f1aad89-ad0f-4bd2-9919-99a8bff0305a

is(    # begin: 68f7f6ba-57e2-4e87-82d0-ad09889b5204
    Matrix->new( string => "1 2 3\n4 5 6\n7 8 9\n8 7 6" )->row(4),
    [ "8", "7", "6" ],
    "can extract row from non-square matrix with no corresponding column",
);     # end: 68f7f6ba-57e2-4e87-82d0-ad09889b5204

is(    # begin: e8c74391-c93b-4aed-8bfe-f3c9beb89ebb
    Matrix->new( string => "1" )->column(1),
    ["1"],
    "extract column from one number matrix",
);     # end: e8c74391-c93b-4aed-8bfe-f3c9beb89ebb

is(    # begin: 7136bdbd-b3dc-48c4-a10c-8230976d3727
    Matrix->new( string => "1 2 3\n4 5 6\n7 8 9" )->column(3),
    [ "3", "6", "9" ],
    "can extract column",
);     # end: 7136bdbd-b3dc-48c4-a10c-8230976d3727

is(    # begin: ad64f8d7-bba6-4182-8adf-0c14de3d0eca
    Matrix->new( string => "1 2 3 4\n5 6 7 8\n9 8 7 6" )->column(4),
    [ "4", "8", "6" ],
    "can extract column from non-square matrix with no corresponding row",
);     # end: ad64f8d7-bba6-4182-8adf-0c14de3d0eca

is(    # begin: 9eddfa5c-8474-440e-ae0a-f018c2a0dd89
    Matrix->new( string => "89 1903 3\n18 3 1\n9 4 800" )->column(2),
    [ "1903", "3", "4" ],
    "extract column where numbers have different widths",
);     # end: 9eddfa5c-8474-440e-ae0a-f018c2a0dd89

done_testing;
