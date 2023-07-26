package TwoFer;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<two_fer>;

sub two_fer ( $name = 'you' ) {
    return "One for $name, one for me.";
}

1;
