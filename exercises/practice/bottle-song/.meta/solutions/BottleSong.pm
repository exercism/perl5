package BottleSong;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<sing>;

my %numbers = (
    1  => 'one',
    2  => 'two',
    3  => 'three',
    4  => 'four',
    5  => 'five',
    6  => 'six',
    7  => 'seven',
    8  => 'eight',
    9  => 'nine',
    10 => 'ten',
);

sub sing {
    my ( $bottles, $verses ) = @_;
    my @verses;
    for ( 1 .. $verses ) {
        my $s = $bottles > 1 ? 's' : '';
        push @verses,
            ucfirst(
            "$numbers{$bottles} green bottle$s hanging on the wall,\n") x 2
            . "And if one green bottle should accidentally fall,\n"
            . "There'll be "
            . ( $numbers{ --$bottles } || 'no' )
            . ' green bottle'
            . ( $bottles == 1 ? '' : 's' )
            . ' hanging on the wall.';
    }
    return join "\n\n", @verses;
}

1;
