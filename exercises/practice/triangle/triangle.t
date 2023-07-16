#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Triangle qw<is_equilateral is_isosceles is_scalene>;

is( # begin: 8b2c43ac-7257-43f9-b552-7631a91988af
    is_equilateral( [ 2, 2, 2 ] ),
    T,
    "equilateral triangle: all sides are equal",
); # end: 8b2c43ac-7257-43f9-b552-7631a91988af

is( # begin: 33eb6f87-0498-4ccf-9573-7f8c3ce92b7b
    is_equilateral( [ 2, 3, 2 ] ),
    DF,
    "equilateral triangle: any side is unequal",
); # end: 33eb6f87-0498-4ccf-9573-7f8c3ce92b7b

is( # begin: c6585b7d-a8c0-4ad8-8a34-e21d36f7ad87
    is_equilateral( [ 5, 4, 6 ] ),
    DF,
    "equilateral triangle: no sides are equal",
); # end: c6585b7d-a8c0-4ad8-8a34-e21d36f7ad87

is( # begin: 16e8ceb0-eadb-46d1-b892-c50327479251
    is_equilateral( [ 0, 0, 0 ] ),
    DF,
    "equilateral triangle: all zero sides is not a triangle",
); # end: 16e8ceb0-eadb-46d1-b892-c50327479251

is( # begin: 3022f537-b8e5-4cc1-8f12-fd775827a00c
    is_equilateral( [ 0.5, 0.5, 0.5 ] ),
    T,
    "equilateral triangle: sides may be floats",
); # end: 3022f537-b8e5-4cc1-8f12-fd775827a00c

is( # begin: cbc612dc-d75a-4c1c-87fc-e2d5edd70b71
    is_isosceles( [ 3, 4, 4 ] ),
    T,
    "isosceles triangle: last two sides are equal",
); # end: cbc612dc-d75a-4c1c-87fc-e2d5edd70b71

is( # begin: e388ce93-f25e-4daf-b977-4b7ede992217
    is_isosceles( [ 4, 4, 3 ] ),
    T,
    "isosceles triangle: first two sides are equal",
); # end: e388ce93-f25e-4daf-b977-4b7ede992217

is( # begin: d2080b79-4523-4c3f-9d42-2da6e81ab30f
    is_isosceles( [ 4, 3, 4 ] ),
    T,
    "isosceles triangle: first and last sides are equal",
); # end: d2080b79-4523-4c3f-9d42-2da6e81ab30f

is( # begin: 8d71e185-2bd7-4841-b7e1-71689a5491d8
    is_isosceles( [ 4, 4, 4 ] ),
    T,
    "isosceles triangle: equilateral triangles are also isosceles",
); # end: 8d71e185-2bd7-4841-b7e1-71689a5491d8

is( # begin: 840ed5f8-366f-43c5-ac69-8f05e6f10bbb
    is_isosceles( [ 2, 3, 4 ] ),
    DF,
    "isosceles triangle: no sides are equal",
); # end: 840ed5f8-366f-43c5-ac69-8f05e6f10bbb

is( # begin: 2eba0cfb-6c65-4c40-8146-30b608905eae
    is_isosceles( [ 1, 1, 3 ] ),
    DF,
    "isosceles triangle: first triangle inequality violation",
); # end: 2eba0cfb-6c65-4c40-8146-30b608905eae

is( # begin: 278469cb-ac6b-41f0-81d4-66d9b828f8ac
    is_isosceles( [ 1, 3, 1 ] ),
    DF,
    "isosceles triangle: second triangle inequality violation",
); # end: 278469cb-ac6b-41f0-81d4-66d9b828f8ac

is( # begin: 90efb0c7-72bb-4514-b320-3a3892e278ff
    is_isosceles( [ 3, 1, 1 ] ),
    DF,
    "isosceles triangle: third triangle inequality violation",
); # end: 90efb0c7-72bb-4514-b320-3a3892e278ff

is( # begin: adb4ee20-532f-43dc-8d31-e9271b7ef2bc
    is_isosceles( [ 0.5, 0.4, 0.5 ] ),
    T,
    "isosceles triangle: sides may be floats",
); # end: adb4ee20-532f-43dc-8d31-e9271b7ef2bc

is( # begin: e8b5f09c-ec2e-47c1-abec-f35095733afb
    is_scalene( [ 5, 4, 6 ] ),
    T,
    "scalene triangle: no sides are equal",
); # end: e8b5f09c-ec2e-47c1-abec-f35095733afb

is( # begin: 2510001f-b44d-4d18-9872-2303e7977dc1
    is_scalene( [ 4, 4, 4 ] ),
    DF,
    "scalene triangle: all sides are equal",
); # end: 2510001f-b44d-4d18-9872-2303e7977dc1

is( # begin: c6e15a92-90d9-4fb3-90a2-eef64f8d3e1e
    is_scalene( [ 4, 4, 3 ] ),
    DF,
    "scalene triangle: first and second sides are equal",
); # end: c6e15a92-90d9-4fb3-90a2-eef64f8d3e1e

is( # begin: 3da23a91-a166-419a-9abf-baf4868fd985
    is_scalene( [ 3, 4, 3 ] ),
    DF,
    "scalene triangle: first and third sides are equal",
); # end: 3da23a91-a166-419a-9abf-baf4868fd985

is( # begin: b6a75d98-1fef-4c42-8e9a-9db854ba0a4d
    is_scalene( [ 4, 3, 3 ] ),
    DF,
    "scalene triangle: second and third sides are equal",
); # end: b6a75d98-1fef-4c42-8e9a-9db854ba0a4d

is( # begin: 70ad5154-0033-48b7-af2c-b8d739cd9fdc
    is_scalene( [ 7, 3, 2 ] ),
    DF,
    "scalene triangle: may not violate triangle inequality",
); # end: 70ad5154-0033-48b7-af2c-b8d739cd9fdc

is( # begin: 26d9d59d-f8f1-40d3-ad58-ae4d54123d7d
    is_scalene( [ 0.5, 0.4, 0.6 ] ),
    T,
    "scalene triangle: sides may be floats",
); # end: 26d9d59d-f8f1-40d3-ad58-ae4d54123d7d

done_testing;
