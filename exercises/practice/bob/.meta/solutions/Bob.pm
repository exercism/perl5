# Declare package 'Bob'
package Bob;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<hey>;

sub hey ($text) {
    if ( uc($text) eq $text && $text =~ /\p{Uppercase}/ ) {
        return 'Calm down, I know what I\'m doing!' if $text =~ /\?\s*$/;
        return 'Whoa, chill out!';
    }
    return 'Fine. Be that way!' if $text =~ /^\s*$/;
    return 'Sure.'              if $text =~ /\?\s*$/;
    return 'Whatever.';
}

1;
