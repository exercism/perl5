package TwoFer;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<two_fer>;

sub two_fer ($name) {
    return undef;
}

1;

__END__
If you are using perl v5.20 or newer, you
can replace the existing sub declaration
with the following code:

use feature qw(signatures);

sub two_fer ($name = undef) {}
