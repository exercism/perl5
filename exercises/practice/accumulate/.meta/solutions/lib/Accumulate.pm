package Accumulate;

use v5.40;

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
