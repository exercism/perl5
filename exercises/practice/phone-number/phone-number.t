#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use PhoneNumber qw<clean_number>;

is(
    clean_number("(223) 456-7890"),
    "2234567890",
    "cleans the number",
);

is(
    clean_number("223.456.7890"),
    "2234567890",
    "cleans numbers with dots",
);

is(
    clean_number("223 456   7890   "),
    "2234567890",
    "cleans numbers with multiple spaces",
);

like(
    dies( sub { clean_number "123456789" } ),
    qr/must not be fewer than 10 digits/,
    "invalid when 9 digits",
);

like(
    dies( sub { clean_number "22234567890" } ),
    qr/11 digits must start with 1/,
    "invalid when 11 digits does not start with a 1",
);

is(
    clean_number("12234567890"),
    "2234567890",
    "valid when 11 digits and starting with 1",
);

is(
    clean_number("+1 (223) 456-7890"),
    "2234567890",
    "valid when 11 digits and starting with 1 even with punctuation",
);

like(
    dies( sub { clean_number "321234567890" } ),
    qr/must not be greater than 11 digits/,
    "invalid when more than 11 digits",
);

like(
    dies( sub { clean_number "523-abc-7890" } ),
    qr/letters not permitted/,
    "invalid with letters",
);

like(
    dies( sub { clean_number "523-\@:!-7890" } ),
    qr/punctuations not permitted/,
    "invalid with punctuations",
);

like(
    dies( sub { clean_number "(023) 456-7890" } ),
    qr/area code cannot start with zero/,
    "invalid if area code starts with 0",
);

like(
    dies( sub { clean_number "(123) 456-7890" } ),
    qr/area code cannot start with one/,
    "invalid if area code starts with 1",
);

like(
    dies( sub { clean_number "(223) 056-7890" } ),
    qr/exchange code cannot start with zero/,
    "invalid if exchange code starts with 0",
);

like(
    dies( sub { clean_number "(223) 156-7890" } ),
    qr/exchange code cannot start with one/,
    "invalid if exchange code starts with 1",
);

like(
    dies( sub { clean_number "1 (023) 456-7890" } ),
    qr/area code cannot start with zero/,
    "invalid if area code starts with 0 on valid 11-digit number",
);

like(
    dies( sub { clean_number "1 (123) 456-7890" } ),
    qr/area code cannot start with one/,
    "invalid if area code starts with 1 on valid 11-digit number",
);

like(
    dies( sub { clean_number "1 (223) 056-7890" } ),
    qr/exchange code cannot start with zero/,
    "invalid if exchange code starts with 0 on valid 11-digit number",
);

like(
    dies( sub { clean_number "1 (223) 156-7890" } ),
    qr/exchange code cannot start with one/,
    "invalid if exchange code starts with 1 on valid 11-digit number",
);

done_testing;
