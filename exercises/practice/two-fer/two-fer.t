#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use TwoFer qw<two_fer>;

is(
    two_fer(),
    "One for you, one for me.",
    "no name given",
);

is(
    two_fer("Alice"),
    "One for Alice, one for me.",
    "a name given",
);

is(
    two_fer("Bob"),
    "One for Bob, one for me.",
    "another name given",
);

done_testing;
