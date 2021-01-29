package ETL;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<transform>;

sub transform {
  my ($data) = @_;
  return {
    map {
      my $val = $_;
      map { lc($_) => $val } @{ $data->{$_} }
    } keys %{$data}
  };
}

1;
