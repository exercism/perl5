package Yacht::Category;

use strict;
use warnings;
use Readonly;

my $n = 1;
Readonly our $ONES            => $n++;
Readonly our $TWOS            => $n++;
Readonly our $THREES          => $n++;
Readonly our $FOURS           => $n++;
Readonly our $FIVES           => $n++;
Readonly our $SIXES           => $n++;
Readonly our $FULL_HOUSE      => $n++;
Readonly our $FOUR_OF_A_KIND  => $n++;
Readonly our $LITTLE_STRAIGHT => $n++;
Readonly our $BIG_STRAIGHT    => $n++;
Readonly our $YACHT           => $n++;
Readonly our $CHOICE          => $n++;

1;
