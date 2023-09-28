#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5"; # Find modules in the same dir as this file.

use Bob qw<hey>;

is( # begin: e162fead-606f-437a-a166-d051915cea8e
    hey("Tom-ay-to, tom-aaaah-to."),
    "Whatever.",
    "stating something",
); # end: e162fead-606f-437a-a166-d051915cea8e

is( # begin: 73a966dc-8017-47d6-bb32-cf07d1a5fcd9
    hey("WATCH OUT!"),
    "Whoa, chill out!",
    "shouting",
); # end: 73a966dc-8017-47d6-bb32-cf07d1a5fcd9

is( # begin: d6c98afd-df35-4806-b55e-2c457c3ab748
    hey("FCECDFCAAB"),
    "Whoa, chill out!",
    "shouting gibberish",
); # end: d6c98afd-df35-4806-b55e-2c457c3ab748

is( # begin: 8a2e771d-d6f1-4e3f-b6c6-b41495556e37
    hey("Does this cryogenic chamber make me look fat?"),
    "Sure.",
    "asking a question",
); # end: 8a2e771d-d6f1-4e3f-b6c6-b41495556e37

is( # begin: 81080c62-4e4d-4066-b30a-48d8d76920d9
    hey("You are, what, like 15?"),
    "Sure.",
    "asking a numeric question",
); # end: 81080c62-4e4d-4066-b30a-48d8d76920d9

is( # begin: 2a02716d-685b-4e2e-a804-2adaf281c01e
    hey("fffbbcbeab?"),
    "Sure.",
    "asking gibberish",
); # end: 2a02716d-685b-4e2e-a804-2adaf281c01e

is( # begin: c02f9179-ab16-4aa7-a8dc-940145c385f7
    hey("Hi there!"),
    "Whatever.",
    "talking forcefully",
); # end: c02f9179-ab16-4aa7-a8dc-940145c385f7

is( # begin: 153c0e25-9bb5-4ec5-966e-598463658bcd
    hey("It's OK if you don't want to go work for NASA."),
    "Whatever.",
    "using acronyms in regular speech",
); # end: 153c0e25-9bb5-4ec5-966e-598463658bcd

is( # begin: a5193c61-4a92-4f68-93e2-f554eb385ec6
    hey("WHAT'S GOING ON?"),
    "Calm down, I know what I'm doing!",
    "forceful question",
); # end: a5193c61-4a92-4f68-93e2-f554eb385ec6

is( # begin: a20e0c54-2224-4dde-8b10-bd2cdd4f61bc
    hey("1, 2, 3 GO!"),
    "Whoa, chill out!",
    "shouting numbers",
); # end: a20e0c54-2224-4dde-8b10-bd2cdd4f61bc

is( # begin: f7bc4b92-bdff-421e-a238-ae97f230ccac
    hey("1, 2, 3"),
    "Whatever.",
    "no letters",
); # end: f7bc4b92-bdff-421e-a238-ae97f230ccac

is( # begin: bb0011c5-cd52-4a5b-8bfb-a87b6283b0e2
    hey("4?"),
    "Sure.",
    "question with no letters",
); # end: bb0011c5-cd52-4a5b-8bfb-a87b6283b0e2

is( # begin: 496143c8-1c31-4c01-8a08-88427af85c66
    hey("ZOMG THE %^*\@#\$(*^ ZOMBIES ARE COMING!!11!!1!"),
    "Whoa, chill out!",
    "shouting with special characters",
); # end: 496143c8-1c31-4c01-8a08-88427af85c66

is( # begin: e6793c1c-43bd-4b8d-bc11-499aea73925f
    hey("I HATE THE DENTIST"),
    "Whoa, chill out!",
    "shouting with no exclamation mark",
); # end: e6793c1c-43bd-4b8d-bc11-499aea73925f

is( # begin: aa8097cc-c548-4951-8856-14a404dd236a
    hey("Ending with ? means a question."),
    "Whatever.",
    "statement containing question mark",
); # end: aa8097cc-c548-4951-8856-14a404dd236a

is( # begin: 9bfc677d-ea3a-45f2-be44-35bc8fa3753e
    hey(":) ?"),
    "Sure.",
    "non-letters with question",
); # end: 9bfc677d-ea3a-45f2-be44-35bc8fa3753e

is( # begin: 8608c508-f7de-4b17-985b-811878b3cf45
    hey("Wait! Hang on. Are you going to be OK?"),
    "Sure.",
    "prattling on",
); # end: 8608c508-f7de-4b17-985b-811878b3cf45

is( # begin: bc39f7c6-f543-41be-9a43-fd1c2f753fc0
    hey(""),
    "Fine. Be that way!",
    "silence",
); # end: bc39f7c6-f543-41be-9a43-fd1c2f753fc0

is( # begin: d6c47565-372b-4b09-b1dd-c40552b8378b
    hey("          "),
    "Fine. Be that way!",
    "prolonged silence",
); # end: d6c47565-372b-4b09-b1dd-c40552b8378b

is( # begin: 4428f28d-4100-4d85-a902-e5a78cb0ecd3
    hey("\t\t\t\t\t\t\t\t\t\t"),
    "Fine. Be that way!",
    "alternate silence",
); # end: 4428f28d-4100-4d85-a902-e5a78cb0ecd3

is( # begin: 66953780-165b-4e7e-8ce3-4bcb80b6385a
    hey("\nDoes this cryogenic chamber make me look fat?\nNo."),
    "Whatever.",
    "multiple line question",
); # end: 66953780-165b-4e7e-8ce3-4bcb80b6385a

is( # begin: 5371ef75-d9ea-4103-bcfa-2da973ddec1b
    hey("         hmmmmmmm..."),
    "Whatever.",
    "starting with whitespace",
); # end: 5371ef75-d9ea-4103-bcfa-2da973ddec1b

is( # begin: 05b304d6-f83b-46e7-81e0-4cd3ca647900
    hey("Okay if like my  spacebar  quite a bit?   "),
    "Sure.",
    "ending with whitespace",
); # end: 05b304d6-f83b-46e7-81e0-4cd3ca647900

is( # begin: 72bd5ad3-9b2f-4931-a988-dce1f5771de2
    hey("\n\r \t"),
    "Fine. Be that way!",
    "other whitespace",
); # end: 72bd5ad3-9b2f-4931-a988-dce1f5771de2

is( # begin: 12983553-8601-46a8-92fa-fcaa3bc4a2a0
    hey("This is a statement ending with whitespace      "),
    "Whatever.",
    "non-question ending with whitespace",
); # end: 12983553-8601-46a8-92fa-fcaa3bc4a2a0

done_testing;
