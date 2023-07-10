package Proverb;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<proverb>;

sub proverb {
    my ($items) = @_;
    return '' unless $items->@*;
    my @proverb;

    my $last_line = "And all for the want of a $items->[0].";

    while ( @$items > 1 ) {
        push @proverb, sprintf(
            "For want of a %s the %s was lost.",
            shift @$items,
            $items->[0]
        );
    }

    return join "\n", @proverb, $last_line;
}

1;
