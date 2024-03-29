package BinarySearch;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<binary_search>;

sub binary_search ( $array, $value, $low = undef, $high = undef ) {

    return binary_search( $array, $value, 0, scalar( @{$array} ) - 1 ) unless defined $high;

    die 'value not in array' if $low > $high;

    my $mid   = int( ( $low + $high ) / 2 );
    my $found = $array->[$mid];

    if ( $value > $found ) {
        return binary_search( $array, $value, $mid + 1, $high );
    }
    elsif ( $value < $found ) {
        return binary_search( $array, $value, $low, $mid - 1 );
    }
    else {
        return $mid;
    }
}

1;
