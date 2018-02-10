package SecretHandshake;

use strict;
use warnings;

my @com_strings = ('wink', 'double blink', 'close your eyes', 'jump');

sub new {
    my ($class, $number) = @_;
    return bless { number => $number };
}

sub commands {
    my $self = shift;

    return [] if $self->{number} !~ /\d/;
    
    my @commands;
    my @binary = split '' => reverse( substr( sprintf("%b", $self->{number}), -5) );

    foreach my $on (0..$#binary) {
        push @commands => $com_strings[$on] if $binary[$on] and $on < 4;
    }

    return [reverse @commands] if $binary[4];

    return \@commands;
}

1;

