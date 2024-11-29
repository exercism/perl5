#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use CollatzConjecture qw<steps>;

is( # begin: 540a3d51-e7a6-47a5-92a3-4ad1838f0bfd
    steps(1),
    0,
    "zero steps for one",
); # end: 540a3d51-e7a6-47a5-92a3-4ad1838f0bfd

is( # begin: 3d76a0a6-ea84-444a-821a-f7857c2c1859
    steps(16),
    4,
    "divide if even",
); # end: 3d76a0a6-ea84-444a-821a-f7857c2c1859

is( # begin: 754dea81-123c-429e-b8bc-db20b05a87b9
    steps(12),
    9,
    "even and odd steps",
); # end: 754dea81-123c-429e-b8bc-db20b05a87b9

is( # begin: ecfd0210-6f85-44f6-8280-f65534892ff6
    steps(1000000),
    152,
    "large number of even and odd steps",
); # end: ecfd0210-6f85-44f6-8280-f65534892ff6

like( # begin: 2187673d-77d6-4543-975e-66df6c50e2da
    dies( sub { steps(0) } ),
    qr/Only positive integers are allowed/,
    "zero is an error",
); # end: 2187673d-77d6-4543-975e-66df6c50e2da

like( # begin: ec11f479-56bc-47fd-a434-bcd7a31a7a2e
    dies( sub { steps(-15) } ),
    qr/Only positive integers are allowed/,
    "negative value is an error",
); # end: ec11f479-56bc-47fd-a434-bcd7a31a7a2e

done_testing;
