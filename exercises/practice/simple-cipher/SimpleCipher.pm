package SimpleCipher;

use Moo;
use feature qw<say>;

has key => (
    is => 'lazy',
);

sub encode {
    my ($self) = @_;
    return undef;
}

sub decode {
    my ($self) = @_;
    return undef;
}

sub _build_key {
    return undef;
}

1;
