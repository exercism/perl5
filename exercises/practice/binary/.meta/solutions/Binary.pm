package Binary;

use strict;
use warnings;

sub new {
    my ( $class, $binary ) = @_;
    my $self = bless { binary => $binary } => $class;

    return $self;
}

sub to_decimal {
    my $self = shift;

    return 0 if $self->{binary} =~ m/[^01]/;

    my $decimal = 0;
    my $index   = length $self->{binary};

    foreach my $bit ( split // => $self->{binary} ) {
        $decimal += $bit * 2** --$index;
    }

    return $decimal;
}

__PACKAGE__;
