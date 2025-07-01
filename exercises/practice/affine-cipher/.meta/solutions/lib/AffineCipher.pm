package AffineCipher;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode decode>;

sub encode ( $phrase, $a, $b ) {
    die "a and m must be coprime." unless _coprime($a);
    my $ret = '';
    foreach ( split( //, $phrase ) ) {
        next        if $_ eq ' ';
        $ret .= ' ' if ( $_ =~ /[[:alpha:]\d]/ && !( ( length($ret) + 1 ) % 6 ) );
        if ( ord( lc($_) ) < 97 ) {
            $ret .= $_ if ( $_ =~ /\d/ );
        } else {
            $ret .= chr( ( ( $a * ( ord( lc($_) ) - 97 ) + $b ) % 26 ) + 97 );
        }
    }
    return $ret;
}

sub decode ( $phrase, $a, $b ) {
    die "a and m must be coprime." unless _coprime($a);
    my ( $mmi, $ret ) = ( 0, '' );
    $mmi++ until ( ( $a * $mmi ) % 26 == 1 );
    foreach ( split( //, $phrase ) ) {
        next if $_ eq ' ';
        if ( ord( lc($_) ) < 97 ) {
            $ret .= $_ if ( $_ =~ /\d/ );
        } else {
            $ret .= chr( ( $mmi * ( ( ord( lc($_) ) - 97 ) - $b ) % 26 ) + 97 );
        }
    }
    return $ret;
}

sub _coprime ($a) {
    for ( 2 .. 26 ) {
        return 0 unless ( $a % $_ + 26 % $_ );
    }
    return 1;
}

1;
