#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Triangle qw<is_equilateral is_isosceles is_scalene>;

imported_ok qw<is_equilateral is_isosceles is_scalene> or bail_out;

is(
    is_equilateral( [ 2, 2, 2 ] ),
    T,
    "equilateral triangle: all sides are equal",
);

is(
    is_equilateral( [ 2, 3, 2 ] ),
    DF,
    "equilateral triangle: any side is unequal",
);

is(
    is_equilateral( [ 5, 4, 6 ] ),
    DF,
    "equilateral triangle: no sides are equal",
);

is(
    is_equilateral( [ 0, 0, 0 ] ),
    DF,
    "equilateral triangle: all zero sides is not a triangle",
);

is(
    is_equilateral( [ 0.5, 0.5, 0.5 ] ),
    T,
    "equilateral triangle: sides may be floats",
);

is(
    is_isosceles( [ 3, 4, 4 ] ),
    T,
    "isosceles triangle: last two sides are equal",
);

is(
    is_isosceles( [ 4, 4, 3 ] ),
    T,
    "isosceles triangle: first two sides are equal",
);

is(
    is_isosceles( [ 4, 3, 4 ] ),
    T,
    "isosceles triangle: first and last sides are equal",
);

is(
    is_isosceles( [ 4, 4, 4 ] ),
    T,
    "isosceles triangle: equilateral triangles are also isosceles",
);

is(
    is_isosceles( [ 2, 3, 4 ] ),
    DF,
    "isosceles triangle: no sides are equal",
);

is(
    is_isosceles( [ 1, 1, 3 ] ),
    DF,
    "isosceles triangle: first triangle inequality violation",
);

is(
    is_isosceles( [ 1, 3, 1 ] ),
    DF,
    "isosceles triangle: second triangle inequality violation",
);

is(
    is_isosceles( [ 3, 1, 1 ] ),
    DF,
    "isosceles triangle: third triangle inequality violation",
);

is(
    is_isosceles( [ 0.5, 0.4, 0.5 ] ),
    T,
    "isosceles triangle: sides may be floats",
);

is(
    is_scalene( [ 5, 4, 6 ] ),
    T,
    "scalene triangle: no sides are equal",
);

is(
    is_scalene( [ 4, 4, 4 ] ),
    DF,
    "scalene triangle: all sides are equal",
);

is(
    is_scalene( [ 4, 4, 3 ] ),
    DF,
    "scalene triangle: first and second sides are equal",
);

is(
    is_scalene( [ 3, 4, 3 ] ),
    DF,
    "scalene triangle: first and third sides are equal",
);

is(
    is_scalene( [ 4, 3, 3 ] ),
    DF,
    "scalene triangle: second and third sides are equal",
);

is(
    is_scalene( [ 7, 3, 2 ] ),
    DF,
    "scalene triangle: may not violate triangle inequality",
);

is(
    is_scalene( [ 0.5, 0.4, 0.6 ] ),
    T,
    "scalene triangle: sides may be floats",
);

done_testing;
