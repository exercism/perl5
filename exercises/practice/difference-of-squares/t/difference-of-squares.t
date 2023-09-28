#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use DifferenceOfSquares qw<square_of_sum sum_of_squares difference_of_squares>;

is( # begin: e46c542b-31fc-4506-bcae-6b62b3268537
    square_of_sum(1),
    number(1),
    "Square the sum of the numbers up to the given number: square of sum 1",
); # end: e46c542b-31fc-4506-bcae-6b62b3268537

is( # begin: 9b3f96cb-638d-41ee-99b7-b4f9c0622948
    square_of_sum(5),
    number(225),
    "Square the sum of the numbers up to the given number: square of sum 5",
); # end: 9b3f96cb-638d-41ee-99b7-b4f9c0622948

is( # begin: 54ba043f-3c35-4d43-86ff-3a41625d5e86
    square_of_sum(100),
    number(25502500),
    "Square the sum of the numbers up to the given number: square of sum 100",
); # end: 54ba043f-3c35-4d43-86ff-3a41625d5e86

is( # begin: 01d84507-b03e-4238-9395-dd61d03074b5
    sum_of_squares(1),
    number(1),
    "Sum the squares of the numbers up to the given number: sum of squares 1",
); # end: 01d84507-b03e-4238-9395-dd61d03074b5

is( # begin: c93900cd-8cc2-4ca4-917b-dd3027023499
    sum_of_squares(5),
    number(55),
    "Sum the squares of the numbers up to the given number: sum of squares 5",
); # end: c93900cd-8cc2-4ca4-917b-dd3027023499

is( # begin: 94807386-73e4-4d9e-8dec-69eb135b19e4
    sum_of_squares(100),
    number(338350),
    "Sum the squares of the numbers up to the given number: sum of squares 100",
); # end: 94807386-73e4-4d9e-8dec-69eb135b19e4

is( # begin: 44f72ae6-31a7-437f-858d-2c0837adabb6
    difference_of_squares(1),
    number(0),
    "Subtract sum of squares from square of sums: difference of squares 1",
); # end: 44f72ae6-31a7-437f-858d-2c0837adabb6

is( # begin: 005cb2bf-a0c8-46f3-ae25-924029f8b00b
    difference_of_squares(5),
    number(170),
    "Subtract sum of squares from square of sums: difference of squares 5",
); # end: 005cb2bf-a0c8-46f3-ae25-924029f8b00b

is( # begin: b1bf19de-9a16-41c0-a62b-1f02ecc0b036
    difference_of_squares(100),
    number(25164150),
    "Subtract sum of squares from square of sums: difference of squares 100",
); # end: b1bf19de-9a16-41c0-a62b-1f02ecc0b036

done_testing;
