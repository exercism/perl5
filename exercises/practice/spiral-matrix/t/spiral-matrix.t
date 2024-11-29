#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use SpiralMatrix qw<spiral_matrix>;

is( # begin: 8f584201-b446-4bc9-b132-811c8edd9040
    spiral_matrix(0),
    [],
    "empty spiral",
); # end: 8f584201-b446-4bc9-b132-811c8edd9040

is( # begin: e40ae5f3-e2c9-4639-8116-8a119d632ab2
    spiral_matrix(1),
    [ [1] ],
    "trivial spiral",
); # end: e40ae5f3-e2c9-4639-8116-8a119d632ab2

is( # begin: cf05e42d-eb78-4098-a36e-cdaf0991bc48
    spiral_matrix(2),
    [ [ 1, 2 ], [ 4, 3 ] ],
    "spiral of size 2",
); # end: cf05e42d-eb78-4098-a36e-cdaf0991bc48

is( # begin: 1c475667-c896-4c23-82e2-e033929de939
    spiral_matrix(3),
    [ [ 1, 2, 3 ], [ 8, 9, 4 ], [ 7, 6, 5 ] ],
    "spiral of size 3",
); # end: 1c475667-c896-4c23-82e2-e033929de939

is( # begin: 05ccbc48-d891-44f5-9137-f4ce462a759d
    spiral_matrix(4),
    [ [ 1, 2, 3, 4 ], [ 12, 13, 14, 5 ], [ 11, 16, 15, 6 ], [ 10, 9, 8, 7 ] ],
    "spiral of size 4",
); # end: 05ccbc48-d891-44f5-9137-f4ce462a759d

is( # begin: f4d2165b-1738-4e0c-bed0-c459045ae50d
    spiral_matrix(5),
    [ [ 1, 2, 3, 4, 5 ], [ 16, 17, 18, 19, 6 ], [ 15, 24, 25, 20, 7 ], [ 14, 23, 22, 21, 8 ], [ 13, 12, 11, 10, 9 ] ],
    "spiral of size 5",
); # end: f4d2165b-1738-4e0c-bed0-c459045ae50d

done_testing;
