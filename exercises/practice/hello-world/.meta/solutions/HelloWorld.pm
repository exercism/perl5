# Declare package 'HelloWorld'
package HelloWorld;

use strict;
use warnings;
use feature qw<say>;    # Use the `say` function to output debugging info in the online editor.

use Exporter qw<import>;
our @EXPORT_OK = qw<hello>;

sub hello {
    return 'Hello, World!';
}

1;
