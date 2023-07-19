#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use DifferenceOfSquares qw<square_of_sum sum_of_squares difference_of_squares>;

is(
    square_of_sum(1),
    number(1),
    "Square the sum of the numbers up to the given number: square of sum 1",
);

is(
    square_of_sum(5),
    number(225),
    "Square the sum of the numbers up to the given number: square of sum 5",
);

is(
    square_of_sum(100),
    number(25502500),
    "Square the sum of the numbers up to the given number: square of sum 100",
);

is(
    sum_of_squares(1),
    number(1),
    "Sum the squares of the numbers up to the given number: sum of squares 1",
);

is(
    sum_of_squares(5),
    number(55),
    "Sum the squares of the numbers up to the given number: sum of squares 5",
);

is(
    sum_of_squares(100),
    number(338350),
    "Sum the squares of the numbers up to the given number: sum of squares 100",
);

is(
    difference_of_squares(1),
    number(0),
    "Subtract sum of squares from square of sums: difference of squares 1",
);

is(
    difference_of_squares(5),
    number(170),
    "Subtract sum of squares from square of sums: difference of squares 5",
);

is(
    difference_of_squares(100),
    number(25164150),
    "Subtract sum of squares from square of sums: difference of squares 100",
);

done_testing;
