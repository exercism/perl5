package Example;

use strict;
use warnings;

use Carp;

sub compute {
    my ($strand_a, $strand_b) = @_;

    croak "DNA strands must be of equal length"
        unless length $strand_a == length $strand_b;

    my $distance = $strand_a ^ $strand_b;
    $distance =~ s/\0//g;

    return (length $distance) - abs(length($strand_a) - length($strand_b));
}

1;
