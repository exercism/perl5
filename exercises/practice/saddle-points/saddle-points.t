#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use SaddlePoints qw<saddle_points>;

is( # begin: 3e374e63-a2e0-4530-a39a-d53c560382bd
    saddle_points( [ [ 9, 8, 7 ], [ 5, 3, 2 ], [ 6, 6, 7 ] ] ),
    bag {
        item { column => 1, row => 2 };
        end;
    },
    "Can identify single saddle point",
); # end: 3e374e63-a2e0-4530-a39a-d53c560382bd

is( # begin: 6b501e2b-6c1f-491f-b1bb-7f278f760534
    saddle_points( [ [] ] ),
    bag {
        end;
    },
    "Can identify that empty matrix has no saddle points",
); # end: 6b501e2b-6c1f-491f-b1bb-7f278f760534

is( # begin: 8c27cc64-e573-4fcb-a099-f0ae863fb02f
    saddle_points( [ [ 1, 2, 3 ], [ 3, 1, 2 ], [ 2, 3, 1 ] ] ),
    bag {
        end;
    },
    "Can identify lack of saddle points when there are none",
); # end: 8c27cc64-e573-4fcb-a099-f0ae863fb02f

is( # begin: 6d1399bd-e105-40fd-a2c9-c6609507d7a3
    saddle_points( [ [ 4, 5, 4 ], [ 3, 5, 5 ], [ 1, 5, 4 ] ] ),
    bag {
        item { column => 2, row => 1 };
        item { column => 2, row => 2 };
        item { column => 2, row => 3 };
        end;
    },
    "Can identify multiple saddle points in a column",
); # end: 6d1399bd-e105-40fd-a2c9-c6609507d7a3

is( # begin: 3e81dce9-53b3-44e6-bf26-e328885fd5d1
    saddle_points( [ [ 6, 7, 8 ], [ 5, 5, 5 ], [ 7, 5, 6 ] ] ),
    bag {
        item { column => 1, row => 2 };
        item { column => 2, row => 2 };
        item { column => 3, row => 2 };
        end;
    },
    "Can identify multiple saddle points in a row",
); # end: 3e81dce9-53b3-44e6-bf26-e328885fd5d1

is( # begin: 88868621-b6f4-4837-bb8b-3fad8b25d46b
    saddle_points( [ [ 8, 7, 9 ], [ 6, 7, 6 ], [ 3, 2, 5 ] ] ),
    bag {
        item { column => 3, row => 3 };
        end;
    },
    "Can identify saddle point in bottom right corner",
); # end: 88868621-b6f4-4837-bb8b-3fad8b25d46b

is( # begin: 5b9499ca-fcea-4195-830a-9c4584a0ee79
    saddle_points( [ [ 3, 1, 3 ], [ 3, 2, 4 ] ] ),
    bag {
        item { column => 3, row => 1 };
        item { column => 1, row => 1 };
        end;
    },
    "Can identify saddle points in a non square matrix",
); # end: 5b9499ca-fcea-4195-830a-9c4584a0ee79

is( # begin: ee99ccd2-a1f1-4283-ad39-f8c70f0cf594
    saddle_points( [ [2], [1], [4], [1] ] ),
    bag {
        item { column => 1, row => 2 };
        item { column => 1, row => 4 };
        end;
    },
    "Can identify that saddle points in a single column matrix are those with the minimum value",
); # end: ee99ccd2-a1f1-4283-ad39-f8c70f0cf594

is( # begin: 63abf709-a84b-407f-a1b3-456638689713
    saddle_points( [ [ 2, 5, 3, 5 ] ] ),
    bag {
        item { column => 2, row => 1 };
        item { column => 4, row => 1 };
        end;
    },
    "Can identify that saddle points in a single row matrix are those with the maximum value",
); # end: 63abf709-a84b-407f-a1b3-456638689713

done_testing;
