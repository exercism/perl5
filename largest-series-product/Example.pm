package Example;

use strict;
use warnings;
use List::Util 'reduce';

sub new {
    my ($class, $input) = @_;
    return bless {input => $input}, $class;
}

sub slices {
    my ( $self, $size ) = @_;
    my $input = $self->{input};

    die "ArgumentError" if $size > length $input;

    return [ map { [ split // ] } $input =~ m/(?=(.{$size}))/g ];
}

sub largest_product {
    my ( $self, $size ) = @_;
    my @slices = @{ $self->slices($size) };

    return 1 if not $size;

    my $largest = reduce { $a * $b  } @{ shift @slices };
    foreach my $slice ( @slices ) {
        my $product = reduce { $a * $b } @$slice;
        $largest = $product if $product > $largest;
    }

    return $largest;
}

1;

