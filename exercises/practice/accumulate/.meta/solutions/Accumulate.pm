package Accumulate;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<accumulate>;

sub accumulate {
    my ( $list, $func ) = @_;
    my @results;

    for ( @{$list} ) {
        push @results, $func->($_);
    }

    return \@results;
}

1;
