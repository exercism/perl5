#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PascalsTriangle qw<pascal_rows>;

imported_ok qw<pascal_rows> or bail_out;

is( # begin: 9920ce55-9629-46d5-85d6-4201f4a4234d
    pascal_rows(0),
    <<'TRIANGLE' =~ s/\n$//r,

TRIANGLE
    "zero rows",
); # end: 9920ce55-9629-46d5-85d6-4201f4a4234d

is( # begin: 70d643ce-a46d-4e93-af58-12d88dd01f21
    pascal_rows(1),
    <<'TRIANGLE' =~ s/\n$//r,
1
TRIANGLE
    "single row",
); # end: 70d643ce-a46d-4e93-af58-12d88dd01f21

is( # begin: a6e5a2a2-fc9a-4b47-9f4f-ed9ad9fbe4bd
    pascal_rows(2),
    <<'TRIANGLE' =~ s/\n$//r,
1
1 1
TRIANGLE
    "two rows",
); # end: a6e5a2a2-fc9a-4b47-9f4f-ed9ad9fbe4bd

is( # begin: 97206a99-79ba-4b04-b1c5-3c0fa1e16925
    pascal_rows(3),
    <<'TRIANGLE' =~ s/\n$//r,
1
1 1
1 2 1
TRIANGLE
    "three rows",
); # end: 97206a99-79ba-4b04-b1c5-3c0fa1e16925

is( # begin: 565a0431-c797-417c-a2c8-2935e01ce306
    pascal_rows(4),
    <<'TRIANGLE' =~ s/\n$//r,
1
1 1
1 2 1
1 3 3 1
TRIANGLE
    "four rows",
); # end: 565a0431-c797-417c-a2c8-2935e01ce306

is( # begin: 06f9ea50-9f51-4eb2-b9a9-c00975686c27
    pascal_rows(5),
    <<'TRIANGLE' =~ s/\n$//r,
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
TRIANGLE
    "five rows",
); # end: 06f9ea50-9f51-4eb2-b9a9-c00975686c27

is( # begin: c3912965-ddb4-46a9-848e-3363e6b00b13
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
); # end: c3912965-ddb4-46a9-848e-3363e6b00b13

is( # begin: 6cb26c66-7b57-4161-962c-81ec8c99f16b
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
); # end: 6cb26c66-7b57-4161-962c-81ec8c99f16b

done_testing;
