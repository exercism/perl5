#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use ArmstrongNumbers qw<is_armstrong_number>;
use bignum;

is( # begin: c1ed103c-258d-45b2-be73-d8c6d9580c7b
    is_armstrong_number(0),
    T, # True
    "Zero is an Armstrong number"
); # end: c1ed103c-258d-45b2-be73-d8c6d9580c7b

is( # begin: 579e8f03-9659-4b85-a1a2-d64350f6b17a
    is_armstrong_number(5),
    T, # True
    "Single-digit numbers are Armstrong numbers"
); # end: 579e8f03-9659-4b85-a1a2-d64350f6b17a

is( # begin: 2d6db9dc-5bf8-4976-a90b-b2c2b9feba60
    is_armstrong_number(10),
    DF, # Defined but False
    "There are no two-digit Armstrong numbers"
); # end: 2d6db9dc-5bf8-4976-a90b-b2c2b9feba60

is( # begin: 509c087f-e327-4113-a7d2-26a4e9d18283
    is_armstrong_number(153),
    T, # True
    "Three-digit number that is an Armstrong number"
); # end: 509c087f-e327-4113-a7d2-26a4e9d18283

is( # begin: 7154547d-c2ce-468d-b214-4cb953b870cf
    is_armstrong_number(100),
    DF, # Defined but False
    "Three-digit number that is not an Armstrong number"
); # end: 7154547d-c2ce-468d-b214-4cb953b870cf

is( # begin: 6bac5b7b-42e9-4ecb-a8b0-4832229aa103
    is_armstrong_number(9474),
    T, # True
    "Four-digit number that is an Armstrong number"
); # end: 6bac5b7b-42e9-4ecb-a8b0-4832229aa103

is( # begin: eed4b331-af80-45b5-a80b-19c9ea444b2e
    is_armstrong_number(9475),
    DF, # Defined but False
    "Four-digit number that is not an Armstrong number"
); # end: eed4b331-af80-45b5-a80b-19c9ea444b2e

is( # begin: f971ced7-8d68-4758-aea1-d4194900b864
    is_armstrong_number(9926315),
    T, # True
    "Seven-digit number that is an Armstrong number"
); # end: f971ced7-8d68-4758-aea1-d4194900b864

is( # begin: 7ee45d52-5d35-4fbd-b6f1-5c8cd8a67f18
    is_armstrong_number(9926314),
    DF, # Defined but False
    "Seven-digit number that is not an Armstrong number"
); # end: 7ee45d52-5d35-4fbd-b6f1-5c8cd8a67f18

is( # begin: 5ee2fdf8-334e-4a46-bb8d-e5c19c02c148
    is_armstrong_number(186709961001538790100634132976990),
    T, # True
    "Armstrong number containing seven zeroes"
); # end: 5ee2fdf8-334e-4a46-bb8d-e5c19c02c148

is( # begin: 12ffbf10-307a-434e-b4ad-c925680e1dd4
    is_armstrong_number(115132219018763992565095597973971522401),
    T, # True
    "The largest and last Armstrong number"
); # end: 12ffbf10-307a-434e-b4ad-c925680e1dd4

done_testing;
