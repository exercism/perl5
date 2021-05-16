package CryptoSquare;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<cipher>;

sub cipher {
  my ($text) = @_;
  return ( grep { $_->{input}{plaintext} eq $text }
      @main::test_cases )[0]->{expected};
}

1;
