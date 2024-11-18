package ReverseString;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<str_reverse>;

sub str_reverse ($text) {
    my $rev = '';

    # \X matches "extended grapheme clusters"
    my @chars = $text =~ /(\X)/g;

    # the obvious boring solution
    # $rev = reverse $text

    # iterating
    # foreach my $char (@chars) {
    #   $rev = $char . $rev;
    # }

    # iterating tersely
    # $rev = $_ . $rev for @chars;

    # iterating functionally
    # use List::Util qw(reduce);
    # $rev = reduce {$b . $a} '', @chars;

    # fewer iterations
    for ( my ( $i, $j ) = ( 0, $#chars ); $i < $j; $i++, $j-- ) {
        ( $chars[$i], $chars[$j] ) = ( $chars[$j], $chars[$i] );
    }
    $rev = join '', @chars;

    return $rev;
}

1;
