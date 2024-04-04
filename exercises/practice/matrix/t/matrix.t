#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Matrix qw<extract_row extract_column>;

is( # begin: ca733dab-9d85-4065-9ef6-a880a951dafd
    extract_row( "1", 1 ),
    ["1"],
    "extract row from one number matrix",
); # end: ca733dab-9d85-4065-9ef6-a880a951dafd

is( # begin: 5c93ec93-80e1-4268-9fc2-63bc7d23385c
    extract_row( "1 2\n3 4", 2 ),
    [ "3", "4" ],
    "can extract row",
); # end: 5c93ec93-80e1-4268-9fc2-63bc7d23385c

is( # begin: 2f1aad89-ad0f-4bd2-9919-99a8bff0305a
    extract_row( "1 2\n10 20", 2 ),
    [ "10", "20" ],
    "extract row where numbers have different widths",
); # end: 2f1aad89-ad0f-4bd2-9919-99a8bff0305a

is( # begin: 68f7f6ba-57e2-4e87-82d0-ad09889b5204
    extract_row( "1 2 3\n4 5 6\n7 8 9\n8 7 6", 4 ),
    [ "8", "7", "6" ],
    "can extract row from non-square matrix with no corresponding column",
); # end: 68f7f6ba-57e2-4e87-82d0-ad09889b5204

is( # begin: e8c74391-c93b-4aed-8bfe-f3c9beb89ebb
    extract_column( "1", 1 ),
    ["1"],
    "extract column from one number matrix",
); # end: e8c74391-c93b-4aed-8bfe-f3c9beb89ebb

is( # begin: 7136bdbd-b3dc-48c4-a10c-8230976d3727
    extract_column( "1 2 3\n4 5 6\n7 8 9", 3 ),
    [ "3", "6", "9" ],
    "can extract column",
); # end: 7136bdbd-b3dc-48c4-a10c-8230976d3727

is( # begin: ad64f8d7-bba6-4182-8adf-0c14de3d0eca
    extract_column( "1 2 3 4\n5 6 7 8\n9 8 7 6", 4 ),
    [ "4", "8", "6" ],
    "can extract column from non-square matrix with no corresponding row",
); # end: ad64f8d7-bba6-4182-8adf-0c14de3d0eca

is( # begin: 9eddfa5c-8474-440e-ae0a-f018c2a0dd89
    extract_column( "89 1903 3\n18 3 1\n9 4 800", 2 ),
    [ "1903", "3", "4" ],
    "extract column where numbers have different widths",
); # end: 9eddfa5c-8474-440e-ae0a-f018c2a0dd89

done_testing;
