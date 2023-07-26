package SaddlePoints;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<saddle_points>;

sub saddle_points ($matrix) {
    my $rows = $matrix->@*;
    my $cols = $matrix->[0]->@*;

    my @saddle_points;
    for my $c ( 0 .. $cols - 1 ) {
        for my $r ( 0 .. $rows - 1 ) {
            my $element = $matrix->[$r][$c];

            # Find max value in row
            my $is_max_in_row = 1;
            for my $col ( 0 .. $cols - 1 ) {
                $is_max_in_row = 0 if $matrix->[$r][$col] > $element;
            }

            # Find min value in column
            my $is_min_in_col = 1;
            for my $row ( 0 .. $rows - 1 ) {
                $is_min_in_col = 0 if $matrix->[$row][$c] < $element;
            }

            if ( $is_max_in_row && $is_min_in_col ) {
                push @saddle_points, { row => $r + 1, column => $c + 1 };
            }
        }
    }

    return \@saddle_points;
}

1;
