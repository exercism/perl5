#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Isogram qw<is_isogram>;

is( # begin: a0e97d2d-669e-47c7-8134-518a1e2c4555
    is_isogram(""),
    T, # True
    "empty string"
); # end: a0e97d2d-669e-47c7-8134-518a1e2c4555

is( # begin: 9a001b50-f194-4143-bc29-2af5ec1ef652
    is_isogram("isogram"),
    T, # True
    "isogram with only lower case characters"
); # end: 9a001b50-f194-4143-bc29-2af5ec1ef652

is( # begin: 8ddb0ca3-276e-4f8b-89da-d95d5bae78a4
    is_isogram("eleven"),
    DF, # Defined but False
    "word with one duplicated character"
); # end: 8ddb0ca3-276e-4f8b-89da-d95d5bae78a4

is( # begin: 6450b333-cbc2-4b24-a723-0b459b34fe18
    is_isogram("zzyzx"),
    DF, # Defined but False
    "word with one duplicated character from the end of the alphabet"
); # end: 6450b333-cbc2-4b24-a723-0b459b34fe18

is( # begin: a15ff557-dd04-4764-99e7-02cc1a385863
    is_isogram("subdermatoglyphic"),
    T, # True
    "longest reported english isogram"
); # end: a15ff557-dd04-4764-99e7-02cc1a385863

is( # begin: f1a7f6c7-a42f-4915-91d7-35b2ea11c92e
    is_isogram("Alphabet"),
    DF, # Defined but False
    "word with duplicated character in mixed case"
); # end: f1a7f6c7-a42f-4915-91d7-35b2ea11c92e

is( # begin: 14a4f3c1-3b47-4695-b645-53d328298942
    is_isogram("alphAbet"),
    DF, # Defined but False
    "word with duplicated character in mixed case, lowercase first"
); # end: 14a4f3c1-3b47-4695-b645-53d328298942

is( # begin: 423b850c-7090-4a8a-b057-97f1cadd7c42
    is_isogram("thumbscrew-japingly"),
    T, # True
    "hypothetical isogrammic word with hyphen"
); # end: 423b850c-7090-4a8a-b057-97f1cadd7c42

is( # begin: 93dbeaa0-3c5a-45c2-8b25-428b8eacd4f2
    is_isogram("thumbscrew-jappingly"),
    DF, # Defined but False
    "hypothetical word with duplicated character following hyphen"
); # end: 93dbeaa0-3c5a-45c2-8b25-428b8eacd4f2

is( # begin: 36b30e5c-173f-49c6-a515-93a3e825553f
    is_isogram("six-year-old"),
    T, # True
    "isogram with duplicated hyphen"
); # end: 36b30e5c-173f-49c6-a515-93a3e825553f

is( # begin: cdabafa0-c9f4-4c1f-b142-689c6ee17d93
    is_isogram("Emily Jung Schwartzkopf"),
    T, # True
    "made-up name that is an isogram"
); # end: cdabafa0-c9f4-4c1f-b142-689c6ee17d93

is( # begin: 5fc61048-d74e-48fd-bc34-abfc21552d4d
    is_isogram("accentor"),
    DF, # Defined but False
    "duplicated character in the middle"
); # end: 5fc61048-d74e-48fd-bc34-abfc21552d4d

is( # begin: 310ac53d-8932-47bc-bbb4-b2b94f25a83e
    is_isogram("angola"),
    DF, # Defined but False
    "same first and last characters"
); # end: 310ac53d-8932-47bc-bbb4-b2b94f25a83e

is( # begin: 0d0b8644-0a1e-4a31-a432-2b3ee270d847
    is_isogram("up-to-date"),
    DF, # Defined but False
    "word with duplicated character and with two hyphens"
); # end: 0d0b8644-0a1e-4a31-a432-2b3ee270d847

done_testing;
