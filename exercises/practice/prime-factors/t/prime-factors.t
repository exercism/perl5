#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use PrimeFactors qw<factors>;

is( # begin: 924fc966-a8f5-4288-82f2-6b9224819ccd
    factors(1),
    [],
    "no factors",
); # end: 924fc966-a8f5-4288-82f2-6b9224819ccd

is( # begin: 17e30670-b105-4305-af53-ddde182cb6ad
    factors(2),
    [2],
    "prime number",
); # end: 17e30670-b105-4305-af53-ddde182cb6ad

is( # begin: 238d57c8-4c12-42ef-af34-ae4929f94789
    factors(3),
    [3],
    "another prime number",
); # end: 238d57c8-4c12-42ef-af34-ae4929f94789

is( # begin: f59b8350-a180-495a-8fb1-1712fbee1158
    factors(9),
    [ 3, 3 ],
    "square of a prime",
); # end: f59b8350-a180-495a-8fb1-1712fbee1158

is( # begin: 756949d3-3158-4e3d-91f2-c4f9f043ee70
    factors(4),
    [ 2, 2 ],
    "product of first prime",
); # end: 756949d3-3158-4e3d-91f2-c4f9f043ee70

is( # begin: bc8c113f-9580-4516-8669-c5fc29512ceb
    factors(8),
    [ 2, 2, 2 ],
    "cube of a prime",
); # end: bc8c113f-9580-4516-8669-c5fc29512ceb

is( # begin: 7d6a3300-a4cb-4065-bd33-0ced1de6cb44
    factors(27),
    [ 3, 3, 3 ],
    "product of second prime",
); # end: 7d6a3300-a4cb-4065-bd33-0ced1de6cb44

is( # begin: 073ac0b2-c915-4362-929d-fc45f7b9a9e4
    factors(625),
    [ 5, 5, 5, 5 ],
    "product of third prime",
); # end: 073ac0b2-c915-4362-929d-fc45f7b9a9e4

is( # begin: 6e0e4912-7fb6-47f3-a9ad-dbcd79340c75
    factors(6),
    [ 2, 3 ],
    "product of first and second prime",
); # end: 6e0e4912-7fb6-47f3-a9ad-dbcd79340c75

is( # begin: 00485cd3-a3fe-4fbe-a64a-a4308fc1f870
    factors(12),
    [ 2, 2, 3 ],
    "product of primes and non-primes",
); # end: 00485cd3-a3fe-4fbe-a64a-a4308fc1f870

is( # begin: 02251d54-3ca1-4a9b-85e1-b38f4b0ccb91
    factors(901255),
    [ 5, 17, 23, 461 ],
    "product of primes",
); # end: 02251d54-3ca1-4a9b-85e1-b38f4b0ccb91

is( # begin: 070cf8dc-e202-4285-aa37-8d775c9cd473
    factors(93819012551),
    [ 11, 9539, 894119 ],
    "factors include a large prime",
); # end: 070cf8dc-e202-4285-aa37-8d775c9cd473

done_testing;
