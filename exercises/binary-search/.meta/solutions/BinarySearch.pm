package BinarySearch;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(binary_search);

sub binary_search {
  my ($input) = @_;

  #TODO: Not a proper solution
  foreach ( 0 .. $#{ $input->{array} } ) {
    return $_ if ${ $input->{array} }[$_] == $input->{value};
  }
  die;
}

1;
