#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use TwoFer qw<two_fer>;

is( # begin: 1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce
    two_fer(),
    "One for you, one for me.",
    "no name given",
); # end: 1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce

is( # begin: b4c6dbb8-b4fb-42c2-bafd-10785abe7709
    two_fer("Alice"),
    "One for Alice, one for me.",
    "a name given",
); # end: b4c6dbb8-b4fb-42c2-bafd-10785abe7709

is( # begin: 3549048d-1a6e-4653-9a79-b0bda163e8d5
    two_fer("Bob"),
    "One for Bob, one for me.",
    "another name given",
); # end: 3549048d-1a6e-4653-9a79-b0bda163e8d5

done_testing;
