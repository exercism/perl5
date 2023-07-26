#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Wordy qw<answer>;

is(
    answer("What is 5?"),
    5,
    "just a number",
);

is(
    answer("What is 1 plus 1?"),
    2,
    "addition",
);

is(
    answer("What is 53 plus 2?"),
    55,
    "more addition",
);

is(
    answer("What is -1 plus -10?"),
    -11,
    "addition with negative numbers",
);

is(
    answer("What is 123 plus 45678?"),
    45801,
    "large addition",
);

is(
    answer("What is 4 minus -12?"),
    16,
    "subtraction",
);

is(
    answer("What is -3 multiplied by 25?"),
    -75,
    "multiplication",
);

is(
    answer("What is 33 divided by -3?"),
    -11,
    "division",
);

is(
    answer("What is 1 plus 1 plus 1?"),
    3,
    "multiple additions",
);

is(
    answer("What is 1 plus 5 minus -2?"),
    8,
    "addition and subtraction",
);

is(
    answer("What is 20 minus 4 minus 13?"),
    3,
    "multiple subtraction",
);

is(
    answer("What is 17 minus 6 plus 3?"),
    14,
    "subtraction then addition",
);

is(
    answer("What is 2 multiplied by -2 multiplied by 3?"),
    -12,
    "multiple multiplication",
);

is(
    answer("What is -3 plus 7 multiplied by -2?"),
    -8,
    "addition and multiplication",
);

is(
    answer("What is -12 divided by 2 divided by -3?"),
    2,
    "multiple division",
);

like(
    dies( sub { answer "What is 52 cubed?" } ),
    qr/unknown operation/,
    "unknown operation",
);

like(
    dies( sub { answer "Who is the President of the United States?" } ),
    qr/unknown operation/,
    "Non math question",
);

like(
    dies( sub { answer "What is 1 plus?" } ),
    qr/syntax error/,
    "reject problem missing an operand",
);

like(
    dies( sub { answer "What is?" } ),
    qr/syntax error/,
    "reject problem with no operands or operators",
);

like(
    dies( sub { answer "What is 1 plus plus 2?" } ),
    qr/syntax error/,
    "reject two operations in a row",
);

like(
    dies( sub { answer "What is 1 plus 2 1?" } ),
    qr/syntax error/,
    "reject two numbers in a row",
);

like(
    dies( sub { answer "What is 1 2 plus?" } ),
    qr/syntax error/,
    "reject postfix notation",
);

like(
    dies( sub { answer "What is plus 1 2?" } ),
    qr/syntax error/,
    "reject prefix notation",
);

done_testing;
