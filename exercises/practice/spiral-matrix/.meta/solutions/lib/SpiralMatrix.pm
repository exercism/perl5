package SpiralMatrix;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<spiral_matrix>;

sub spiral_matrix ($size) {
    my @mtx;
    push @mtx, [ (undef) x $size ] for 1 .. $size;

    my ( $x, $y, $dx, $dy ) = ( 0, 0, 0, 1 );

    for my $i ( 1 .. $size * $size ) {
        $mtx[$x][$y] = $i;
        if ( ( $x + $dx == $size || $x + $dx < 0 )
            || ( $y + $dy == $size || $y + $dy < 0 )
            || $mtx[ $x + $dx ][ $y + $dy ]
        ) {
            ( $dx, $dy ) = ( $dy, -$dx );
        }
        $x += $dx;
        $y += $dy;
    }
    return \@mtx;
}

1;
