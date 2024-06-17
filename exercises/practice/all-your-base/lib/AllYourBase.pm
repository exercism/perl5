package AllYourBase;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

my @errors = (
    'input base must be >= 2',
    'output base must be >= 2',
    'all digits must satisfy 0 <= d < input base',
);

sub rebase ( $digits, $input_base, $output_base ) {
    return undef;
}

1;
