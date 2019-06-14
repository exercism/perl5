package PascalsTriangle;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(pascal_rows);

sub pascal_rows {
  my ($rows) = @_;
  return '' if !$rows;

  my @result = ( [1] );
  for ( my $n = 0;; $n++ ) {
    return join "\n", map { join ' ', @$_ } @result
      if @result == $rows;
    push @result,
      [
      1,
      ( map { $result[$n]->[$_] + $result[$n]->[ $_ + 1 ] }
          0 .. $n - 1
      ),
      1
      ];
  }
}

1;
