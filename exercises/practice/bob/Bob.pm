# Declare package 'Bob'
package Bob;

use strict;
use warnings;
use feature qw<say>;    # Use the `say` function to output debugging info in the online editor.

use Exporter qw<import>;
our @EXPORT_OK = qw<hey>;

sub hey {
    my ($msg) = @_;
    return undef;    # Replace this with your own code to pass the tests.
}

1;
