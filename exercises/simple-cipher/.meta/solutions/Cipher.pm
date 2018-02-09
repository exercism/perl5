package Cipher;

use strict;
use warnings;
use List::Util qw(first);

sub new {
    my ($class, $key) = @_;
    
    if (defined $key and $key !~ /[a-z]/) {
        die "ArgumentError: $key" 
    } else {
        $key ||= "a";
    }

    return bless { keys => [ split '', $key ] };
}

sub encode {
    my ($self, $plaintext) = @_;
    my $cipher;
    my @plain_chars = split '' => do { $plaintext = lc $plaintext; $plaintext =~ s/[^a-z]//g; $plaintext  };

    $cipher .= $self->_shift_char( $plain_chars[$_], $_ ) for 0..$#plain_chars;

    return $cipher;
}

sub decode {
    my ($self, $cipher) = @_;
    my $plaintext;
    my @cipher_chars = split '' => $cipher;

    $plaintext .= $self->_shift_char( $cipher_chars[$_], $_ * -1) for 0..$#cipher_chars;

    return $plaintext;
}

sub _shift_char {
    my ($self, $plain, $index) = @_;

    my $char_key = $self->{keys}->[abs($index)] || 'a';
    my $shift_index = first { [('a'..'z')]->[$_] eq $char_key } (0..26);
    my $plain_index = first { [('a'..'z')]->[$_] eq $plain    } (0..26);

    return  [('a'..'z')]->[($plain_index - $shift_index) % 26] if ((caller(1))[3]) =~ /decode/;
    return  [('a'..'z')]->[($plain_index + $shift_index) % 26];
}

1;
