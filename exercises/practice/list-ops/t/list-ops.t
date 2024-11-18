#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use ListOps      ();
use experimental qw<signatures>;

{ # begin: 485b9452-bf94-40f7-a3db-c3cf4850066a
    my $appended = ListOps::append [], [];
    is(
        $appended,
        [],
        "append entries to a list and return the new list: empty lists",
    );
} # end: 485b9452-bf94-40f7-a3db-c3cf4850066a

{ # begin: 2c894696-b609-4569-b149-8672134d340a
    my $appended = ListOps::append [], [ 1, 2, 3, 4 ];
    is(
        $appended,
        [ 1, 2, 3, 4 ],
        "append entries to a list and return the new list: list to empty list",
    );
} # end: 2c894696-b609-4569-b149-8672134d340a

{ # begin: e842efed-3bf6-4295-b371-4d67a4fdf19c
    my $appended = ListOps::append [ 1, 2, 3, 4 ], [];
    is(
        $appended,
        [ 1, 2, 3, 4 ],
        "append entries to a list and return the new list: empty list to list",
    );
} # end: e842efed-3bf6-4295-b371-4d67a4fdf19c

{ # begin: 71dcf5eb-73ae-4a0e-b744-a52ee387922f
    my $appended = ListOps::append [ 1, 2 ], [ 2, 3, 4, 5 ];
    is(
        $appended,
        [ 1, 2, 2, 3, 4, 5 ],
        "append entries to a list and return the new list: non-empty lists",
    );
} # end: 71dcf5eb-73ae-4a0e-b744-a52ee387922f

{ # begin: 28444355-201b-4af2-a2f6-5550227bde21
    my $concatenated = ListOps::concat [];
    is(
        $concatenated,
        [],
        "concatenate a list of lists: empty list",
    );
} # end: 28444355-201b-4af2-a2f6-5550227bde21

{ # begin: 331451c1-9573-42a1-9869-2d06e3b389a9
    my $concatenated = ListOps::concat [ [ 1, 2 ], [3], [], [ 4, 5, 6 ] ];
    is(
        $concatenated,
        [ 1, 2, 3, 4, 5, 6 ],
        "concatenate a list of lists: list of lists",
    );
} # end: 331451c1-9573-42a1-9869-2d06e3b389a9

{ # begin: d6ecd72c-197f-40c3-89a4-aa1f45827e09
    my $concatenated = ListOps::concat [ [ [1], [2] ], [ [3] ], [ [] ], [ [ 4, 5, 6 ] ] ];
    is(
        $concatenated,
        [ [1], [2], [3], [], [ 4, 5, 6 ] ],
        "concatenate a list of lists: list of nested lists",
    );
} # end: d6ecd72c-197f-40c3-89a4-aa1f45827e09

{ # begin: 0524fba8-3e0f-4531-ad2b-f7a43da86a16
    my $filtered = ListOps::filter sub ($el) { $el % 2 == 1 }, [];
    is(
        $filtered,
        [],
        "filter list returning only values that satisfy the filter function: empty list",
    );
} # end: 0524fba8-3e0f-4531-ad2b-f7a43da86a16

{ # begin: 88494bd5-f520-4edb-8631-88e415b62d24
    my $filtered = ListOps::filter sub ($el) { $el % 2 == 1 }, [ 1, 2, 3, 5 ];
    is(
        $filtered,
        [ 1, 3, 5 ],
        "filter list returning only values that satisfy the filter function: non-empty list",
    );
} # end: 88494bd5-f520-4edb-8631-88e415b62d24

{ # begin: 1cf0b92d-8d96-41d5-9c21-7b3c37cb6aad
    my $len = ListOps::length [];
    is(
        $len,
        0,
        "returns the length of a list: empty list",
    );
} # end: 1cf0b92d-8d96-41d5-9c21-7b3c37cb6aad

{ # begin: d7b8d2d9-2d16-44c4-9a19-6e5f237cb71e
    my $len = ListOps::length [ 1, 2, 3, 4 ];
    is(
        $len,
        4,
        "returns the length of a list: non-empty list",
    );
} # end: d7b8d2d9-2d16-44c4-9a19-6e5f237cb71e

