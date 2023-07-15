package Sublist;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<compare_lists>;

sub compare_lists ( $list1, $list2 ) {
    my $len1 = scalar @$list1;
    my $len2 = scalar @$list2;

    return "equal" if $len1 == $len2 && "@$list1" eq "@$list2";

    my $is_sublist   = 0;
    my $is_superlist = 0;

    for ( my $i = 0; $i <= $len2 - $len1; $i++ ) {
        if ( "@$list2[$i..$i+$len1-1]" eq "@$list1" ) {
            $is_sublist = 1;
            last;
        }
    }

    for ( my $i = 0; $i <= $len1 - $len2; $i++ ) {
        if ( "@$list1[$i..$i+$len2-1]" eq "@$list2" ) {
            $is_superlist = 1;
            last;
        }
    }

    return "sublist"   if $is_sublist;
    return "superlist" if $is_superlist;
    return "unequal";
}

1;
