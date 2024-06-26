package PhoneNumber;

use v5.40;

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

sub clean_number ($number) {
    return undef;
}

1;
