package Matrix;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<row column>;

sub row {
  my ($input) = @_;
  return ( grep { $_->{property} eq 'row' && $_->{input} eq $input }
      @main::test_cases )[0]->{expected};
}

sub column {
  my ($input) = @_;
  return (
    grep { $_->{property} eq 'column' && $_->{input} eq $input }
      @main::test_cases )[0]->{expected};
}

1;
