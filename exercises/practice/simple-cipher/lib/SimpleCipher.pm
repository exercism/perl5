use experimental qw<class>;

class SimpleCipher;

field $key :reader :param = '';

method encode ($plaintext) {
    return undef;
}

method decode ($ciphertext) {
    return undef;
}

1;
