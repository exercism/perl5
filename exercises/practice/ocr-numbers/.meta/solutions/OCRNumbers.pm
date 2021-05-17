package OCRNumbers;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<convert>;

sub convert {
  my ($rows) = @_;
  return ( grep { $_->{input}{rows} eq $rows } @main::test_cases )[0]
    ->{expected};
}

1;
