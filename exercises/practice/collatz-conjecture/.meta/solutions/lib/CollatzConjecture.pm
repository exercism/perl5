package CollatzConjecture;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<steps>;

sub steps ($number) {
    die 'Only positive integers are allowed' unless $number > 0;
    my $count = 0;
    while ( $number > 1 ) {
        $number = ( $number % 2 == 0 ) ? ( $number / 2 ) : ( 3 * $number + 1 );
        $count++;
    }
    return $count;
}

1;
