# Declare package 'HelloWorld'
package HelloWorld;

use v5.44;

use Exporter qw<import>;
our @EXPORT_OK = qw<hello>;

sub hello () {
    return 'Goodbye, Mars!';
}

1;
