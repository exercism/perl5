package Minesweeper;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<annotate>;

sub annotate ($input) {
    my @lines  = split /\n/, $input;
    my $height = scalar @lines;
    my $width  = length $lines[0];
    my @grid   = map { [ split // ] } @lines;

    for my $y ( 0 .. $height - 1 ) {
        for my $x ( 0 .. $width - 1 ) {
            next if $grid[$y][$x] eq '*';
            my $count = 0;
            for my $dy ( -1 .. 1 ) {
                for my $dx ( -1 .. 1 ) {
                    next if $dx == 0 && $dy == 0;
                    my $nx = $x + $dx;
                    my $ny = $y + $dy;
                    next if $nx < 0 || $nx >= $width || $ny < 0 || $ny >= $height;
                    $count++ if $grid[$ny][$nx] eq '*';
                }
            }
            $grid[$y][$x] = $count || ' ';
        }
    }

    return join "\n", map { join '', @$_ } @grid;
}

1;
