package Example;

use strict;
use warnings;

sub compute {
    my ($strand_a, $strand_b) = @_;
    my $distance = $strand_a ^ $strand_b;
    $distance =~ s/\0//g;
    return (length $distance) - abs(length($strand_a) - length($strand_b));
}

1;
