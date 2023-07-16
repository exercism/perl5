#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Proverb qw<proverb>;

imported_ok qw<proverb> or bail_out;

is(    # begin: e974b73e-7851-484f-8d6d-92e07fe742fc
    proverb( [] ),
    "",
    "zero pieces",
);     # end: e974b73e-7851-484f-8d6d-92e07fe742fc

is(    # begin: 2fcd5f5e-8b82-4e74-b51d-df28a5e0faa4
    proverb( ["nail"] ),
    <<'TEXT' =~ s/\n$//r,
And all for the want of a nail.
TEXT
    "one piece",
);     # end: 2fcd5f5e-8b82-4e74-b51d-df28a5e0faa4

is(    # begin: d9d0a8a1-d933-46e2-aa94-eecf679f4b0e
    proverb( [ "nail", "shoe" ] ),
    <<'TEXT' =~ s/\n$//r,
For want of a nail the shoe was lost.
And all for the want of a nail.
TEXT
    "two pieces",
);     # end: d9d0a8a1-d933-46e2-aa94-eecf679f4b0e

is(    # begin: c95ef757-5e94-4f0d-a6cb-d2083f5e5a83
    proverb( [ "nail", "shoe", "horse" ] ),
    <<'TEXT' =~ s/\n$//r,
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.
TEXT
    "three pieces",
);     # end: c95ef757-5e94-4f0d-a6cb-d2083f5e5a83

is(    # begin: 433fb91c-35a2-4d41-aeab-4de1e82b2126
    proverb(
        [ "nail", "shoe", "horse", "rider", "message", "battle", "kingdom" ]
    ),
    <<'TEXT' =~ s/\n$//r,
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
TEXT
    "full proverb",
);    # end: 433fb91c-35a2-4d41-aeab-4de1e82b2126

is(   # begin: c1eefa5a-e8d9-41c7-91d4-99fab6d6b9f7
    proverb( [ "pin", "gun", "soldier", "battle" ] ),
    <<'TEXT' =~ s/\n$//r,
For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.
TEXT
    "four pieces modernized",
);    # end: c1eefa5a-e8d9-41c7-91d4-99fab6d6b9f7

done_testing;
