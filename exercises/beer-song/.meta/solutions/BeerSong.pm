package BeerSong;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(sing);

sub sing {
  my ($input) = @_;
  my @verses;
  for ( 1 .. $input->{verses} ) {
    if ( $input->{bottles} ) {
      my $s   = $input->{bottles} > 1  ? 's'  : '';
      my $one = $input->{bottles} == 1 ? 'it' : 'one';
      chomp( my $str = <<VERSE);
$input->{bottles} bottle$s of beer on the wall, $input->{bottles} bottle$s of beer.
Take $one down and pass it around, 
VERSE
      push @verses,
          $str
        . ( --$input->{bottles} || 'no more' )
        . ' bottle'
        . ( $input->{bottles} == 1 ? '' : 's' )
        . ' of beer on the wall.';
    }
    else {
      chomp( my $str = <<VERSE);
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
VERSE
      push @verses, $str;
    }
  }
  return join "\n\n", @verses;
}

1;
