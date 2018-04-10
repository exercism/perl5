package Triangle;

use strict;
use warnings;
use 5.010; # use smart_match ~~
no if $] >= 5.018, warnings => 'experimental';

sub triangle {
    my $size = shift;
    my @rows = ([1],);

    foreach my $i (1..$size) {
       my ($prev, $next) = $rows[$i-1];
       for my $j (0..@$prev) {
           $next->[$j] += $prev->[$j-1] if $j > 0;
           $next->[$j] += $prev->[$j]   if $j < @$prev;
       }
       push @rows => $next;
    }
    return [ map { join q{ } => @$_ } @rows ];
}

sub is_triangle {
    my $aaa = shift;
    my $bbb = triangle(@$aaa-1);

    return int(@$aaa ~~ @$bbb); # JSON::true is 1 JSON::false is 0
}

sub row {
    my $n = shift;
    return (triangle($n))->[$n];
}

__PACKAGE__;
