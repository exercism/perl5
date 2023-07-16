#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Sublist qw<compare_lists>;

imported_ok qw<compare_lists> or bail_out;

is(    # begin: 97319c93-ebc5-47ab-a022-02a1980e1d29
    compare_lists( [], [] ),
    "equal",
    "empty lists",
);     # end: 97319c93-ebc5-47ab-a022-02a1980e1d29

is(    # begin: de27dbd4-df52-46fe-a336-30be58457382
    compare_lists( [], [ 1, 2, 3 ] ),
    "sublist",
    "empty list within non empty list",
);     # end: de27dbd4-df52-46fe-a336-30be58457382

is(    # begin: 5487cfd1-bc7d-429f-ac6f-1177b857d4fb
    compare_lists( [ 1, 2, 3 ], [] ),
    "superlist",
    "non empty list contains empty list",
);     # end: 5487cfd1-bc7d-429f-ac6f-1177b857d4fb

is(    # begin: 1f390b47-f6b2-4a93-bc23-858ba5dda9a6
    compare_lists( [ 1, 2, 3 ], [ 1, 2, 3 ] ),
    "equal",
    "list equals itself",
);     # end: 1f390b47-f6b2-4a93-bc23-858ba5dda9a6

is(    # begin: 7ed2bfb2-922b-4363-ae75-f3a05e8274f5
    compare_lists( [ 1, 2, 3 ], [ 2, 3, 4 ] ),
    "unequal",
    "different lists",
);     # end: 7ed2bfb2-922b-4363-ae75-f3a05e8274f5

is(    # begin: 3b8a2568-6144-4f06-b0a1-9d266b365341
    compare_lists( [ 1, 2, 5 ], [ 0, 1, 2, 3, 1, 2, 5, 6 ] ),
    "sublist",
    "false start",
);     # end: 3b8a2568-6144-4f06-b0a1-9d266b365341

is(    # begin: dc39ed58-6311-4814-be30-05a64bc8d9b1
    compare_lists( [ 1, 1, 2 ], [ 0, 1, 1, 1, 2, 1, 2 ] ),
    "sublist",
    "consecutive",
);     # end: dc39ed58-6311-4814-be30-05a64bc8d9b1

is(    # begin: d1270dab-a1ce-41aa-b29d-b3257241ac26
    compare_lists( [ 0, 1, 2 ], [ 0, 1, 2, 3, 4, 5 ] ),
    "sublist",
    "sublist at start",
);     # end: d1270dab-a1ce-41aa-b29d-b3257241ac26

is(    # begin: 81f3d3f7-4f25-4ada-bcdc-897c403de1b6
    compare_lists( [ 2, 3, 4 ], [ 0, 1, 2, 3, 4, 5 ] ),
    "sublist",
    "sublist in middle",
);     # end: 81f3d3f7-4f25-4ada-bcdc-897c403de1b6

is(    # begin: 43bcae1e-a9cf-470e-923e-0946e04d8fdd
    compare_lists( [ 3, 4, 5 ], [ 0, 1, 2, 3, 4, 5 ] ),
    "sublist",
    "sublist at end",
);     # end: 43bcae1e-a9cf-470e-923e-0946e04d8fdd

is(    # begin: 76cf99ed-0ff0-4b00-94af-4dfb43fe5caa
    compare_lists( [ 0, 1, 2, 3, 4, 5 ], [ 0, 1, 2 ] ),
    "superlist",
    "at start of superlist",
);     # end: 76cf99ed-0ff0-4b00-94af-4dfb43fe5caa

is(    # begin: b83989ec-8bdf-4655-95aa-9f38f3e357fd
    compare_lists( [ 0, 1, 2, 3, 4, 5 ], [ 2, 3 ] ),
    "superlist",
    "in middle of superlist",
);     # end: b83989ec-8bdf-4655-95aa-9f38f3e357fd

is(    # begin: 26f9f7c3-6cf6-4610-984a-662f71f8689b
    compare_lists( [ 0, 1, 2, 3, 4, 5 ], [ 3, 4, 5 ] ),
    "superlist",
    "at end of superlist",
);     # end: 26f9f7c3-6cf6-4610-984a-662f71f8689b

is(    # begin: 0a6db763-3588-416a-8f47-76b1cedde31e
    compare_lists( [ 1, 3 ], [ 1, 2, 3 ] ),
    "unequal",
    "first list missing element from second list",
);     # end: 0a6db763-3588-416a-8f47-76b1cedde31e

is(    # begin: 83ffe6d8-a445-4a3c-8795-1e51a95e65c3
    compare_lists( [ 1, 2, 3 ], [ 1, 3 ] ),
    "unequal",
    "second list missing element from first list",
);     # end: 83ffe6d8-a445-4a3c-8795-1e51a95e65c3

is(    # begin: 7bc76cb8-5003-49ca-bc47-cdfbe6c2bb89
    compare_lists( [ 1, 2 ], [ 1, 22 ] ),
    "unequal",
    "first list missing additional digits from second list",
);     # end: 7bc76cb8-5003-49ca-bc47-cdfbe6c2bb89

is(    # begin: 0d7ee7c1-0347-45c8-9ef5-b88db152b30b
    compare_lists( [ 1, 2, 3 ], [ 3, 2, 1 ] ),
    "unequal",
    "order matters to a list",
);     # end: 0d7ee7c1-0347-45c8-9ef5-b88db152b30b

is(    # begin: 5f47ce86-944e-40f9-9f31-6368aad70aa6
    compare_lists( [ 1, 0, 1 ], [ 10, 1 ] ),
    "unequal",
    "same digits but different numbers",
);     # end: 5f47ce86-944e-40f9-9f31-6368aad70aa6

done_testing;
