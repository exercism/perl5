package Matrix;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<extract_row extract_column>;

sub extract_row ( $matrix, $row ) {
    return [ split / /, [ split /\n/, $matrix ]->[ $row - 1 ] ];
}

sub extract_column ( $matrix, $column ) {
    return [ map { [ split / /, $_ ]->[ $column - 1 ] } split /\n/, $matrix ];
}

1;
