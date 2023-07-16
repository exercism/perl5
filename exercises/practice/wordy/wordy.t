#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Wordy qw<answer>;

imported_ok qw<answer> or bail_out;

is( # begin: 88bf4b28-0de3-4883-93c7-db1b14aa806e
    answer("What is 5?"),
    5,
    "just a number",
); # end: 88bf4b28-0de3-4883-93c7-db1b14aa806e

is( # begin: bb8c655c-cf42-4dfc-90e0-152fcfd8d4e0
    answer("What is 1 plus 1?"),
    2,
    "addition",
); # end: bb8c655c-cf42-4dfc-90e0-152fcfd8d4e0

is( # begin: 79e49e06-c5ae-40aa-a352-7a3a01f70015
    answer("What is 53 plus 2?"),
    55,
    "more addition",
); # end: 79e49e06-c5ae-40aa-a352-7a3a01f70015

is( # begin: b345dbe0-f733-44e1-863c-5ae3568f3803
    answer("What is -1 plus -10?"),
    -11,
    "addition with negative numbers",
); # end: b345dbe0-f733-44e1-863c-5ae3568f3803

is( # begin: cd070f39-c4cc-45c4-97fb-1be5e5846f87
    answer("What is 123 plus 45678?"),
    45801,
    "large addition",
); # end: cd070f39-c4cc-45c4-97fb-1be5e5846f87

is( # begin: 0d86474a-cd93-4649-a4fa-f6109a011191
    answer("What is 4 minus -12?"),
    16,
    "subtraction",
); # end: 0d86474a-cd93-4649-a4fa-f6109a011191

is( # begin: 30bc8395-5500-4712-a0cf-1d788a529be5
    answer("What is -3 multiplied by 25?"),
    -75,
    "multiplication",
); # end: 30bc8395-5500-4712-a0cf-1d788a529be5

is( # begin: 34c36b08-8605-4217-bb57-9a01472c427f
    answer("What is 33 divided by -3?"),
    -11,
    "division",
); # end: 34c36b08-8605-4217-bb57-9a01472c427f

is( # begin: da6d2ce4-fb94-4d26-8f5f-b078adad0596
    answer("What is 1 plus 1 plus 1?"),
    3,
    "multiple additions",
); # end: da6d2ce4-fb94-4d26-8f5f-b078adad0596

is( # begin: 7fd74c50-9911-4597-be09-8de7f2fea2bb
    answer("What is 1 plus 5 minus -2?"),
    8,
    "addition and subtraction",
); # end: 7fd74c50-9911-4597-be09-8de7f2fea2bb

is( # begin: b120ffd5-bad6-4e22-81c8-5512e8faf905
    answer("What is 20 minus 4 minus 13?"),
    3,
    "multiple subtraction",
); # end: b120ffd5-bad6-4e22-81c8-5512e8faf905

is( # begin: 4f4a5749-ef0c-4f60-841f-abcfaf05d2ae
    answer("What is 17 minus 6 plus 3?"),
    14,
    "subtraction then addition",
); # end: 4f4a5749-ef0c-4f60-841f-abcfaf05d2ae

is( # begin: 312d908c-f68f-42c9-aa75-961623cc033f
    answer("What is 2 multiplied by -2 multiplied by 3?"),
    -12,
    "multiple multiplication",
); # end: 312d908c-f68f-42c9-aa75-961623cc033f

is( # begin: 38e33587-8940-4cc1-bc28-bfd7e3966276
    answer("What is -3 plus 7 multiplied by -2?"),
    -8,
    "addition and multiplication",
); # end: 38e33587-8940-4cc1-bc28-bfd7e3966276

is( # begin: 3c854f97-9311-46e8-b574-92b60d17d394
    answer("What is -12 divided by 2 divided by -3?"),
    2,
    "multiple division",
); # end: 3c854f97-9311-46e8-b574-92b60d17d394

like( # begin: 3ad3e433-8af7-41ec-aa9b-97b42ab49357
    dies( sub { answer "What is 52 cubed?" } ),
    qr/unknown operation/,
    "unknown operation",
); # end: 3ad3e433-8af7-41ec-aa9b-97b42ab49357

like( # begin: 8a7e85a8-9e7b-4d46-868f-6d759f4648f8
    dies( sub { answer "Who is the President of the United States?" } ),
    qr/unknown operation/,
    "Non math question",
); # end: 8a7e85a8-9e7b-4d46-868f-6d759f4648f8

like( # begin: 42d78b5f-dbd7-4cdb-8b30-00f794bb24cf
    dies( sub { answer "What is 1 plus?" } ),
    qr/syntax error/,
    "reject problem missing an operand",
); # end: 42d78b5f-dbd7-4cdb-8b30-00f794bb24cf

like( # begin: c2c3cbfc-1a72-42f2-b597-246e617e66f5
    dies( sub { answer "What is?" } ),
    qr/syntax error/,
    "reject problem with no operands or operators",
); # end: c2c3cbfc-1a72-42f2-b597-246e617e66f5

like( # begin: 4b3df66d-6ed5-4c95-a0a1-d38891fbdab6
    dies( sub { answer "What is 1 plus plus 2?" } ),
    qr/syntax error/,
    "reject two operations in a row",
); # end: 4b3df66d-6ed5-4c95-a0a1-d38891fbdab6

like( # begin: 6abd7a50-75b4-4665-aa33-2030fd08bab1
    dies( sub { answer "What is 1 plus 2 1?" } ),
    qr/syntax error/,
    "reject two numbers in a row",
); # end: 6abd7a50-75b4-4665-aa33-2030fd08bab1

like( # begin: 10a56c22-e0aa-405f-b1d2-c642d9c4c9de
    dies( sub { answer "What is 1 2 plus?" } ),
    qr/syntax error/,
    "reject postfix notation",
); # end: 10a56c22-e0aa-405f-b1d2-c642d9c4c9de

like( # begin: 0035bc63-ac43-4bb5-ad6d-e8651b7d954e
    dies( sub { answer "What is plus 1 2?" } ),
    qr/syntax error/,
    "reject prefix notation",
); # end: 0035bc63-ac43-4bb5-ad6d-e8651b7d954e

done_testing;
