#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use ReverseString qw<str_reverse>;

is( # begin: c3b7d806-dced-49ee-8543-933fd1719b1c
    str_reverse(""),
    "",
    "an empty string",
); # end: c3b7d806-dced-49ee-8543-933fd1719b1c

is( # begin: 01ebf55b-bebb-414e-9dec-06f7bb0bee3c
    str_reverse("robot"),
    "tobor",
    "a word",
); # end: 01ebf55b-bebb-414e-9dec-06f7bb0bee3c

is( # begin: 0f7c07e4-efd1-4aaa-a07a-90b49ce0b746
    str_reverse("Ramen"),
    "nemaR",
    "a capitalized word",
); # end: 0f7c07e4-efd1-4aaa-a07a-90b49ce0b746

is( # begin: 71854b9c-f200-4469-9f5c-1e8e5eff5614
    str_reverse("I'm hungry!"),
    "!yrgnuh m'I",
    "a sentence with punctuation",
); # end: 71854b9c-f200-4469-9f5c-1e8e5eff5614

is( # begin: 1f8ed2f3-56f3-459b-8f3e-6d8d654a1f6c
    str_reverse("racecar"),
    "racecar",
    "a palindrome",
); # end: 1f8ed2f3-56f3-459b-8f3e-6d8d654a1f6c

is( # begin: b9e7dec1-c6df-40bd-9fa3-cd7ded010c4c
    str_reverse("drawer"),
    "reward",
    "an even-sized word",
); # end: b9e7dec1-c6df-40bd-9fa3-cd7ded010c4c

is( # begin: 1bed0f8a-13b0-4bd3-9d59-3d0593326fa2
    str_reverse("\x{5B50}\x{732B}"),
    "\x{732B}\x{5B50}",
    "wide characters",
); # end: 1bed0f8a-13b0-4bd3-9d59-3d0593326fa2

is( # begin: 93d7e1b8-f60f-4f3c-9559-4056e10d2ead
    str_reverse("Wu\x{308}rstchenstand"),
    "dnatsnehctsru\x{308}W",
    "grapheme cluster with pre-combined form",
); # end: 93d7e1b8-f60f-4f3c-9559-4056e10d2ead

is( # begin: 1028b2c1-6763-4459-8540-2da47ca512d9
    str_reverse("\x{E1C}\x{E39}\x{E49}\x{E40}\x{E02}\x{E35}\x{E22}\x{E19}\x{E42}\x{E1B}\x{E23}\x{E41}\x{E01}\x{E23}\x{E21}"),
    "\x{E21}\x{E23}\x{E01}\x{E41}\x{E23}\x{E1B}\x{E42}\x{E19}\x{E22}\x{E02}\x{E35}\x{E40}\x{E1C}\x{E39}\x{E49}",
    "grapheme clusters",
); # end: 1028b2c1-6763-4459-8540-2da47ca512d9

done_testing;
