package PigLatin;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<translate>;

sub translate {
    my ($phrase) = @_;

    return join(
        ' ',
        map {
            if (/^(?:[aeiou]|[yx][^aeiou])/) {
                "${phrase}ay";
            }
            elsif (/^(y|[^aeiou]*qu|[^aeiouy]+)(.+)/) {
                "$2${1}ay";
            }
        } split /\s+/,
        $phrase
    );

}

1;
