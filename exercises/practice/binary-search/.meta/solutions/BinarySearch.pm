package BinarySearch;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<binary_search>;

sub binary_search {
  my ($input) = @_;

  #TODO: Not a proper solution
  for ( 0 .. $#{ $input->{array} } ) {
    return $_ if ${ $input->{array} }[$_] == $input->{value};
  }
  die 'value not in array';
}

1;
