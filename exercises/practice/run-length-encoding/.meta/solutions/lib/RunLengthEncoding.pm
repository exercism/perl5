package RunLengthEncoding;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode decode>;

sub encode ($string) {
    ( my $encoded = $string ) =~ s{(.)(\1+)}{(1 + length $2) . $1}ge;
    return $encoded;
}

sub decode ($string) {
    ( my $decoded = $string ) =~ s{(\d+)(.)}{$2 x $1}ge;
    return $decoded;
}

1;
