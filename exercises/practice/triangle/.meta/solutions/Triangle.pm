package Triangle;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_equilateral is_isosceles is_scalene>;

# Solution by GitHub Copilot
sub is_equilateral ($sides) {
    my $first_side = $sides->[0];
    for my $side (@$sides) {
        return 0 if $side == 0;
        return 0 if $side != $first_side;
    }
    return 1;
}

sub is_isosceles ($sides) {
    my ( $first_side, $second_side, $third_side ) = sort { $a <=> $b } @$sides;
    return 0 if $first_side + $second_side <= $third_side;
    return 1 if $first_side == $second_side || $second_side == $third_side;
    return 0;
}

sub is_scalene ($sides) {
    my ( $first_side, $second_side, $third_side ) = sort { $a <=> $b } @$sides;
    return 0 if $first_side + $second_side <= $third_side;
    return 1 if $first_side != $second_side && $second_side != $third_side;
    return 0;
}

1;
