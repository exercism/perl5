#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use EliudsEggs qw<egg_count>;

is( # begin: 559e789d-07d1-4422-9004-3b699f83bca3
    egg_count(0),
    0,
    "0 eggs",
); # end: 559e789d-07d1-4422-9004-3b699f83bca3

is( # begin: 97223282-f71e-490c-92f0-b3ec9e275aba
    egg_count(16),
    1,
    "1 egg",
); # end: 97223282-f71e-490c-92f0-b3ec9e275aba

is( # begin: 1f8fd18f-26e9-4144-9a0e-57cdfc4f4ff5
    egg_count(89),
    4,
    "4 eggs",
); # end: 1f8fd18f-26e9-4144-9a0e-57cdfc4f4ff5

is( # begin: 0c18be92-a498-4ef2-bcbb-28ac4b06cb81
    egg_count(2000000000),
    13,
    "13 eggs",
); # end: 0c18be92-a498-4ef2-bcbb-28ac4b06cb81

done_testing;
