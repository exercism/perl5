#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Sublist qw<compare_lists>;

imported_ok qw<compare_lists> or bail_out;

is(
    compare_lists( [], [] ),
    "equal",
    "empty lists",
);

is(
    compare_lists( [], [ 1, 2, 3 ] ),
    "sublist",
    "empty list within non empty list",
);

is(
    compare_lists( [ 1, 2, 3 ], [] ),
    "superlist",
    "non empty list contains empty list",
);

is(
    compare_lists( [ 1, 2, 3 ], [ 1, 2, 3 ] ),
    "equal",
    "list equals itself",
);

is(
    compare_lists( [ 1, 2, 3 ], [ 2, 3, 4 ] ),
    "unequal",
    "different lists",
);

is(
    compare_lists( [ 1, 2, 5 ], [ 0, 1, 2, 3, 1, 2, 5, 6 ] ),
    "sublist",
    "false start",
);

is(
    compare_lists( [ 1, 1, 2 ], [ 0, 1, 1, 1, 2, 1, 2 ] ),
    "sublist",
    "consecutive",
);

is(
    compare_lists( [ 0, 1, 2 ], [ 0, 1, 2, 3, 4, 5 ] ),
    "sublist",
    "sublist at start",
);

is(
    compare_lists( [ 2, 3, 4 ], [ 0, 1, 2, 3, 4, 5 ] ),
    "sublist",
    "sublist in middle",
);

is(
    compare_lists( [ 3, 4, 5 ], [ 0, 1, 2, 3, 4, 5 ] ),
    "sublist",
    "sublist at end",
);

is(
    compare_lists( [ 0, 1, 2, 3, 4, 5 ], [ 0, 1, 2 ] ),
    "superlist",
    "at start of superlist",
);

is(
    compare_lists( [ 0, 1, 2, 3, 4, 5 ], [ 2, 3 ] ),
    "superlist",
    "in middle of superlist",
);

is(
    compare_lists( [ 0, 1, 2, 3, 4, 5 ], [ 3, 4, 5 ] ),
    "superlist",
    "at end of superlist",
);

is(
    compare_lists( [ 1, 3 ], [ 1, 2, 3 ] ),
    "unequal",
    "first list missing element from second list",
);

is(
    compare_lists( [ 1, 2, 3 ], [ 1, 3 ] ),
    "unequal",
    "second list missing element from first list",
);

is(
    compare_lists( [ 1, 2 ], [ 1, 22 ] ),
    "unequal",
    "first list missing additional digits from second list",
);

is(
    compare_lists( [ 1, 2, 3 ], [ 3, 2, 1 ] ),
    "unequal",
    "order matters to a list",
);

is(
    compare_lists( [ 1, 0, 1 ], [ 10, 1 ] ),
    "unequal",
    "same digits but different numbers",
);

done_testing;
