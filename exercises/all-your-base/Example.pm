package Example;

use strict;
use warnings;

use Carp;

sub convert_base {
    my( $digits, $in_base, $out_base ) = @_;

    croak "base must be greater than 1" if grep { $_ <= 1 } $in_base, $out_base;

    croak 'negative digit not allowed' if grep { $_ < 0 } @$digits;

    croak 'digit equal of greater than the base' if grep { $_ >= $in_base } @$digits;

    my $number = 0;
    $number = $number * $in_base + $_ for @$digits;

    my @output;

    while( $number ) {
        unshift @output, $number % $out_base;
        $number = int $number / $out_base;
    }

    push @output, 0 unless @output;

    return \@output;
}

1;
