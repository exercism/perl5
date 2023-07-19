#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Proverb qw<proverb>;

imported_ok qw<proverb> or bail_out;

is(
    proverb( [] ),
    "",
    "zero pieces",
);

is(
    proverb( ["nail"] ),
    <<'TEXT' =~ s/\n$//r,
And all for the want of a nail.
TEXT
    "one piece",
);

is(
    proverb( [ "nail", "shoe" ] ),
    <<'TEXT' =~ s/\n$//r,
For want of a nail the shoe was lost.
And all for the want of a nail.
TEXT
    "two pieces",
);

is(
    proverb( [ "nail", "shoe", "horse" ] ),
    <<'TEXT' =~ s/\n$//r,
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.
TEXT
    "three pieces",
);

is(
    proverb( [ "nail", "shoe", "horse", "rider", "message", "battle", "kingdom" ] ),
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
);

is(
    proverb( [ "pin", "gun", "soldier", "battle" ] ),
    <<'TEXT' =~ s/\n$//r,
For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.
TEXT
    "four pieces modernized",
);

done_testing;
