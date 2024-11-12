package RotationalCipher;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<rotate>;

# from https://perldoc.pl/perlop#tr/SEARCHLIST/REPLACEMENTLIST/cdsr
# > Because the transliteration table is built at compile time, neither the
# > SEARCHLIST nor the REPLACEMENTLIST are subjected to double quote
# > interpolation. That means that if you want to use variables, you must
# > use an eval()

sub rotate ( $text, $shift ) {
    my $alpha = 'abcdefghijklmnopqrstuvwxyz';
    my $rotated = substr( $alpha, $shift % 26 ) . substr( $alpha, 0, $shift % 26 );
    $alpha   .= uc $alpha;
    $rotated .= uc $rotated;

    return eval "\$text =~ tr/$alpha/$rotated/r";
}

1;