{ # begin: c0bc8962-30e2-4bec-9ae4-668b8ecd75aa
    my $mapped = ListOps::map sub ($el) { $el + 1 }, [];
    is(
        $mapped,
        [],
        "return a list of elements whose values equal the list value transformed by the mapping function: empty list",
    );
} # end: c0bc8962-30e2-4bec-9ae4-668b8ecd75aa

{ # begin: 11e71a95-e78b-4909-b8e4-60cdcaec0e91
    my $mapped = ListOps::map sub ($el) { $el + 1 }, [ 1, 3, 5, 7 ];
    is(
        $mapped,
        [ 2, 4, 6, 8 ],
        "return a list of elements whose values equal the list value transformed by the mapping function: non-empty list",
    );
} # end: 11e71a95-e78b-4909-b8e4-60cdcaec0e91

{ # begin: 36549237-f765-4a4c-bfd9-5d3a8f7b07d2
    my $func   = sub ( $acc, $el ) { $acc * $el };
    my $result = ListOps::foldl $func, 2, [];
    is(
        $result,
        2,
        "folds (reduces) the given list from the left with a function: empty list",
    );
} # end: 36549237-f765-4a4c-bfd9-5d3a8f7b07d2

{ # begin: 7a626a3c-03ec-42bc-9840-53f280e13067
    my $func   = sub ( $acc, $el ) { $acc + $el };
    my $result = ListOps::foldl $func, 5, [ 1, 2, 3, 4 ];
    is(
        $result,
        15,
        "folds (reduces) the given list from the left with a function: direction independent function applied to non-empty list",
    );
} # end: 7a626a3c-03ec-42bc-9840-53f280e13067

{ # begin: d7fcad99-e88e-40e1-a539-4c519681f390
    my $func   = sub ( $acc, $el ) { $el / $acc };
    my $result = ListOps::foldl $func, 24, [ 1, 2, 3, 4 ];
    is(
        $result,
        64,
        "folds (reduces) the given list from the left with a function: direction dependent function applied to non-empty list",
    );
} # end: d7fcad99-e88e-40e1-a539-4c519681f390

{ # begin: 17214edb-20ba-42fc-bda8-000a5ab525b0
    my $func   = sub ( $acc, $el ) { $el * $acc };
    my $result = ListOps::foldr $func, 2, [];
    is(
        $result,
        2,
        "folds (reduces) the given list from the right with a function: empty list",
    );
} # end: 17214edb-20ba-42fc-bda8-000a5ab525b0

{ # begin: e1c64db7-9253-4a3d-a7c4-5273b9e2a1bd
    my $func   = sub ( $acc, $el ) { $el + $acc };
    my $result = ListOps::foldr $func, 5, [ 1, 2, 3, 4 ];
    is(
        $result,
        15,
        "folds (reduces) the given list from the right with a function: direction independent function applied to non-empty list",
    );
} # end: e1c64db7-9253-4a3d-a7c4-5273b9e2a1bd

{ # begin: 8066003b-f2ff-437e-9103-66e6df474844
    my $func   = sub ( $acc, $el ) { $el / $acc };
    my $result = ListOps::foldr $func, 24, [ 1, 2, 3, 4 ];
    is(
        $result,
        9,
        "folds (reduces) the given list from the right with a function: direction dependent function applied to non-empty list",
    );
} # end: 8066003b-f2ff-437e-9103-66e6df474844

{ # begin: 94231515-050e-4841-943d-d4488ab4ee30
    my $reversed = ListOps::reverse [];
    is(
        $reversed,
        [],
        "reverse the elements of the list: empty list",
    );
} # end: 94231515-050e-4841-943d-d4488ab4ee30

{ # begin: fcc03d1e-42e0-4712-b689-d54ad761f360
    my $reversed = ListOps::reverse [ 1, 3, 5, 7 ];
    is(
        $reversed,
        [ 7, 5, 3, 1 ],
        "reverse the elements of the list: non-empty list",
    );
} # end: fcc03d1e-42e0-4712-b689-d54ad761f360

{ # begin: 40872990-b5b8-4cb8-9085-d91fc0d05d26
    my $reversed = ListOps::reverse [ [ 1, 2 ], [3], [], [ 4, 5, 6 ] ];
    is(
        $reversed,
        [ [ 4, 5, 6 ], [], [3], [ 1, 2 ] ],
        "reverse the elements of the list: list of lists is not flattened",
    );
} # end: 40872990-b5b8-4cb8-9085-d91fc0d05d26

done_testing;
