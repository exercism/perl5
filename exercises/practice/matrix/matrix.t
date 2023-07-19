#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Matrix ();

is(
    Matrix->new( string => "1" )->row(1),
    ["1"],
    "extract row from one number matrix",
);

is(
    Matrix->new( string => "1 2\n3 4" )->row(2),
    [ "3", "4" ],
    "can extract row",
);

is(
    Matrix->new( string => "1 2\n10 20" )->row(2),
    [ "10", "20" ],
    "extract row where numbers have different widths",
);

is(
    Matrix->new( string => "1 2 3\n4 5 6\n7 8 9\n8 7 6" )->row(4),
    [ "8", "7", "6" ],
    "can extract row from non-square matrix with no corresponding column",
);

is(
    Matrix->new( string => "1" )->column(1),
    ["1"],
    "extract column from one number matrix",
);

is(
    Matrix->new( string => "1 2 3\n4 5 6\n7 8 9" )->column(3),
    [ "3", "6", "9" ],
    "can extract column",
);

is(
    Matrix->new( string => "1 2 3 4\n5 6 7 8\n9 8 7 6" )->column(4),
    [ "4", "8", "6" ],
    "can extract column from non-square matrix with no corresponding row",
);

is(
    Matrix->new( string => "89 1903 3\n18 3 1\n9 4 800" )->column(2),
    [ "1903", "3", "4" ],
    "extract column where numbers have different widths",
);

done_testing;
