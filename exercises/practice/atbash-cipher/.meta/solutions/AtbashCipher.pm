package AtbashCipher;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

use List::Util qw<pairvalues>;

my %dict;
@dict{ 'a' .. 'z' } = reverse( 'a' .. 'z' );

sub encode_atbash {
  join( ' ', pairvalues split( /(\w{1,5})/, decode_atbash(@_) ) );
}

sub decode_atbash {
  join '',
    map { /\d/ ? $_ : $dict{$_} } split( //, lc $_[0] =~ s/\W//gr );
}

1;
