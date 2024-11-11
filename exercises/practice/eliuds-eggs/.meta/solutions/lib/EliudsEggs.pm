package EliudsEggs;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<egg_count>;

sub egg_count ($number) {
    my $count = 0;
    while ( $number > 0 ) {
        $count += $number & 1;
        $number >>= 1;
    }
    return $count;
}

1;
