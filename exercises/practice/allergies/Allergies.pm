package Allergies;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<allergic_to list_allergies>;

sub allergic_to {
    my ( $item, $score ) = @_;
    return undef;
}

sub list_allergies {
    my ($score) = @_;
    return undef;
}

1;
