package SimpleCipher;

use Moo; use feature qw<say>;
use experimental qw<signatures postderef postderef_qq>;

has key => (
    is => 'lazy',
);

sub encode ( $self, $plaintext ) {
    my $key        = $self->key;
    my $key_length = length $key;
    my $ciphertext = '';
    for my $i ( 0 .. length($plaintext) - 1 ) {
        my $char     = substr( $plaintext, $i,               1 );
        my $key_char = substr( $key,       $i % $key_length, 1 );
        my $shift    = ord($key_char) - ord('a');
        my $new_char = chr( ( ord($char) - ord('a') + $shift ) % 26 + ord('a') );
        $ciphertext .= $new_char;
    }
    return $ciphertext;
}

sub decode ( $self, $ciphertext ) {
    my $key        = $self->key;
    my $key_length = length $key;
    my $plaintext  = '';
    for my $i ( 0 .. length($ciphertext) - 1 ) {
        my $char     = substr( $ciphertext, $i,               1 );
        my $key_char = substr( $key,        $i % $key_length, 1 );
        my $shift    = ord($key_char) - ord('a');
        my $new_char = chr( ( ord($char) - ord('a') - $shift + 26 ) % 26 + ord('a') );
        $plaintext .= $new_char;
    }
    return $plaintext;
}

sub _build_key {
    return join '', map { ( 'a' .. 'z' )[ rand 26 ] } 1 .. 100;
}

1;
