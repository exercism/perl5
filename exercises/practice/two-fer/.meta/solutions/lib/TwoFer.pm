package TwoFer;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<two_fer>;

sub two_fer ( $name = 'you' ) {
    return "One for $name, one for me.";
}

1;
