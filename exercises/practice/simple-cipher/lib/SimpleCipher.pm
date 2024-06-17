package SimpleCipher;

use v5.40;
use Moo;

has key => (
    is => 'lazy',
);

sub encode ($self) {
    return undef;
}

sub decode ($self) {
    return undef;
}

sub _build_key ($self) {
    return undef;
}

1;
