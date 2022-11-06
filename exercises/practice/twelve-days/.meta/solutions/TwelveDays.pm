package TwelveDays;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<recite>;

my %parts = (
    1 => {
        nth   => 'first',
        items => 'a Partridge in a Pear Tree',
    },
    2 => {
        nth   => 'second',
        items => 'two Turtle Doves',
    },
    3 => {
        nth   => 'third',
        items => 'three French Hens',
    },
    4 => {
        nth   => 'fourth',
        items => 'four Calling Birds',
    },
    5 => {
        nth   => 'fifth',
        items => 'five Gold Rings',
    },
    6 => {
        nth   => 'sixth',
        items => 'six Geese-a-Laying',
    },
    7 => {
        nth   => 'seventh',
        items => 'seven Swans-a-Swimming',
    },
    8 => {
        nth   => 'eighth',
        items => 'eight Maids-a-Milking',
    },
    9 => {
        nth   => 'ninth',
        items => 'nine Ladies Dancing',
    },
    10 => {
        nth   => 'tenth',
        items => 'ten Lords-a-Leaping',
    },
    11 => {
        nth   => 'eleventh',
        items => 'eleven Pipers Piping',
    },
    12 => {
        nth   => 'twelfth',
        items => 'twelve Drummers Drumming',
    },
);

sub recite {
    join "\n", map {
        "On the $parts{$_}{nth} day of Christmas my true love gave to me: "
            . (
            join( ', ', map { $parts{$_}{items} } reverse 2 .. $_ )
                . ', and '
            ) x !!( $_ > 1 )
            . "$parts{1}{items}."
    } $_[0]->{start} .. $_[0]->{end};
}

1;
