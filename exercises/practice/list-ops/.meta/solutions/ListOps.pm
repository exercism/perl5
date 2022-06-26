package ListOps;

use strict;
use warnings;

sub map {
    my ( $func, $list ) = @_;

    my @result;
    foreach my $elem (@$list) {
        push @result, $func->($elem);
    }

    return \@result;
}

sub reduce {
    my ( $func, $list ) = @_;

    my $result = shift @$list;
    foreach my $elem (@$list) {
        $result = $func->( $result, $elem );
    }

    return $result;
}

sub length {
    my $list = shift;

    return _length( $list, 0 );
}

sub _length {
    my ( $list, $n ) = @_;

    return _length( $list, $n + 1 )
        if shift @$list;

    return $n;
}

1;
