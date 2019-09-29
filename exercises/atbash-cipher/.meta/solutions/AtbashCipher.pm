package AtbashCipher;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(encode_atbash decode_atbash);

my %dict;
@dict{ 'a' .. 'z' } = reverse( 'a' .. 'z' );

sub encode_atbash {
  join( ' ', split( /(\w{5})/, decode_atbash(@_) ) ) =~ s/\s+/ /gr
    =~ s/^\s//r;
}

sub decode_atbash {
  join '',
    map { /\d/ ? $_ : $dict{$_} } split( //, lc $_[0] =~ s/\W//gr );
}

1;
