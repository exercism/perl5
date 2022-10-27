package CryptoSquare;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<cipher>;

sub cipher {
    my ($text) = @_;

    $text = lc($text);
    $text =~ s/[^a-z0-9]//g;

    my ( $cols, $rows ) = ( 1, 0 );
    until ( $cols * $rows >= length($text) ) {
        if ( $cols > $rows ) {
            $rows++;
        }
        else {
            $cols++;
        }
    }

    $text .= ' ' x ( $cols * $rows - length($text) );

    my @matrix;
    for ( my $i = 0; $i < $cols * $rows; $i += $cols ) {
        push @matrix, [ split //, substr( $text, $i, $cols ) ];
    }

    my $result = '';
    for my $j ( 0 .. $cols - 1 ) {
        $result .= ' ' if $result;
        for my $k ( 0 .. $rows - 1 ) {
            $result .= $matrix[$k][$j];
        }
    }

    return $result;
}

1;
