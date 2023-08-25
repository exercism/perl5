#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Darts ();

is( # begin: 9033f731-0a3a-4d9c-b1c0-34a1c8362afb
    Darts->new( x => -9, y => 9 )->score,
    0,
    "Missed target",
); # end: 9033f731-0a3a-4d9c-b1c0-34a1c8362afb

is( # begin: 4c9f6ff4-c489-45fd-be8a-1fcb08b4d0ba
    Darts->new( x => 0, y => 10 )->score,
    1,
    "On the outer circle",
); # end: 4c9f6ff4-c489-45fd-be8a-1fcb08b4d0ba

is( # begin: 14378687-ee58-4c9b-a323-b089d5274be8
    Darts->new( x => -5, y => 0 )->score,
    5,
    "On the middle circle",
); # end: 14378687-ee58-4c9b-a323-b089d5274be8

is( # begin: 849e2e63-85bd-4fed-bc3b-781ae962e2c9
    Darts->new( x => 0, y => -1 )->score,
    10,
    "On the inner circle",
); # end: 849e2e63-85bd-4fed-bc3b-781ae962e2c9

is( # begin: 1c5ffd9f-ea66-462f-9f06-a1303de5a226
    Darts->new( x => 0, y => 0 )->score,
    10,
    "Exactly on center",
); # end: 1c5ffd9f-ea66-462f-9f06-a1303de5a226

is( # begin: b65abce3-a679-4550-8115-4b74bda06088
    Darts->new( x => -0.1, y => -0.1 )->score,
    10,
    "Near the center",
); # end: b65abce3-a679-4550-8115-4b74bda06088

is( # begin: 66c29c1d-44f5-40cf-9927-e09a1305b399
    Darts->new( x => 0.7, y => 0.7 )->score,
    10,
    "Just within the inner circle",
); # end: 66c29c1d-44f5-40cf-9927-e09a1305b399

is( # begin: d1012f63-c97c-4394-b944-7beb3d0b141a
    Darts->new( x => 0.8, y => -0.8 )->score,
    5,
    "Just outside the inner circle",
); # end: d1012f63-c97c-4394-b944-7beb3d0b141a

is( # begin: ab2b5666-b0b4-49c3-9b27-205e790ed945
    Darts->new( x => -3.5, y => 3.5 )->score,
    5,
    "Just within the middle circle",
); # end: ab2b5666-b0b4-49c3-9b27-205e790ed945

is( # begin: 70f1424e-d690-4860-8caf-9740a52c0161
    Darts->new( x => -3.6, y => -3.6 )->score,
    1,
    "Just outside the middle circle",
); # end: 70f1424e-d690-4860-8caf-9740a52c0161

is( # begin: a7dbf8db-419c-4712-8a7f-67602b69b293
    Darts->new( x => -7, y => 7 )->score,
    1,
    "Just within the outer circle",
); # end: a7dbf8db-419c-4712-8a7f-67602b69b293

is( # begin: e0f39315-9f9a-4546-96e4-a9475b885aa7
    Darts->new( x => 7.1, y => -7.1 )->score,
    0,
    "Just outside the outer circle",
); # end: e0f39315-9f9a-4546-96e4-a9475b885aa7

is( # begin: 045d7d18-d863-4229-818e-b50828c75d19
    Darts->new( x => 0.5, y => -4 )->score,
    5,
    "Asymmetric position between the inner and middle circles",
); # end: 045d7d18-d863-4229-818e-b50828c75d19

done_testing;
