package Luhn;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid {
    my ($number) = @_;
    return undef;
}

1;
