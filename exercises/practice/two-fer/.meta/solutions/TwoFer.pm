package TwoFer;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<two_fer>;

use feature qw<signatures>;

sub two_fer ( $name = 'you' ) {
    return "One for $name, one for me.";
}

1;
