package Accumulate;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<accumulate>;

sub accumulate ( $list, $func ) {
    my @results;

    for ( @{$list} ) {
        push @results, $func->($_);
    }

    return \@results;
}

1;
