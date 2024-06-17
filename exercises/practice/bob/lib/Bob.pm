# Declare package 'Bob'
package Bob;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<hey>;

sub hey ($msg) {
    return undef; # Replace this with your own code to pass the tests.
}

1;
