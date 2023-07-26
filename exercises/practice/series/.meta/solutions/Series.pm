package Series;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<slices>;

# Solution by GitHub Copilot
sub slices ( $series, $slice_length ) {
    die "slice length cannot be zero"
        if $slice_length == 0;

    die "slice length cannot be negative"
        if $slice_length < 0;

    die "series cannot be empty"
        if length $series == 0;

    die "slice length cannot be greater than series length"
        if $slice_length > length $series;

    my @slices;
    for ( my $i = 0; $i <= length($series) - $slice_length; $i++ ) {
        push @slices, substr( $series, $i, $slice_length );
    }

    return \@slices;
}

1;
