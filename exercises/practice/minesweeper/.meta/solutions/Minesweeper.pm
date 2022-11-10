package Minesweeper;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<annotate>;

sub annotate {
    my ($minefield) = @_;
    return undef;
}

1;
