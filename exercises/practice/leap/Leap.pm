# Declare package 'Leap'
package Leap;

use strict;
use warnings;
use feature qw<say>;    # Use the `say` function to output debugging info in the online editor.

use Exporter qw<import>;
our @EXPORT_OK = qw<is_leap_year>;

sub is_leap_year {
    my ($year) = @_;
    return undef;    # Replace this with your own code to pass the tests.
}

1;
