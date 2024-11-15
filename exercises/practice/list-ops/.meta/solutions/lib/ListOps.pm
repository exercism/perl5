package ListOps;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

sub append ( $list1, $list2 ) {
    return [ @$list1, @$list2 ];
}

sub foldl ( $func, $initial, $list ) {
    my $a = $initial;
    foreach my $e (@$list) {
        $a = $func->( $a, $e );
    }
    return $a;
}

# all the rest can be implemented with append and foldl
sub concat ($lists) {
    foldl sub ( $acc, $list ) { append $acc, $list }, [], $lists;
}

sub map :prototype(&$) ( $func, $list ) {
    my $f = sub ( $acc, $el ) {
        local $_ = $el;
        append $acc, [ $func->() ];
    };
    foldl $f, [], $list;
}

sub filter :prototype(&$) ( $func, $list ) {
    my $f = sub ( $acc, $el ) {
        local $_ = $el;
        $acc = append $acc, [$el] if $func->();
        $acc;
    };
    foldl $f, [], $list;
}

sub length ($list) {
    foldl sub ( $len, $el ) { $len + 1 }, 0, $list;
}

sub reverse ($list) {
    my $f = sub ( $acc, $el ) { append [$el], $acc };
    foldl $f, [], $list;
}

sub foldr ( $func, $initial, $list ) {
    foldl $func, $initial, ListOps::reverse $list;
}

1;
