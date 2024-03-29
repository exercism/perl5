package PigLatin;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<translate>;

sub translate ($phrase) {
    return join( ' ', map {
            if (/^(?:[aeiou]|[yx][^aeiou])/) {
                "${phrase}ay";
            }
            elsif (/^(y|[^aeiou]*qu|[^aeiouy]+)(.+)/) {
                "$2${1}ay";
            }
    } split /\s+/, $phrase );

}

1;
