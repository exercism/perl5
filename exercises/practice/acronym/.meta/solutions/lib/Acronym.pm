package Acronym;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<abbreviate>;

sub abbreviate ($phrase) {

    # capture letters preceded by the start of the string
    # or by a non-(letter or apostrophe)
    my @letters = $phrase =~ /(?:^|[^'a-z])\K([a-z])/ig;
    return uc join "", @letters;
}

1;
