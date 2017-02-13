package Example;
use strict;
use warnings;

sub hey {
    my ($text) = @_;

    return 'Fine. Be that way!'
        if $text =~ /^\s*$/;
    return 'Whoa, chill out!'
        if uc($text) eq $text and $text =~ /\p{Uppercase}/;
    return 'Sure.'
        if $text =~ /\?\s*$/;

    return 'Whatever.';
}

1;
