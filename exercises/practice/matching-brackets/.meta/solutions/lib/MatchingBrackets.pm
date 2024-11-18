package MatchingBrackets;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<has_matching_brackets>;

sub has_matching_brackets ($text) {
    my @stack = ();
    my %pairs = ( ')' => '(', ']' => '[', '}' => '{' );

    my $is_open  = sub { grep { $_[0] eq $_ } values %pairs; };
    my $is_close = sub { exists $pairs{ $_[0] }; };

    foreach my $char ( split '', $text ) {
        if ( $is_open->($char) ) {
            push @stack, $char;
        }
        elsif ( $is_close->($char) ) {
            return 0 if @stack == 0 || pop(@stack) ne $pairs{$char};
        }
    }
    return @stack == 0;
}

1;
