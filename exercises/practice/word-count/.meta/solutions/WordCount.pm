package WordCount;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<count_words>;

sub count_words {
    my ($sentence) = @_;

    my $words = lc($sentence)
        =~ s/\s+/ /gr # Any whitespace character becomes a space
        =~ s/([a-z0-9]+[a-z0-9']*[a-z0-9]+)/ $1 /gr # Space separate words that might have apostrophes
        =~ s/[^a-z0-9']/ /gr; # Remove unwanted characters

    my %bag;
    for my $word ( split / +/, $words ) {
        if ( length $word && $word ne q{'} ) {
            $bag{$word}++;
        }
    }

    return \%bag;
}

1;
