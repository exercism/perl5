#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use PhoneNumber qw<clean_number>;

is( # begin: 79666dce-e0f1-46de-95a1-563802913c35
    clean_number("(223) 456-7890"),
    "2234567890",
    "cleans the number",
); # end: 79666dce-e0f1-46de-95a1-563802913c35

is( # begin: c360451f-549f-43e4-8aba-fdf6cb0bf83f
    clean_number("223.456.7890"),
    "2234567890",
    "cleans numbers with dots",
); # end: c360451f-549f-43e4-8aba-fdf6cb0bf83f

is( # begin: 08f94c34-9a37-46a2-a123-2a8e9727395d
    clean_number("223 456   7890   "),
    "2234567890",
    "cleans numbers with multiple spaces",
); # end: 08f94c34-9a37-46a2-a123-2a8e9727395d

like( # begin: 2de74156-f646-42b5-8638-0ef1d8b58bc2
    dies( sub { clean_number "123456789" } ),
    qr/must not be fewer than 10 digits/,
    "invalid when 9 digits",
); # end: 2de74156-f646-42b5-8638-0ef1d8b58bc2

like( # begin: 57061c72-07b5-431f-9766-d97da7c4399d
    dies( sub { clean_number "22234567890" } ),
    qr/11 digits must start with 1/,
    "invalid when 11 digits does not start with a 1",
); # end: 57061c72-07b5-431f-9766-d97da7c4399d

is( # begin: 9962cbf3-97bb-4118-ba9b-38ff49c64430
    clean_number("12234567890"),
    "2234567890",
    "valid when 11 digits and starting with 1",
); # end: 9962cbf3-97bb-4118-ba9b-38ff49c64430

is( # begin: fa724fbf-054c-4d91-95da-f65ab5b6dbca
    clean_number("+1 (223) 456-7890"),
    "2234567890",
    "valid when 11 digits and starting with 1 even with punctuation",
); # end: fa724fbf-054c-4d91-95da-f65ab5b6dbca

like( # begin: 4a1509b7-8953-4eec-981b-c483358ff531
    dies( sub { clean_number "321234567890" } ),
    qr/must not be greater than 11 digits/,
    "invalid when more than 11 digits",
); # end: 4a1509b7-8953-4eec-981b-c483358ff531

like( # begin: eb8a1fc0-64e5-46d3-b0c6-33184208e28a
    dies( sub { clean_number "523-abc-7890" } ),
    qr/letters not permitted/,
    "invalid with letters",
); # end: eb8a1fc0-64e5-46d3-b0c6-33184208e28a

like( # begin: 065f6363-8394-4759-b080-e6c8c351dd1f
    dies( sub { clean_number "523-\@:!-7890" } ),
    qr/punctuations not permitted/,
    "invalid with punctuations",
); # end: 065f6363-8394-4759-b080-e6c8c351dd1f

like( # begin: d77d07f8-873c-4b17-8978-5f66139bf7d7
    dies( sub { clean_number "(023) 456-7890" } ),
    qr/area code cannot start with zero/,
    "invalid if area code starts with 0",
); # end: d77d07f8-873c-4b17-8978-5f66139bf7d7

like( # begin: c7485cfb-1e7b-4081-8e96-8cdb3b77f15e
    dies( sub { clean_number "(123) 456-7890" } ),
    qr/area code cannot start with one/,
    "invalid if area code starts with 1",
); # end: c7485cfb-1e7b-4081-8e96-8cdb3b77f15e

like( # begin: 4d622293-6976-413d-b8bf-dd8a94d4e2ac
    dies( sub { clean_number "(223) 056-7890" } ),
    qr/exchange code cannot start with zero/,
    "invalid if exchange code starts with 0",
); # end: 4d622293-6976-413d-b8bf-dd8a94d4e2ac

like( # begin: 4cef57b4-7d8e-43aa-8328-1e1b89001262
    dies( sub { clean_number "(223) 156-7890" } ),
    qr/exchange code cannot start with one/,
    "invalid if exchange code starts with 1",
); # end: 4cef57b4-7d8e-43aa-8328-1e1b89001262

like( # begin: 9925b09c-1a0d-4960-a197-5d163cbe308c
    dies( sub { clean_number "1 (023) 456-7890" } ),
    qr/area code cannot start with zero/,
    "invalid if area code starts with 0 on valid 11-digit number",
); # end: 9925b09c-1a0d-4960-a197-5d163cbe308c

like( # begin: 3f809d37-40f3-44b5-ad90-535838b1a816
    dies( sub { clean_number "1 (123) 456-7890" } ),
    qr/area code cannot start with one/,
    "invalid if area code starts with 1 on valid 11-digit number",
); # end: 3f809d37-40f3-44b5-ad90-535838b1a816

like( # begin: e08e5532-d621-40d4-b0cc-96c159276b65
    dies( sub { clean_number "1 (223) 056-7890" } ),
    qr/exchange code cannot start with zero/,
    "invalid if exchange code starts with 0 on valid 11-digit number",
); # end: e08e5532-d621-40d4-b0cc-96c159276b65

like( # begin: 57b32f3d-696a-455c-8bf1-137b6d171cdf
    dies( sub { clean_number "1 (223) 156-7890" } ),
    qr/exchange code cannot start with one/,
    "invalid if exchange code starts with 1 on valid 11-digit number",
); # end: 57b32f3d-696a-455c-8bf1-137b6d171cdf

done_testing;
