package TwoFer;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<two_fer>;

sub two_fer {
    my ($name) = @_;
    return undef;
}

1;

__END__
If you are using perl v5.20 or newer, you
can replace the existing sub declaration
with the following code:

use experimental qw(signatures);

sub two_fer ($name = undef) {}

1;
