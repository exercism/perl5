package Darts;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<score_dart>;

sub score_dart ( $x, $y ) {
    my $sqrt = sqrt $x**2 + $y**2;

    return 10 if $sqrt <= 1;
    return 5  if $sqrt <= 5;
    return 1  if $sqrt <= 10;
    return 0;
}

1;
