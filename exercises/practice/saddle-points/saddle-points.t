#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use SaddlePoints qw<saddle_points>;

imported_ok qw<saddle_points> or bail_out;

is(
    saddle_points( [ [ 9, 8, 7 ], [ 5, 3, 2 ], [ 6, 6, 7 ] ] ),
    bag {
        item { column => 1, row => 2 };
        end;
    },
    "Can identify single saddle point",
);

is(
    saddle_points( [ [] ] ),
    bag {
        end;
    },
    "Can identify that empty matrix has no saddle points",
);

is(
    saddle_points( [ [ 1, 2, 3 ], [ 3, 1, 2 ], [ 2, 3, 1 ] ] ),
    bag {
        end;
    },
    "Can identify lack of saddle points when there are none",
);

is(
    saddle_points( [ [ 4, 5, 4 ], [ 3, 5, 5 ], [ 1, 5, 4 ] ] ),
    bag {
        item { column => 2, row => 1 };
        item { column => 2, row => 2 };
        item { column => 2, row => 3 };
        end;
    },
    "Can identify multiple saddle points in a column",
);

is(
    saddle_points( [ [ 6, 7, 8 ], [ 5, 5, 5 ], [ 7, 5, 6 ] ] ),
    bag {
        item { column => 1, row => 2 };
        item { column => 2, row => 2 };
        item { column => 3, row => 2 };
        end;
    },
    "Can identify multiple saddle points in a row",
);

is(
    saddle_points( [ [ 8, 7, 9 ], [ 6, 7, 6 ], [ 3, 2, 5 ] ] ),
    bag {
        item { column => 3, row => 3 };
        end;
    },
    "Can identify saddle point in bottom right corner",
);

is(
    saddle_points( [ [ 3, 1, 3 ], [ 3, 2, 4 ] ] ),
    bag {
        item { column => 3, row => 1 };
        item { column => 1, row => 1 };
        end;
    },
    "Can identify saddle points in a non square matrix",
);

is(
    saddle_points( [ [2], [1], [4], [1] ] ),
    bag {
        item { column => 1, row => 2 };
        item { column => 1, row => 4 };
        end;
    },
    "Can identify that saddle points in a single column matrix are those with the minimum value",
);

is(
    saddle_points( [ [ 2, 5, 3, 5 ] ] ),
    bag {
        item { column => 2, row => 1 };
        item { column => 4, row => 1 };
        end;
    },
    "Can identify that saddle points in a single row matrix are those with the maximum value",
);

done_testing;
