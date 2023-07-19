#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PascalsTriangle qw<pascal_rows>;

is(
    pascal_rows(0),
    <<'TRIANGLE' =~ s/\n$//r,

TRIANGLE
    "zero rows",
);

is(
    pascal_rows(1),
    <<'TRIANGLE' =~ s/\n$//r,
1
TRIANGLE
    "single row",
);

is(
    pascal_rows(2),
    <<'TRIANGLE' =~ s/\n$//r,
1
1 1
TRIANGLE
    "two rows",
);

is(
    pascal_rows(3),
    <<'TRIANGLE' =~ s/\n$//r,
1
1 1
1 2 1
TRIANGLE
    "three rows",
);

is(
    pascal_rows(4),
    <<'TRIANGLE' =~ s/\n$//r,
1
1 1
1 2 1
1 3 3 1
TRIANGLE
    "four rows",
);

is(
    pascal_rows(5),
    <<'TRIANGLE' =~ s/\n$//r,
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
TRIANGLE
    "five rows",
);

is(
    pascal_rows(6),
    <<'TRIANGLE' =~ s/\n$//r,
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
1 5 10 10 5 1
TRIANGLE
    "six rows",
);

is(
    pascal_rows(10),
    <<'TRIANGLE' =~ s/\n$//r,
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
1 5 10 10 5 1
1 6 15 20 15 6 1
1 7 21 35 35 21 7 1
1 8 28 56 70 56 28 8 1
1 9 36 84 126 126 84 36 9 1
TRIANGLE
    "ten rows",
);

done_testing;
