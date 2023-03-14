package PhoneNumber;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<clean_number>;

my @errors = (
    '11 digits must start with 1',
    'must not be greater than 11 digits',
    'must not be fewer than 10 digits',
    'letters not permitted',
    'punctuations not permitted',
    'area code cannot start with zero',
    'area code cannot start with one',
    'exchange code cannot start with zero',
    'exchange code cannot start with one',
);

sub clean_number {
    my ($number) = @_;
    return undef;
}

1;
