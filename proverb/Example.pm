package Example;

use strict;
use warnings;

sub proverb {
    my ($items, $qualifier) = @_;
    my @proverb;

    $qualifier .= " " if $qualifier;

    my $last_line = "And all for the want of a ${qualifier}$items->[0].";

    while ( @$items > 1 ) {
        push @proverb
             => sprintf("For want of a %s the %s was lost.", shift @$items, $items->[0]);
    }

    return join "\n" => (@proverb, $last_line)
}

__PACKAGE__;
